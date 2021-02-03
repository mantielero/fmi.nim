# nim c --nimcache:.cache --app:lib -o:inc.so inc.nim
import fmuTemplate
import strformat

# Porting inc.c (a particular model)
const
   MODEL_IDENTIFIER="inc"
   MODEL_GUID="{8c4e810f-3df3-4a00-8276-176fa3c9f008}"
   
   #define model size
   NUMBER_OF_REALS= 0
   NUMBER_OF_INTEGERS=1
   NUMBER_OF_BOOLEANS=0
   NUMBER_OF_STRINGS=0
   NUMBER_OF_STATES=0
   NUMBER_OF_EVENT_INDICATORS=0

const
   counter = 0




proc setStartValues(comp:ptr ModelInstance) {.exportc: "$1".} =
    comp.i[counter] = 1

proc calculateValues(comp:ptr ModelInstance) {.exportc: "$1".}=
    if comp.state == modelInitializationMode:
        # set first time event
        comp.eventInfo.nextEventTimeDefined = fmi2True
        comp.eventInfo.nextEventTime        = 1 + comp.time

proc eventUpdate(comp:ptr ModelInstance, eventInfo:ptr fmi2EventInfo, timeEvent:cint, isNewEventIteration:cint) {.exportc: "$1".} =
    if timeEvent != 0:
        comp.i[counter] += 1;
        if comp.i[counter] == 13:
            eventInfo.terminateSimulation  = fmi2True
            eventInfo.nextEventTimeDefined = fmi2False
        else:
            eventInfo.nextEventTimeDefined = fmi2True
            eventInfo.nextEventTime        = 1 + comp.time

#------------------------



#[
// array of value references of states
#if NUMBER_OF_STATES>0
fmi2ValueReference vrStates[NUMBER_OF_STATES] = STATES;
#endif

#ifndef max
#define max(a,b) ((a)>(b) ? (a) : (b))
#endif

#ifndef DT_EVENT_DETECT
#define DT_EVENT_DETECT 1e-10
#endif

]#

## ---------------------------------------------------------------------------
## Private helpers logger
## ---------------------------------------------------------------------------
proc isCategoryLogged(comp:ptr ModelInstance, categoryIndex:cint):fmi2Boolean {.exportc:"$1"} =
    ## return fmi2True if logging category is on. Else return fmi2False.
    if categoryIndex < NUMBER_OF_CATEGORIES and ((comp.logCategories[categoryIndex] > 0)or (comp.logCategories[LOG_ALL] > 0)):
        return fmi2True
    return fmi2False  


proc logCategoriesNames(idx: cint):fmi2String =
  let categoriesNames: seq[string] = @["logAll", "logError", "logFmiCall", "logEvent"]
  return categoriesNames[idx].fmi2String
 

proc filteredLog(instance:ptr ModelInstance, status:fmi2Status, categoryIndex:cint, message:cstring) =
   if status == fmi2Error or status == fmi2Fatal or isCategoryLogged(instance, categoryIndex) > 0:
      instance.functions.logger( instance.functions.componentEnvironment, instance.instanceName, status, 
                                 logCategoriesNames(categoryIndex), message )


## ---------------------------------------------------------------------------
## Private helpers used below to validate function arguments
## ---------------------------------------------------------------------------

proc invalidNumber( comp:ptr ModelInstance, f:cstring, arg:cstring, n:cint, nExpected:cint):fmi2Boolean {.exportc:"$1"} = 
    if n != nExpected:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = {n}. Expected {nExpected}.")
        return fmi2True
    return fmi2False

proc invalidState( comp:ptr ModelInstance, f:cstring, statesExpected:cint):fmi2Boolean  {.exportc:"$1"} =
    if comp.isNil:#comp  == nil:  # TODO: (!comp)
        return fmi2True
    if not (comp.state.cint > 0 and  statesExpected > 0):
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal call sequence." )
        return fmi2True
    
    return fmi2False

proc nullPointer(comp:ptr ModelInstance, f:cstring, arg:cstring, p:pointer):fmi2Boolean  {.exportc:"$1"} =
    if p.isNil:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = NULL.")
        return fmi2True
    
    return fmi2False

proc vrOutOfRange(comp:ptr ModelInstance, f:cstring,  vr:fmi2ValueReference, `end`:cint):fmi2Boolean  {.exportc:"$1"} =
    if vr.cint >= `end`:
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal value reference {vr}.")
        comp.state = modelError
        return fmi2True
    
    return fmi2False

proc unsupportedFunction(c:ModelInstance, fName:cstring, statesExpected:cint):fmi2Status  {.exportc:"$1"} =
    var comp:ptr ModelInstance = unsafeAddr(c)
    var log:fmi2CallbackLogger = comp.functions.logger
    if (invalidState(comp, fName, statesExpected) > 0):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fName)
    filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{fName}: Function not implemented.")
    return fmi2Error


proc setString(comp:ptr ModelInstance, vr:fmi2ValueReference, value:fmi2String):fmi2Status =
    return fmi2SetString(comp, &vr, 1, &value)


## ---------------------------------------------------------------------------
## FMI functions
## ---------------------------------------------------------------------------





