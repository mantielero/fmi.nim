import model
import modelinstancetype
import fmi2TypesPlatform, fmi2type, fmi2callbackfunctions, modelstate, fmi2eventinfo, logger
import strformat
import masks, helpers, getters, setters, status

# https://forum.nim-lang.org/t/7182#45378
# https://forum.nim-lang.org/t/6980#43777mf


##  Creation and destruction of FMU instances and setting debug status

# fmi2InstantiateTYPE* {.impfmuTemplate.} = proc(a1: fmi2String, a2: fmi2Type, a3: fmi2String, a4: fmi2String, a5: ptr fmi2CallbackFunctions, a6: fmi2Boolean, a7: fmi2Boolean): fmi2Component {.cdecl.}
# fmi2FreeInstanceTYPE* {.impfmuTemplate.} = proc(a1: fmi2Component) {.cdecl.}


{.push exportc: "$1",dynlib,cdecl.}

proc fmi2Instantiate*( instanceName: fmi2String, fmuType: fmi2Type, 
                      fmuGUID: fmi2String, fmuResourceLocation: fmi2String,
                      functions: ptr fmi2CallbackFunctions, visible: fmi2Boolean, 
                      loggingOn: fmi2Boolean): fmi2Component =
    ##[ ignoring arguments: fmuResourceLocation, visible
    (pag.19)
    The function returns a new instance of an FMU or a null pointer when failed.
    
    An FMU can be instantiated many times (provided capability flag
    canBeInstantiatedOnlyOncePerProcess = false).

    This function must be called successfully before any of the following functions can be called.
    For co-simulation, this function call has to perform all actions of a slave which are necessary
    before a simulation run starts (for example, loading the model file, compilation...).

    Argument instanceName is a unique identifier for the FMU instance. It is used to name the
    instance, for example, in error or information messages generated by one of the fmi2XXX  
    functions. It is not allowed to provide a null pointer and this string must be non-empty (in
    other words, must have at least one character that is no white space). [If only one FMU is
    simulated, as instanceName attribute modelName or <ModelExchange/CoSimulation
    modelIdentifier=”..”> from the XML schema fmiModelDescription might be used.]

    Argument fmuType defines the type of the FMU:
     = fmi2ModelExchange: FMU with initialization and events; between events simulation
    of continuous systems is performed with external integrators from the environment
    (see section 3).
     = fmi2CoSimulation: Black box interface for co-simulation (see section 4).

    Argument fmuGUID is used to check that the modelDescription.xml file (see section 2.3) is
    compatible with the C code of the FMU. It is a vendor specific globally unique identifier of the
    XML file (for example, it is a “fingerprint” of the relevant information stored in the XML file). It
    is stored in the XML file as attribute “guid” (see section 0) and has to be passed to the
    fmi2Instantiate function via argument fmuGUID. It must be identical to the one stored
    inside the fmi2Instantiate function; otherwise the C code and the XML file of the FMU
    are not consistent with each other. This argument cannot be null.

    Argument fmuResourceLocation is a URI according to the IETF RFC3986 syntax to
    indicate the location to the “resources” directory of the unzipped FMU archive. The
    following schemes must be understood by the FMU:
    Mandatory: “file” with absolute path (either including or omitting the authority component)
     Optional: “http”, “https”, “ftp”
     Reserved: “fmi2” for FMI for PLM.

    [Example: An FMU is unzipped in directory “C:\temp\MyFMU”, then
    fmuResourceLocation = “file:///C:/temp/MyFMU/resources” or
    “file:/C:/temp/MyFMU/resources”. Function fmi2Instantiate is then able to read all
    needed resources from this directory, for example maps or tables used by the FMU.]
    Argument functions provides callback functions to be used from the FMU functions to
    utilize resources from the environment (see type fmi2CallbackFunctions below).

    Argument visible = fmi2False defines that the interaction with the user should be
    reduced to a minimum (no application window, no plotting, no animation, etc.). In other
    words, the FMU is executed in batch mode. If visible = fmi2True, the FMU is executed
    in interactive mode, and the FMU might require to explicitly acknowledge start of simulation /
    instantiation / initialization (acknowledgment is non-blocking).

    If loggingOn = fmi2True, debug logging is enabled. If loggingOn = fmi2False, debug
    logging is disabled. [The FMU enable/disables LogCategories which are useful for
    debugging according to this argument. Which LogCategories the FMU sets is unspecified.]      
    ]##
    #var comp = ptr ModelInstance
    #var comp:ptr ModelInstance
    #echo repr functions
    let f = cast[fmi2CallbackFunctions](functions)

    # Case: we don't even have a logger
    
    if f.logger.isNil:
        return nil

    if f.allocateMemory.isNil or f.freeMemory.isNil:
        f.logger( functions.componentEnvironment, instanceName, fmi2Error, "error".fmi2String,
                "fmi2Instantiate: Missing callback function.".fmi2String)
        return nil
    
    if instanceName.isNil or instanceName.len == 0:
        f.logger( functions.componentEnvironment, "?", fmi2Error, "error",
                "fmi2Instantiate: Missing instance name.")
        return nil
    
    if fmuGUID.isNil or fmuGUID.len == 0:
        f.logger( functions.componentEnvironment, instanceName, fmi2Error, "error",
                  "fmi2Instantiate: Missing GUID.")
        return nil
    #let fmuGUID = $(fmuGUID)
    if not ($(fmuGUID) == MODEL_GUID): #strcmp(fmuGUID, MODEL_GUID)) {
        f.logger( functions.componentEnvironment, instanceName, fmi2Error, "error",
                  fmt"fmi2Instantiate: Wrong GUID {$(fmuGUID)}. Expected {MODEL_GUID}.")
        return nil

    #comp = (ModelInstance *)functions.allocateMemory(1, sizeof(ModelInstance));
    var comp:ModelInstance
    #[
    if not comp.isNil:
        #[
        comp.r = cast[typeof(comp.r)](realloc(comp.r, NUMBER_OF_REALS    * sizeof(fmi2Real)))
        comp.i = cast[typeof(comp.i)](realloc(comp.i, NUMBER_OF_INTEGERS * sizeof(fmi2Integer)))
        comp.b = cast[typeof(comp.b)](realloc(comp.b, NUMBER_OF_BOOLEANS * sizeof(fmi2Boolean))) 
        comp.s = cast[typeof(comp.s)](realloc(comp.s, NUMBER_OF_STRINGS  * sizeof(fmi2String)))  
        comp.isPositive = cast[typeof(comp.isPositive)](realloc(comp.isPositive, NUMBER_OF_EVENT_INDICATORS * sizeof(fmi2Boolean)))     
        ]#
        #comp.instanceName = (char *)functions.allocateMemory(1 + strlen(instanceName), sizeof(char));
        #comp.GUID = (char *)functions.allocateMemory(1 + strlen(fmuGUID), sizeof(char));

        # set all categories to on or off. fmi2SetDebugLogging should be called to choose specific categories.     
        for i in 0 ..< NUMBER_OF_CATEGORIES:
            comp.logCategories[i] = loggingOn

    
    #[
    if comp.isNil or comp.r.isNil or comp.i.isNil or comp.b.isNil or comp.s.isNil or comp.isPositive.isNil or
       comp.instanceName.isNil or comp.GUID.isNil:
        functions.logger(functions.componentEnvironment, instanceName, fmi2Error, "error",
            "fmi2Instantiate: Out of memory.")
        return nil
    ]#
    ]#
    comp.time = 0    # overwrite in fmi2SetupExperiment, fmi2SetTime
    comp.instanceName = instanceName
    comp.`type` = fmuType
    comp.GUID   = fmuGUID

    #echo fmt"{cast[int](addr(functions)):#x}"

    comp.functions = functions   
    
    comp.componentEnvironment = f.componentEnvironment
    
    comp.loggingOn = loggingOn
    
    comp.state = modelInstantiated   # State changed
  
    setStartValues( unsafeAddr(comp) )    # <-------- to be implemented by the includer of this file
    comp.isDirtyValues = fmi2True # because we just called setStartValues
    comp.isNewEventIteration = fmi2False

    comp.eventInfo.newDiscreteStatesNeeded = fmi2False
    comp.eventInfo.terminateSimulation = fmi2False
    comp.eventInfo.nominalsOfContinuousStatesChanged = fmi2False
    comp.eventInfo.valuesOfContinuousStatesChanged = fmi2False
    comp.eventInfo.nextEventTimeDefined = fmi2False
    comp.eventInfo.nextEventTime = 0
    filteredLog( unsafeAddr(comp), fmi2OK, LOG_FMI_CALL, fmt"fmi2Instantiate: GUID={fmuGUID}")
    echo "Initiated!!"
    return unsafeAddr( comp )

