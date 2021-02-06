# nim c --nimcache:.cache --app:lib -o:inc.so inc.nim
#{.deadCodeElim: off.}
#import fmuTemplate
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
## FMI functions
## ---------------------------------------------------------------------------







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