proc fmi2FreeInstance(c: fmi2Component) =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if comp.isNil:
        return
    if (invalidState(comp, "fmi2FreeInstance", MASK_fmi2FreeInstance)):
        return
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2FreeInstance")

    if (comp.r):
       comp.functions.freeMemory(comp.r)
    if (comp.i):
       comp.functions.freeMemory(comp.i);
    if (comp.b):
       comp.functions.freeMemory(comp.b);
    if (comp.s) {
        var i:int
        for i in 0 ..< NUMBER_OF_STRINGS:
            if (comp.s[i]) comp.functions.freeMemory((void *)comp.s[i])
        
        comp.functions.freeMemory((void *)comp.s)
    
    if (comp.isPositive):
       comp.functions.freeMemory(comp.isPositive)
    if (comp.instanceName):
       comp.functions.freeMemory((void *)comp.instanceName)
    if (comp.GUID):
       comp.functions.freeMemory((void *)comp.GUID)
    comp.functions.freeMemory(comp)

proc fmi2SetupExperiment( c: fmi2Component, toleranceDefined: fmi2Boolean, 
                          tolerance: fmi2Real, startTime:fmi2Real, 
                          stopTimeDefined: fmi2Boolean, stopTime:fmi2Real): fmi2Status {.exportc:"$1"} =

    # ignore arguments: stopTimeDefined, stopTime
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetupExperiment", MASK_fmi2SetupExperiment.cint) > 0:
        return fmi2Error
    filteredLog( comp, fmi2OK, LOG_FMI_CALL, 
                 fmt"fmi2SetupExperiment: toleranceDefined={toleranceDefined} tolerance={tolerance}")
    comp.time = startTime
    return fmi2OK


proc fmi2EnterInitializationMode(c: fmi2Component): fmi2Status {.exportc:"$1"} =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2EnterInitializationMode", MASK_fmi2EnterInitializationMode.cint) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2EnterInitializationMode")

    comp.state = modelInitializationMode
    return fmi2OK

proc fmi2ExitInitializationMode(c: fmi2Component): fmi2Status {.exportc:"$1"} = 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2ExitInitializationMode", MASK_fmi2ExitInitializationMode.cint) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2ExitInitializationMode")

    # if values were set and no fmi2GetXXX triggered update before,
    # ensure calculated values are updated now
    if comp.isDirtyValues > 0:
        calculateValues(comp)
        comp.isDirtyValues = fmi2False

    if comp.`type` == fmi2ModelExchange:
        comp.state = modelEventMode
        comp.isNewEventIteration = fmi2True
    
    else:
        comp.state = modelStepComplete
    return fmi2OK


proc fmi2Terminate(c: fmi2Component): fmi2Status {.exportc:"$1"} = 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2Terminate", MASK_fmi2Terminate.cint) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2Terminate")

    comp.state = modelTerminated
    return fmi2OK


proc fmi2Reset(c:fmi2Component):fmi2Status {.exportc:"$1"} =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2Reset", MASK_fmi2Reset.cint) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2Reset")

    comp.state = modelInstantiated
    setStartValues(comp) # to be implemented by the includer of this file
    comp.isDirtyValues = fmi2True # because we just called setStartValues
    return fmi2OK



## ---------------------------------------------------------------------------
## FMI functions: logging control, setters and getters for Real, Integer,
## Boolean, String
## ---------------------------------------------------------------------------

proc fmi2SetDebugLogging( c: fmi2Component, loggingOn: fmi2Boolean, 
                          nCategories: size_t, categories: pointer):fmi2Status =  #categories: ptr fmi2String
    var i,j: int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetDebugLogging", MASK_fmi2SetDebugLogging.cint) > 0:
        return fmi2Error
    comp.loggingOn = loggingOn
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2SetDebugLogging")

    # reset all categories
    for j in 0 ..< NUMBER_OF_CATEGORIES:
        comp.logCategories[j] = fmi2False

    if nCategories == 0:
        # no category specified, set all categories to have loggingOn value
        for j in 0 ..< NUMBER_OF_CATEGORIES:
            comp.logCategories[j] = loggingOn
        
    else:
        # set specific categories on
        for i in 0 ..< nCategories:
            var categoryFound: fmi2Boolean  = fmi2False
            for j in 0 ..< NUMBER_OF_CATEGORIES:
                if not logCategoriesNames[j] == categories[i]:
                    comp.logCategories[j] = loggingOn
                    categoryFound = fmi2True
                    break
                
            
            if not categoryFound:
                comp.functions.logger( comp.componentEnvironment, comp.instanceName, fmi2Warning,
                    logCategoriesNames[LOG_ERROR],
                    fmt"logging category '{categories[i]}' is not supported by model" )
            
        
    
    return fmi2OK

proc fmi2GetReal(fmi2Component c, const fmi2ValueReference vr[], size_t nvr, fmi2Real value[]): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetReal", MASK_fmi2GetReal) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetReal", "vr[]", vr):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetReal", "value[]", value):
        return fmi2Error
    if nvr > 0 and comp.isDirtyValues > 0:
        calculateValues(comp)
        comp.isDirtyValues = fmi2False
    
    if NUMBER_OF_REALS > 0
        for i in 0 ..< nvr:
            if vrOutOfRange(comp, "fmi2GetReal", vr[i], NUMBER_OF_REALS):
                return fmi2Error
            value[i] = getReal(comp, vr[i]) # to be implemented by the includer of this file

            filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetReal: #r{vr[i]}# = {value[i]}" )
    return fmi2OK


proc fmi2GetInteger(c:fmi2Component, vr:const fmi2ValueReference vr[], nvr:size_t, values: fmi2Integer value[]): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetInteger", MASK_fmi2GetInteger.cint):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetInteger", "vr[]", vr):
            return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetInteger", "value[]", value):
            return fmi2Error
    if nvr > 0 and comp.isDirtyValues:
        calculateValues(comp)
        comp.isDirtyValues = fmi2False
    
    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2GetInteger", vr[i], NUMBER_OF_INTEGERS):
            return fmi2Error
        value[i] = comp.i[vr[i]]
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetInteger: #i{vr[i]}# = {value[i]}" )
    
    return fmi2OK

proc fmi2GetBoolean(fmi2Component c, const fmi2ValueReference vr[], size_t nvr, fmi2Boolean value[]):fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetBoolean", MASK_fmi2GetBoolean.cint):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetBoolean", "vr[]", vr):
            return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetBoolean", "value[]", value):
            return fmi2Error
    if nvr > 0 and comp.isDirtyValues > 0:
        calculateValues(comp)
        comp.isDirtyValues = fmi2False
    
    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2GetBoolean", vr[i], NUMBER_OF_BOOLEANS):
            return fmi2Error
        value[i] = comp.b[vr[i]]
        var tmp:string
        if value[i] > 0:
           tmp = "true"
        else:
           tmp = "false"

        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetBoolean: #b{vr[i]}# = {tmp}")
    
    return fmi2OK