#------------



proc setString*(comp:ptr ModelInstance, vr:fmi2ValueReference, value:fmi2String):fmi2Status =
    return fmi2SetString(comp, unsafeAddr(vr), 1, unsafeAddr(value))
#-----------



proc fmi2FreeInstance(c: fmi2Component) =
    ##[
    Disposes the given instance, unloads the loaded model, and frees all the allocated memory
    and other resources that have been allocated by the functions of the FMU interface. If a null
    pointer is provided for “c”, the function call is ignored (does not have an effect).
    ]##
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if comp.isNil:
        return
    if (invalidState(comp, "fmi2FreeInstance", MASK_fmi2FreeInstance)):
        return
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2FreeInstance")

    if not (comp.r.isNil):
       comp.functions.freeMemory(comp.r)
    #if not (comp.i.isNil):
    #   comp.functions.freeMemory(comp.i)
    if not (comp.b.isNil):
       comp.functions.freeMemory(comp.b)
    if not (comp.s.isNil):
        #var i:int
        #for i in 0 ..< NUMBER_OF_STRINGS:
        #    if (comp.s[i]):
        #        comp.functions.freeMemory( comp.s[i] )
        
        comp.functions.freeMemory( comp.s )
    #[
    if (comp.isPositive):
       comp.functions.freeMemory(comp.isPositive)

    if (comp.instanceName):
       comp.functions.freeMemory(comp.instanceName)
   
    if (comp.GUID):
       comp.functions.freeMemory( comp.GUID )
    ]#           
    comp.functions.freeMemory(comp)

