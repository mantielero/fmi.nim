
{.push exportc:"$1",cdecl,dynlib.}

proc fmi2SetupExperiment*(c: fmi2Component; toleranceDefined: fmi2Boolean;
                         tolerance: fmi2Real; startTime: fmi2Real;
                         stopTimeDefined: fmi2Boolean; stopTime: fmi2Real): fmi2Status =

    # ignore arguments: stopTimeDefined, stopTime
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetupExperiment", MASK_fmi2SetupExperiment):
        return fmi2Error
    filteredLog( comp, fmi2OK, LOG_FMI_CALL, 
                 fmt"fmi2SetupExperiment: toleranceDefined={toleranceDefined} tolerance={tolerance}")
    comp.time = startTime
    return fmi2OK


proc fmi2EnterInitializationMode*(c: fmi2Component): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2EnterInitializationMode", MASK_fmi2EnterInitializationMode):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2EnterInitializationMode")

    comp.state = modelInitializationMode
    return fmi2OK

proc fmi2ExitInitializationMode*(c: fmi2Component): fmi2Status = 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2ExitInitializationMode", MASK_fmi2ExitInitializationMode):
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


proc fmi2Terminate*(c: fmi2Component): fmi2Status = 
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2Terminate", MASK_fmi2Terminate):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2Terminate")

    comp.state = modelTerminated
    return fmi2OK


proc fmi2Reset*(c:fmi2Component):fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2Reset", MASK_fmi2Reset):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2Reset")

    comp.state = modelInstantiated
    setStartValues(comp) # to be implemented by the includer of this file
    comp.isDirtyValues = fmi2True # because we just called setStartValues
    return fmi2OK





proc fmi2GetFMUstate*(c: fmi2Component; FMUstate: ptr fmi2FMUstate): fmi2Status =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    return unsupportedFunction(c, "fmi2GetFMUstate", MASK_fmi2GetFMUstate)

proc fmi2SetFMUstate*(c:fmi2Component; FMUstate: ptr fmi2FMUstate): fmi2Status =
    return unsupportedFunction(c, "fmi2SetFMUstate", MASK_fmi2SetFMUstate)

proc fmi2FreeFMUstate*(c:fmi2Component; FMUstate: ptr fmi2FMUstate): fmi2Status =
    return unsupportedFunction(c, "fmi2FreeFMUstate", MASK_fmi2FreeFMUstate)


proc fmi2SerializedFMUstateSize*(c:fmi2Component, FMUstate: ptr fmi2FMUstate,size: ptr csize_t): fmi2Status =
    return unsupportedFunction(c, "fmi2SerializedFMUstateSize", MASK_fmi2SerializedFMUstateSize)

proc fmi2SerializeFMUstate*(c: fmi2Component; FMUstate: fmi2FMUstate;
                           serializedState: ptr fmi2Byte; size: csize): fmi2Status =
    return unsupportedFunction(c, "fmi2SerializeFMUstate", MASK_fmi2SerializeFMUstate)

proc fmi2DeSerializeFMUstate*(c: fmi2Component; serializedState: ptr fmi2Byte;
                             size: csize; FMUstate: ptr fmi2FMUstate): fmi2Status =
    return unsupportedFunction(c, "fmi2DeSerializeFMUstate", MASK_fmi2DeSerializeFMUstate)


proc fmi2GetDirectionalDerivative*(c: fmi2Component;
                                  vUnknown_ref: ptr fmi2ValueReference;
                                  nUnknown: csize;
                                  vKnown_ref: ptr fmi2ValueReference;
                                  nKnown: csize; dvKnown: ptr fmi2Real;
                                  dvUnknown: ptr fmi2Real): fmi2Status =
    return unsupportedFunction(c, "fmi2GetDirectionalDerivative", MASK_fmi2GetDirectionalDerivative)

{.pop.}