proc fmi2GetString (c: fmi2Component, const fmi2ValueReference vr[], size_t nvr, fmi2String value[]): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetString", MASK_fmi2GetString.cint):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetString", "vr[]", vr) > 0:
            return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2GetString", "value[]", value) > 0:
            return fmi2Error
    if nvr > 0 and comp.isDirtyValues > 0:
        calculateValues(comp)
        comp.isDirtyValues = fmi2False
    
    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2GetString", vr[i], NUMBER_OF_STRINGS)) > 0:
            return fmi2Error
        value[i] = comp.s[vr[i]]
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetString: #s{vr[i]}# = '{value[i]}'")
    
    return fmi2OK


proc fmi2SetReal(c:fmi2Component, const fmi2ValueReference vr[], size_t nvr, const fmi2Real value[]): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetReal", MASK_fmi2SetReal.cint) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetReal", "vr[]", vr):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetReal", "value[]", value):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetReal: nvr = {nvr}" )
    # no check whether setting the value is allowed in the current state
    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2SetReal", vr[i], NUMBER_OF_REALS) > 0:
            return fmi2Error
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetReal: #r{vr[i]}# = {value[i]}")
        comp.r[vr[i]] = value[i]
    
    if nvr > 0:
       comp.isDirtyValues = fmi2True
    return fmi2OK


proc fmi2SetInteger(fmi2Component c, const fmi2ValueReference vr[], size_t nvr, const fmi2Integer value[]): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetInteger", MASK_fmi2SetInteger.cint) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetInteger", "vr[]", vr) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetInteger", "value[]", value) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetInteger: nvr = {nvr}")

    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2SetInteger", vr[i], NUMBER_OF_INTEGERS) > 0:
            return fmi2Error
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetInteger: #i{vr[i]}# = {value[i]}" )
        comp.i[vr[i]] = value[i]
    
    if nvr > 0:
       comp.isDirtyValues = fmi2True
    return fmi2OK


proc fmi2SetBoolean(c: fmi2Component, const fmi2ValueReference vr[], size_t nvr, const fmi2Boolean value[]): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetBoolean", MASK_fmi2SetBoolean.cint) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetBoolean", "vr[]", vr) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetBoolean", "value[]", value) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetBoolean: nvr = {nvr}")

    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2SetBoolean", vr[i], NUMBER_OF_BOOLEANS) > 0:
            return fmi2Error

        var tmp:string
        if value[i] > 0:
            tmp = "true"
        else:
            tmp = "false"
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetBoolean: #b{vr[i]}# = {tmp}")
        comp.b[vr[i]] = value[i]
    
    if nvr > 0: 
        comp.isDirtyValues = fmi2True

    return fmi2OK


proc fmi2SetString(c:fmi2Component, const fmi2ValueReference vr[], size_t nvr, const fmi2String value[]): fmi2Status =
    int i, n
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetString", MASK_fmi2SetString):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetString", "vr[]", vr) > 0:
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetString", "value[]", value) > 0:
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetString: nvr = {nvr}")

    for i in 0 ..< nvr:
        char *string = (char *)comp.s[vr[i]];
        if vrOutOfRange(comp, "fmi2SetString", vr[i], NUMBER_OF_STRINGS) > 0:
            return fmi2Error
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetString: #s{vr[i]}# = '{value[i]}'")

        if value[i].isNil:
            if (string) comp.functions.freeMemory(string):
                comp.s[vr[i]] = nil
            filteredLog(comp, fmi2Warning, LOG_ERROR, fmt"fmi2SetString: string argument value[{i}] = NULL.")
        else:
            if (string == NULL || strlen(string) < strlen(value[i])) {
                if (string) comp.functions.freeMemory(string);
                comp.s[vr[i]] = (char *)comp.functions.allocateMemory(1 + strlen(value[i]), sizeof(char));
                if (!comp.s[vr[i]]) {
                    comp.state = modelError;
                    filteredLog(comp, fmi2Error, LOG_ERROR, "fmi2SetString: Out of memory.")
                    return fmi2Error;
                }
            }
            strcpy((char *)comp.s[vr[i]], (char *)value[i]);
        }
    }
    if nvr > 0:
        comp.isDirtyValues = fmi2True
    return fmi2OK


proc fmi2GetFMUstate(c:fmi2Component, FMUstate: ptr fmi2FMUstate): fmi2Status =
    return unsupportedFunction(c, "fmi2GetFMUstate", MASK_fmi2GetFMUstate.cint)

proc fmi2SetFMUstate(c:fmi2Component, FMUstate: ptr fmi2FMUstate): fmi2Status =
    return unsupportedFunction(c, "fmi2SetFMUstate", MASK_fmi2SetFMUstate.cint)

proc fmi2FreeFMUstate(c:fmi2Component, FMUstate: ptr fmi2FMUstate): fmi2Status =
    return unsupportedFunction(c, "fmi2FreeFMUstate", MASK_fmi2FreeFMUstate.cint)


proc fmi2SerializedFMUstateSize(c:fmi2Component, FMUstate: ptr fmi2FMUstate,size: ptr size_t): fmi2Status =
    return unsupportedFunction(c, "fmi2SerializedFMUstateSize", MASK_fmi2SerializedFMUstateSize.cint)

proc fmi2SerializeFMUstate (c:fmi2Component, FMUstate: fmi2FMUstate, fmi2Byte serializedState[], size_t size): fmi2Status =
    return unsupportedFunction(c, "fmi2SerializeFMUstate", MASK_fmi2SerializeFMUstate.cint)

proc fmi2DeSerializeFMUstate ( fmi2Component c, const fmi2Byte serializedState[], size_t size,
                               FMUstate: ptr fmi2FMUstate ): fmi2Status =
    return unsupportedFunction(c, "fmi2DeSerializeFMUstate", MASK_fmi2DeSerializeFMUstate.cint)