proc fmi2SetDebugLogging*( c: fmi2Component, loggingOn: fmi2Boolean, 
                          nCategories: csize_t, categories: pointer):fmi2Status =  #categories: ptr fmi2String
    ##[
    The function controls debug logging that is output via the logger function callback.
    If loggingOn = fmi2True, debug logging is enabled, otherwise it is switched off.
    If loggingOn = fmi2True and nCategories = 0, then all debug messages shall be
    output.
    If loggingOn=fmi2True and nCategories > 0, then only debug messages according to
    the categories argument shall be output. Vector categories has
    nCategories elements. The allowed values of categories are defined by the modeling
    environment that generated the FMU. Depending on the generating modeling environment,
    none, some or all allowed values for categories for this FMU are defined in the
    modelDescription.xml file via element “fmiModelDescription.LogCategories”, see
    section 2.2.4.
    ]##
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetDebugLogging", MASK_fmi2SetDebugLogging):
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
            #[
            for j in 0 ..< NUMBER_OF_CATEGORIES:
                if not (logCategoriesNames[j] == categories[i]):
                    comp.logCategories[j] = loggingOn
                    categoryFound = fmi2True
                    break
            ]#  
            #[
            if not categoryFound:
                comp.functions.logger( comp.componentEnvironment, comp.instanceName, fmi2Warning,
                    logCategoriesNames[LOG_ERROR],
                    fmt"logging category '{categories[i]}' is not supported by model" )
            
            ]#
    
    return fmi2OK
{.pop.}