
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