proc fmi2GetDirectionalDerivative(fmi2Component c, const fmi2ValueReference vUnknown_ref[], size_t nUnknown,
                                        const fmi2ValueReference vKnown_ref[] , size_t nKnown,
                                        const fmi2Real dvKnown[], fmi2Real dvUnknown[]): fmi2Status =
    return unsupportedFunction(c, "fmi2GetDirectionalDerivative", MASK_fmi2GetDirectionalDerivative.cint)


## ---------------------------------------------------------------------------
## Functions for FMI for Co-Simulation
## ---------------------------------------------------------------------------
# Simulating the slave 
proc fmi2SetRealInputDerivatives( c:fmi2Component, const fmi2ValueReference vr[], size_t nvr,
                                  const fmi2Integer order[], const fmi2Real value[]): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetRealInputDerivatives", MASK_fmi2SetRealInputDerivatives) > 0:
        return fmi2Error
    
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetRealInputDerivatives: nvr= {nvr}")
    filteredLog(comp, fmi2Error, LOG_ERROR, fmt"fmi2SetRealInputDerivatives: ignoring function call.\n
         This model cannot interpolate inputs: canInterpolateInputs=\"{fmi2False}\"")
    return fmi2Error
}

proc  fmi2GetRealOutputDerivatives(fmi2Component c, const fmi2ValueReference vr[], size_t nvr,
                                      const fmi2Integer order[], fmi2Real value[]):fmi2Status {
    int i
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetRealOutputDerivatives", MASK_fmi2GetRealOutputDerivatives))
        return fmi2Error;
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetRealOutputDerivatives: nvr= {nvr}", nvr)
    filteredLog(comp, fmi2Error, LOG_ERROR, fmt"fmi2GetRealOutputDerivatives: ignoring function call.\n
        This model cannot compute derivatives of outputs: MaxOutputDerivativeOrder=\"0\"")
    for i in 0 ..< nvr:
        value[i] = 0
    return fmi2Error


proc  fmi2CancelStep(c:fmi2Component):fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2CancelStep", MASK_fmi2CancelStep.cint) > 0: 
        # always fmi2CancelStep is invalid, because model is never in modelStepInProgress state.
        return fmi2Error
    
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2CancelStep")
    filteredLog(comp, fmi2Error, LOG_ERROR,fmt"fmi2CancelStep: Can be called when fmi2DoStep returned fmi2Pending.\n This is not the case.")
    # comp.state = modelStepCanceled;
    return fmi2Error


proc  fmi2DoStep(c:fmi2Component c, fmi2Real currentCommunicationPoint,
                    fmi2Real communicationStepSize, fmi2Boolean noSetFMUStatePriorToCurrentPoint): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    var h:cdouble  = communicationStepSize / 10
    var k,i:int
    const
      n = 10 # how many Euler steps to perform for one do step
    double prevState[max(NUMBER_OF_STATES, 1)];
    double prevEventIndicators[max(NUMBER_OF_EVENT_INDICATORS, 1)];
    var stateEvent:int = 0
    var timeEvent:int = 0

    if (invalidState(comp, "fmi2DoStep", MASK_fmi2DoStep.cint)):
        return fmi2Error
    
    var tmp:string
    if noSetFMUStatePriorToCurrentPoint:
        tmp = "True"
    else:
        tmp = "False"
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2DoStep: \n
        currentCommunicationPoint = {currentCommunicationPoint}, 
        communicationStepSize = {communicationStepSize}, 
        noSetFMUStatePriorToCurrentPoint = fmi2{tmp}" )

    if (communicationStepSize <= 0):
        filteredLog(comp, fmi2Error, LOG_ERROR,
            fmt"fmi2DoStep: communication step size must be > 0. Fount {communicationStepSize}." )
        comp.state = modelError
        return fmi2Error
    

    if NUMBER_OF_EVENT_INDICATORS > 0:
        # initialize previous event indicators with current values
        for i in 0 ..< NUMBER_OF_EVENT_INDICATORS:
           prevEventIndicators[i] = getEventIndicator(comp, i)
    
    # break the step into n steps and do forward Euler.
    comp.time = currentCommunicationPoint
    for k in 0 ..< n:
        comp.time += h

    if NUMBER_OF_STATES > 0:
        for i in 0 ..< NUMBER_OF_STATES:
            prevState[i] = r(vrStates[i])
        
        for i in 0 ..< NUMBER_OF_STATES:
            var vr:fmi2ValueReference = vrStates[i]
            r(vr) += h * getReal(comp, vr + 1)  # forward Euler step

    if NUMBER_OF_EVENT_INDICATORS > 0:
        # check for state event
        for i in 0 ..< NUMBER_OF_EVENT_INDICATORS:
            var ei:double = getEventIndicator(comp, i)
            if ei * prevEventIndicators[i] < 0 :
                var tmp:string
                if ei < 0:
                    tmp = "\\"
                else:
                    tmp = "/"
                filteredLog(comp, fmi2OK, LOG_EVENT,
                    fmt"fmi2DoStep: state event at {comp.time}, z{i} crosses zero -{tmp}-")
                stateEvent++
            
            prevEventIndicators[i] = ei
        

        # check for time event
        if (comp.eventInfo.nextEventTimeDefined and (comp.time - comp.eventInfo.nextEventTime > -DT_EVENT_DETECT)):
            filteredLog(comp, fmi2OK, LOG_EVENT, fmt"fmi2DoStep: time event detected at {comp.time}" )
            timeEvent = 1
        

        if (stateEvent or timeEvent):
            eventUpdate(comp, &comp.eventInfo, timeEvent, fmi2True)
            timeEvent = 0
            stateEvent = 0
        

        # terminate simulation, if requested by the model in the previous step
        if (comp.eventInfo.terminateSimulation):
            filteredLog(comp, fmi2Discard, LOG_ALL, fmt"fmi2DoStep: model requested termination at t={comp.time}")
            comp.state = modelStepFailed
            return fmi2Discard # enforce termination of the simulation loop
    
    return fmi2OK

## ---------------------------------------------------------------------------
## Functions for FMI for Co-Simulation
## ---------------------------------------------------------------------------
# Simulating the slave 
proc  fmi2SetRealInputDerivatives(c:fmi2Component, const fmi2ValueReference vr[], size_t nvr,
                                     const fmi2Integer order[], const fmi2Real value[]): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2SetRealInputDerivatives", MASK_fmi2SetRealInputDerivatives)) {
        return fmi2Error
    
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetRealInputDerivatives: nvr= {nvr}")
    filteredLog(comp, fmi2Error, LOG_ERROR, "fmi2SetRealInputDerivatives: ignoring function call.\n
        This model cannot interpolate inputs: canInterpolateInputs=\"fmi2False\"")
    return fmi2Error

proc  fmi2GetRealOutputDerivatives(fmi2Component c, const fmi2ValueReference vr[], size_t nvr,
                                      const fmi2Integer order[], fmi2Real value[]): fmi2Status =
    var i:int 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetRealOutputDerivatives", MASK_fmi2GetRealOutputDerivatives))
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetRealOutputDerivatives: nvr= %d", nvr)
    filteredLog(comp, fmi2Error, LOG_ERROR,"fmi2GetRealOutputDerivatives: ignoring function call."
        " This model cannot compute derivatives of outputs: MaxOutputDerivativeOrder=\"0\"")
    for i in 0 ..< nvr:
        value[i] = 0
    return fmi2Error

proc fmi2CancelStep(c:fmi2Component):fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2CancelStep", MASK_fmi2CancelStep)) {
        // always fmi2CancelStep is invalid, because model is never in modelStepInProgress state.
        return fmi2Error;
    }
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2CancelStep")
    filteredLog(comp, fmi2Error, LOG_ERROR,"fmi2CancelStep: Can be called when fmi2DoStep returned fmi2Pending."
        " This is not the case.");
    // comp.state = modelStepCanceled;
    return fmi2Error;
}

proc fmi2DoStep( c: fmi2Component, currentCommunicationPoint: fmi2Real,
                 communicationStepSize: fmi2Real, noSetFMUStatePriorToCurrentPoint: fmi2Boolean ): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    var h:double = communicationStepSize / 10
    var k,i:int
    const 
        n:int = 10 # how many Euler steps to perform for one do step
    double prevState[max(NUMBER_OF_STATES, 1)];
    double prevEventIndicators[max(NUMBER_OF_EVENT_INDICATORS, 1)];
    var stateEvent:int = 0
    var timeEvent:int = 0

    if (invalidState(comp, "fmi2DoStep", MASK_fmi2DoStep)):
        return fmi2Error

    var tmp:string = "False"
    if noSetFMUStatePriorToCurrentPoint:
        tmp = "True"
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2DoStep: \n
        currentCommunicationPoint = {currentCommunicationPoint}, \n
        communicationStepSize = {communicationStepSize}, \n
        noSetFMUStatePriorToCurrentPoint = fmi2{tmp}")

    if (communicationStepSize <= 0):
        filteredLog(comp, fmi2Error, LOG_ERROR,
            fmt"fmi2DoStep: communication step size must be > 0. Fount {communicationStepSize}.", )
        comp.state = modelError
        return fmi2Error
    

    if NUMBER_OF_EVENT_INDICATORS > 0:
        # initialize previous event indicators with current values
        for i in 0 ..< NUMBER_OF_EVENT_INDICATORS:
            prevEventIndicators[i] = getEventIndicator(comp, i)
        
    

    # break the step into n steps and do forward Euler.
    comp.time = currentCommunicationPoint;
    for k in 0 ..< n:
        comp.time += h

    if NUMBER_OF_STATES > 0:
            for i in 0 ..< NUMBER_OF_STATES:
                prevState[i] = r(vrStates[i])
            
            for i in 0 ..< NUMBER_OF_STATES:
                var vr: fmi2ValueReference  = vrStates[i]
                r(vr) += h * getReal(comp, vr + 1) # forward Euler step
            
    

    if NUMBER_OF_EVENT_INDICATORS > 0:
            # check for state event
            for i in 0 ..< NUMBER_OF_EVENT_INDICATORS:
                var ei:double = getEventIndicator(comp, i)
                if (ei * prevEventIndicators[i] < 0):
                    filteredLog(comp, fmi2OK, LOG_EVENT,
                        fmt"fmi2DoStep: state event at {comp.time}, z{i} crosses zero -%c-",  i, ei < 0 ? '\\' : '/')
                    stateEvent++
                
                prevEventIndicators[i] = ei
            
    
        # check for time event
        if (comp.eventInfo.nextEventTimeDefined && (comp.time - comp.eventInfo.nextEventTime > -DT_EVENT_DETECT)) {
            filteredLog(comp, fmi2OK, LOG_EVENT, fmt"fmi2DoStep: time event detected at {comp.time}")
            timeEvent = 1
        

        if (stateEvent or timeEvent):
            eventUpdate(comp, &comp.eventInfo, timeEvent, fmi2True)
            timeEvent = 0
            stateEvent = 0
        

        # terminate simulation, if requested by the model in the previous step
        if (comp.eventInfo.terminateSimulation):
            filteredLog(comp, fmi2Discard, LOG_ALL, fmt"fmi2DoStep: model requested termination at t={comp.time}")
            comp.state = modelStepFailed
            return fmi2Discard # enforce termination of the simulation loop
        
    
    return fmi2OK


# Inquire slave status 
proc getStatus(fname:cstring, c: fmi2Component, s:const fmi2StatusKind): fmi2Status =
    const char *statusKind[3] = {"fmi2DoStepStatus","fmi2PendingStatus","fmi2LastSuccessfulTime"}
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, fname, MASK_fmi2GetStatus.cint)) # all get status have the same MASK_fmi2GetStatus
            return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"{fname}: fmi2StatusKind = {statusKind[s]}" )

    switch(s) {
        case fmi2DoStepStatus: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2DoStepStatus when fmi2DoStep returned fmi2Pending."
            " This is not the case.", fname)
            break;
        case fmi2PendingStatus: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2PendingStatus when fmi2DoStep returned fmi2Pending."
            " This is not the case.", fname)
            break;
        case fmi2LastSuccessfulTime: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2LastSuccessfulTime when fmi2DoStep returned fmi2Discard."
            " This is not the case.", fname)
            break;
        case fmi2Terminated: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2Terminated when fmi2DoStep returned fmi2Discard."
            " This is not the case.", fname)
            break;
    
    return fmi2Discard

proc fmi2GetStatus(c: fmi2Component, const fmi2StatusKind s, fmi2Status *value): fmi2Status =
    return getStatus("fmi2GetStatus", c, s)


proc fmi2GetRealStatus(fmi2Component c, const fmi2StatusKind s, fmi2Real *value): fmi2Status =
    if (s == fmi2LastSuccessfulTime):
        var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
        if invalidState(comp, "fmi2GetRealStatus", MASK_fmi2GetRealStatus):
            return fmi2Error
        *value = comp.time
        return fmi2OK
    
    return getStatus("fmi2GetRealStatus", c, s)

proc fmi2GetIntegerStatus(fmi2Component c, const fmi2StatusKind s, fmi2Integer *value):fmi2Status =
    return getStatus("fmi2GetIntegerStatus", c, s)


proc fmi2GetBooleanStatus(fmi2Component c, const fmi2StatusKind s, fmi2Boolean *value): fmi2Status =
    if (s == fmi2Terminated):
        var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
        if (invalidState(comp, "fmi2GetBooleanStatus", MASK_fmi2GetBooleanStatus)):
            return fmi2Error
        *value = comp.eventInfo.terminateSimulation
        return fmi2OK
    
    return getStatus("fmi2GetBooleanStatus", c, s)


proc fmi2GetStringStatus(fmi2Component c, const fmi2StatusKind s, fmi2String *value): fmi2Status =
    return getStatus("fmi2GetStringStatus", c, s)

## ---------------------------------------------------------------------------
## Functions for FMI for Co-Simulation
## ---------------------------------------------------------------------------
# Simulating the slave 
proc fmi2SetRealInputDerivatives(fmi2Component c, const fmi2ValueReference vr[], size_t nvr,
                                     const fmi2Integer order[], const fmi2Real value[]): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2SetRealInputDerivatives", MASK_fmi2SetRealInputDerivatives)):
        return fmi2Error
    
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2SetRealInputDerivatives: nvr= %d", nvr)
    filteredLog(comp, fmi2Error, LOG_ERROR, "fmi2SetRealInputDerivatives: ignoring function call."
        " This model cannot interpolate inputs: canInterpolateInputs=\"fmi2False\"")
    return fmi2Error

proc fmi2GetRealOutputDerivatives(fmi2Component c, const fmi2ValueReference vr[], size_t nvr,
                                      const fmi2Integer order[], fmi2Real value[]): fmi2Status =
    var i:int 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetRealOutputDerivatives", MASK_fmi2GetRealOutputDerivatives)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetRealOutputDerivatives: nvr= %d", nvr)
    filteredLog(comp, fmi2Error, LOG_ERROR,"fmi2GetRealOutputDerivatives: ignoring function call."
        " This model cannot compute derivatives of outputs: MaxOutputDerivativeOrder=\"0\"")
    for i in 0 ..< nvr:
        value[i] = 0
    return fmi2Error


proc fmi2CancelStep(c:fmi2Component): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2CancelStep", MASK_fmi2CancelStep.cint)):
        # always fmi2CancelStep is invalid, because model is never in modelStepInProgress state.
        return fmi2Error
    
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2CancelStep")
    filteredLog(comp, fmi2Error, LOG_ERROR,"fmi2CancelStep: Can be called when fmi2DoStep returned fmi2Pending."
        " This is not the case.")
    # comp.state = modelStepCanceled;
    return fmi2Error;


proc fmi2DoStep(fmi2Component c, fmi2Real currentCommunicationPoint,
                    fmi2Real communicationStepSize, fmi2Boolean noSetFMUStatePriorToCurrentPoint): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    var h:double  = communicationStepSize / 10
    var k,i:int
    const 
        n:int = 10 # how many Euler steps to perform for one do step
    double prevState[max(NUMBER_OF_STATES, 1)];
    double prevEventIndicators[max(NUMBER_OF_EVENT_INDICATORS, 1)];
    var stateEvent:int = 0
    var timeEvent:int = 0

    if (invalidState(comp, "fmi2DoStep", MASK_fmi2DoStep.cint)):
        return fmi2Error

    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2DoStep: "
        "currentCommunicationPoint = %g, "
        "communicationStepSize = %g, "
        "noSetFMUStatePriorToCurrentPoint = fmi2%s",
        currentCommunicationPoint, communicationStepSize, noSetFMUStatePriorToCurrentPoint ? "True" : "False")

    if (communicationStepSize <= 0):
        filteredLog(comp, fmi2Error, LOG_ERROR,
            "fmi2DoStep: communication step size must be > 0. Fount %g.", communicationStepSize)
        comp.state = modelError
        return fmi2Error
    

    if NUMBER_OF_EVENT_INDICATORS > 0:
        # initialize previous event indicators with current values
        for i in 0 ..< NUMBER_OF_EVENT_INDICATORS:
            prevEventIndicators[i] = getEventIndicator(comp, i)
        

    # break the step into n steps and do forward Euler.
    comp.time = currentCommunicationPoint
    for k in 0 ..< n:
        comp.time += h

    if NUMBER_OF_STATES > 0:
        for i in 0 ..< NUMBER_OF_STATES:
            prevState[i] = r(vrStates[i])
        
        for i in 0 ..< NUMBER_OF_STATES:
            fmi2ValueReference vr = vrStates[i]
            r(vr) += h * getReal(comp, vr + 1)  # forward Euler step
        


    if NUMBER_OF_EVENT_INDICATORS > 0:
        # check for state event
        for i in 0 ..< NUMBER_OF_EVENT_INDICATORS:
            double ei = getEventIndicator(comp, i)
            if (ei * prevEventIndicators[i] < 0):
                filteredLog(comp, fmi2OK, LOG_EVENT,
                    "fmi2DoStep: state event at %g, z%d crosses zero -%c-", comp.time, i, ei < 0 ? '\\' : '/')
                stateEvent++
            
            prevEventIndicators[i] = ei
        

        # check for time event
        if (comp.eventInfo.nextEventTimeDefined && (comp.time - comp.eventInfo.nextEventTime > -DT_EVENT_DETECT)):
            filteredLog(comp, fmi2OK, LOG_EVENT, fmt"fmi2DoStep: time event detected at {comp.time}")
            timeEvent = 1
        

        if (stateEvent or timeEvent):
            eventUpdate(comp, &comp.eventInfo, timeEvent, fmi2True);
            timeEvent = 0
            stateEvent = 0
        

        # terminate simulation, if requested by the model in the previous step
        if (comp.eventInfo.terminateSimulation):
            filteredLog(comp, fmi2Discard, LOG_ALL, "fmi2DoStep: model requested termination at t=%g", comp.time)
            comp.state = modelStepFailed;
            return fmi2Discard # enforce termination of the simulation loop
        
    
    return fmi2OK


# Inquire slave status
proc  getStatus(char* fname, fmi2Component c, const fmi2StatusKind s): fmi2Status =
    const char *statusKind[3] = {"fmi2DoStepStatus","fmi2PendingStatus","fmi2LastSuccessfulTime"};
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, fname, MASK_fmi2GetStatus)): # all get status have the same MASK_fmi2GetStatus
            return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"{fname}: fmi2StatusKind = {statusKind[s]}")

    switch(s) {
        case fmi2DoStepStatus: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2DoStepStatus when fmi2DoStep returned fmi2Pending."
            " This is not the case.", fname)
            break;
        case fmi2PendingStatus: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2PendingStatus when fmi2DoStep returned fmi2Pending."
            " This is not the case.", fname)
            break;
        case fmi2LastSuccessfulTime: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2LastSuccessfulTime when fmi2DoStep returned fmi2Discard."
            " This is not the case.", fname)
            break;
        case fmi2Terminated: filteredLog(comp, fmi2Error, LOG_ERROR,
            "%s: Can be called with fmi2Terminated when fmi2DoStep returned fmi2Discard."
            " This is not the case.", fname)
            break;
    }
    return fmi2Discard

proc fmi2GetStatus(c:fmi2Component, const fmi2StatusKind s, fmi2Status *value):fmi2Status =
    return getStatus("fmi2GetStatus", c, s)

proc fmi2GetRealStatus(fmi2Component c, const fmi2StatusKind s, fmi2Real *value): fmi2Status =
    if (s == fmi2LastSuccessfulTime):
        var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
        if (invalidState(comp, "fmi2GetRealStatus", MASK_fmi2GetRealStatus)):
            return fmi2Error
        *value = comp.time
        return fmi2OK
    
    return getStatus("fmi2GetRealStatus", c, s)


proc fmi2GetIntegerStatus(c: fmi2Component, const fmi2StatusKind s, fmi2Integer *value): fmi2Status =
    return getStatus("fmi2GetIntegerStatus", c, s)


proc fmi2GetBooleanStatus(fmi2Component c, const fmi2StatusKind s, fmi2Boolean *value): fmi2Status =
    if (s == fmi2Terminated):
        var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
        if (invalidState(comp, "fmi2GetBooleanStatus", MASK_fmi2GetBooleanStatus)):
            return fmi2Error
        *value = comp.eventInfo.terminateSimulation
        return fmi2OK
    
    return getStatus("fmi2GetBooleanStatus", c, s)


proc fmi2GetStringStatus(fmi2Component c, const fmi2StatusKind s, fmi2String *value): fmi2Status =
    return getStatus("fmi2GetStringStatus", c, s)



## ---------------------------------------------------------------------------
## Functions for FMI2 for Model Exchange
## ---------------------------------------------------------------------------
# Enter and exit the different modes 
proc fmi2EnterEventMode(c: fmi2Component): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2EnterEventMode", MASK_fmi2EnterEventMode.cint)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2EnterEventMode")

    comp.state = modelEventMode
    comp.isNewEventIteration = fmi2True
    return fmi2OK


proc fmi2NewDiscreteStates(fmi2Component c, fmi2EventInfo *eventInfo): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    int timeEvent = 0
    if (invalidState(comp, "fmi2NewDiscreteStates", MASK_fmi2NewDiscreteStates.cint)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2NewDiscreteStates")

    comp.eventInfo.newDiscreteStatesNeeded = fmi2False
    comp.eventInfo.terminateSimulation = fmi2False
    comp.eventInfo.nominalsOfContinuousStatesChanged = fmi2False
    comp.eventInfo.valuesOfContinuousStatesChanged = fmi2False

    if (comp.eventInfo.nextEventTimeDefined and comp.eventInfo.nextEventTime <= comp.time):
        timeEvent = 1
    
    eventUpdate(comp, &comp.eventInfo, timeEvent, comp.isNewEventIteration)
    comp.isNewEventIteration = fmi2False

    # copy internal eventInfo of component to output eventInfo
    eventInfo.newDiscreteStatesNeeded = comp.eventInfo.newDiscreteStatesNeeded
    eventInfo.terminateSimulation = comp.eventInfo.terminateSimulation
    eventInfo.nominalsOfContinuousStatesChanged = comp.eventInfo.nominalsOfContinuousStatesChanged
    eventInfo.valuesOfContinuousStatesChanged = comp.eventInfo.valuesOfContinuousStatesChanged
    eventInfo.nextEventTimeDefined = comp.eventInfo.nextEventTimeDefined
    eventInfo.nextEventTime = comp.eventInfo.nextEventTime

    return fmi2OK


proc fmi2EnterContinuousTimeMode(c: fmi2Component): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2EnterContinuousTimeMode", MASK_fmi2EnterContinuousTimeMode.cint)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL,"fmi2EnterContinuousTimeMode")

    comp.state = modelContinuousTimeMode
    return fmi2OK


proc fmi2CompletedIntegratorStep(fmi2Component c, fmi2Boolean noSetFMUStatePriorToCurrentPoint,
                                     fmi2Boolean *enterEventMode, fmi2Boolean *terminateSimulation): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2CompletedIntegratorStep", MASK_fmi2CompletedIntegratorStep.cint)):
        return fmi2Error
    if (nullPointer(comp, "fmi2CompletedIntegratorStep", "enterEventMode", enterEventMode)):
        return fmi2Error
    if (nullPointer(comp, "fmi2CompletedIntegratorStep", "terminateSimulation", terminateSimulation)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL,"fmi2CompletedIntegratorStep"):
    *enterEventMode = fmi2False
    *terminateSimulation = fmi2False
    return fmi2OK


# Providing independent variables and re-initialization of caching 
proc fmi2SetTime(fmi2Component c, fmi2Real time): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2SetTime", MASK_fmi2SetTime)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2SetTime: time=%.16g", time)
    comp.time = time
    return fmi2OK


proc fmi2SetContinuousStates(c: fmi2Component, const fmi2Real x[], size_t nx): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    var i:int
    if (invalidState(comp, "fmi2SetContinuousStates", MASK_fmi2SetContinuousStates)):
        return fmi2Error
    if (invalidNumber(comp, "fmi2SetContinuousStates", "nx", nx, NUMBER_OF_STATES)):
        return fmi2Error
    if (nullPointer(comp, "fmi2SetContinuousStates", "x[]", x)):
        return fmi2Error
    if NUMBER_OF_STATES > 0
        for i in 0 ..< nx:
            var vr: fmi2ValueReference = vrStates[i]
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2SetContinuousStates: #r%d#=%.16g", vr, x[i])
            assert(vr < NUMBER_OF_REALS)
            comp,r[vr] = x[i]
    
    return fmi2OK


# Evaluation of the model equations 
proc fmi2GetDerivatives(fmi2Component c, fmi2Real derivatives[], size_t nx): fmi2Status =
    var i:int 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetDerivatives", MASK_fmi2GetDerivatives)):
        return fmi2Error
    if (invalidNumber(comp, "fmi2GetDerivatives", "nx", nx, NUMBER_OF_STATES)):
        return fmi2Error
    if (nullPointer(comp, "fmi2GetDerivatives", "derivatives[]", derivatives)):
        return fmi2Error
    if NUMBER_OF_STATES > 0:
        for i in 0 ..< nx:
            var vr: fmi2ValueReference = vrStates[i] + 1
            derivatives[i] = getReal(comp, vr)  # to be implemented by the includer of this file
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetDerivatives: #r%d# = %.16g", vr, derivatives[i])
    
    return fmi2OK


proc fmi2GetEventIndicators(fmi2Component c, fmi2Real eventIndicators[], size_t ni): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetEventIndicators", MASK_fmi2GetEventIndicators.cint)):
        return fmi2Error
    if (invalidNumber(comp, "fmi2GetEventIndicators", "ni", ni, NUMBER_OF_EVENT_INDICATORS)):
        return fmi2Error
    if NUMBER_OF_EVENT_INDICATORS > 0:
        for i in 0 ..< ni:
            eventIndicators[i] = getEventIndicator(comp, i) # to be implemented by the includer of this file
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetEventIndicators: z%d = %.16g", i, eventIndicators[i])
    
    return fmi2OK


proc fmi2GetContinuousStates(fmi2Component c, fmi2Real states[], size_t nx): fmi2Status =
    var i:int
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetContinuousStates", MASK_fmi2GetContinuousStates)):
        return fmi2Error
    if (invalidNumber(comp, "fmi2GetContinuousStates", "nx", nx, NUMBER_OF_STATES)):
        return fmi2Error
    if (nullPointer(comp, "fmi2GetContinuousStates", "states[]", states)):
        return fmi2Error
    if NUMBER_OF_STATES > 0:
        for i in 0 ..< nx:
            var vr:fmi2ValueReference = vrStates[i]
            states[i] = getReal(comp, vr) # to be implemented by the includer of this file
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetContinuousStates: #r%u# = %.16g", vr, states[i])
        
    return fmi2OK


proc fmi2GetNominalsOfContinuousStates(fmi2Component c, fmi2Real x_nominal[], size_t nx): fmi2Status =
    var i: int 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if (invalidState(comp, "fmi2GetNominalsOfContinuousStates", MASK_fmi2GetNominalsOfContinuousStates)):
        return fmi2Error
    if (invalidNumber(comp, "fmi2GetNominalContinuousStates", "nx", nx, NUMBER_OF_STATES)):
        return fmi2Error
    if (nullPointer(comp, "fmi2GetNominalContinuousStates", "x_nominal[]", x_nominal)):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetNominalContinuousStates: x_nominal[0..%d] = 1.0", nx-1):
    for i in 0 ..< nx:
        x_nominal[i] = 1
    return fmi2OK




{.passC: "-Ifmusdk-master/fmu20/src/shared/include/ -w -fmax-errors=5" .}

{.passC: "-DMODEL_IDENTIFIER=\\\"" & MODEL_IDENTIFIER & "\\\"".}
{.passC: "-DMODEL_GUID=\\\"" & MODEL_GUID & "\\\"".}
{.passC: "-DNUMBER_OF_REALS=" & $NUMBER_OF_REALS .}
{.passC: "-DNUMBER_OF_INTEGERS=" & $NUMBER_OF_INTEGERS .}
{.passC: "-DNUMBER_OF_BOOLEANS=" & $NUMBER_OF_BOOLEANS .}
{.passC: "-DNUMBER_OF_STRINGS=" & $NUMBER_OF_STRINGS .}
{.passC: "-DNUMBER_OF_STATES=" & $NUMBER_OF_STATES .}
{.passC: "-DNUMBER_OF_EVENT_INDICATORS=" & $NUMBER_OF_EVENT_INDICATORS .}
#{.passC: "-include ../fmuTemplate.h".}
{.compile: "fmusdk-master/fmu20/src/models/fmuTemplate2.c".} # Edited (with #include "fmuTemplate.h")