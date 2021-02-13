{.push exportc:"$1", dynlib, cdecl.}
#import fmi2TypesPlatform, status, modelinstance, modelstate, fmi2eventinfo, modelinstancetype,
#       helpers, masks, logger
       #modelstate
#import model
import strformat

## ---------------------------------------------------------------------------
## Functions for FMI2 for Model Exchange
## ---------------------------------------------------------------------------
# Enter and exit the different modes
proc fmi2EnterEventMode*(comp: ModelInstance): fmi2Status =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2EnterEventMode", MASK_fmi2EnterEventMode):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2EnterEventMode")

    comp.state = modelEventMode
    comp.isNewEventIteration = fmi2True
    return fmi2OK


proc fmi2NewDiscreteStates*(comp: ModelInstance; eventInfo: ptr fmi2EventInfo): fmi2Status =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    var timeEvent: cint = 0
    if invalidState(comp, "fmi2NewDiscreteStates", MASK_fmi2NewDiscreteStates):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2NewDiscreteStates")

    comp.eventInfo.newDiscreteStatesNeeded = fmi2False
    comp.eventInfo.terminateSimulation = fmi2False
    comp.eventInfo.nominalsOfContinuousStatesChanged = fmi2False
    comp.eventInfo.valuesOfContinuousStatesChanged = fmi2False

    if (comp.eventInfo.nextEventTimeDefined > 0 and comp.eventInfo.nextEventTime <= comp.time):
        timeEvent = 1

    eventUpdate(comp, addr(comp.eventInfo), timeEvent, comp.isNewEventIteration)
    comp.isNewEventIteration = fmi2False

    # copy internal eventInfo of component to output eventInfo
    eventInfo.newDiscreteStatesNeeded = comp.eventInfo.newDiscreteStatesNeeded
    eventInfo.terminateSimulation = comp.eventInfo.terminateSimulation
    eventInfo.nominalsOfContinuousStatesChanged = comp.eventInfo.nominalsOfContinuousStatesChanged
    eventInfo.valuesOfContinuousStatesChanged = comp.eventInfo.valuesOfContinuousStatesChanged
    eventInfo.nextEventTimeDefined = comp.eventInfo.nextEventTimeDefined
    eventInfo.nextEventTime = comp.eventInfo.nextEventTime

    return fmi2OK


proc fmi2EnterContinuousTimeMode*(comp: ModelInstance): fmi2Status =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2EnterContinuousTimeMode", MASK_fmi2EnterContinuousTimeMode):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL,"fmi2EnterContinuousTimeMode")

    comp.state = modelContinuousTimeMode
    return fmi2OK


proc fmi2CompletedIntegratorStep*(comp: ModelInstance;
                                 noSetFMUStatePriorToCurrentPoint: fmi2Boolean;
                                 enterEventMode: ptr fmi2Boolean;
                                 terminateSimulation: ptr fmi2Boolean): fmi2Status = # {.exportc:"$1", cdecl, dynlib.}
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2CompletedIntegratorStep", MASK_fmi2CompletedIntegratorStep):
        return fmi2Error
    if nullPointer(comp, "fmi2CompletedIntegratorStep", "enterEventMode", enterEventMode):
        return fmi2Error
    if nullPointer(comp, "fmi2CompletedIntegratorStep", "terminateSimulation", terminateSimulation):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL,"fmi2CompletedIntegratorStep")

    enterEventMode[] = fmi2False
    terminateSimulation[] = fmi2False
    return fmi2OK


# Providing independent variables and re-initialization of caching
proc fmi2SetTime*(comp: ModelInstance; time: fmi2Real): fmi2Status = # {.exportc: "$1",dynlib,cdecl.}
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetTime", MASK_fmi2SetTime):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2SetTime: time={time:%.16g}")
    comp.time = time
    return fmi2OK


proc fmi2SetContinuousStates*(comp: ModelInstance; x: ptr fmi2Real; nx: csize_t): fmi2Status =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    #var i:int
    if invalidState(comp, "fmi2SetContinuousStates", MASK_fmi2SetContinuousStates):
        return fmi2Error
    if invalidNumber(comp, "fmi2SetContinuousStates", "nx", nx.cint, NUMBER_OF_STATES):
        return fmi2Error
    if nullPointer(comp, "fmi2SetContinuousStates", "x[]", x):
        return fmi2Error
    when NUMBER_OF_STATES > 0:
        for i in 0 ..< nx:
            var vr: fmi2ValueReference = vrStates[i]
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2SetContinuousStates: #r{vr}#={x[i]}")
            assert(vr < NUMBER_OF_REALS)
            comp.r[vr] = x[i]
    return fmi2OK


# Evaluation of the model equations
proc fmi2GetDerivatives*(comp: ModelInstance; derivatives: ptr fmi2Real; nx: csize_t): fmi2Status {.exportc:"$1", cdecl,dynlib.} =
    #var i:int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetDerivatives", MASK_fmi2GetDerivatives):
        return fmi2Error
    if invalidNumber(comp, "fmi2GetDerivatives", "nx", nx.cint, NUMBER_OF_STATES):
        return fmi2Error
    if nullPointer(comp, "fmi2GetDerivatives", "derivatives[]", derivatives):
        return fmi2Error
    when NUMBER_OF_STATES > 0:
        for i in 0 ..< nx:
            var vr: fmi2ValueReference = vrStates[i] + 1
            derivatives[i] = getReal(comp, vr)  # to be implemented by the includer of this file
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetDerivatives: #r{vr}# = {derivatives[i]}" )

    return fmi2OK


proc fmi2GetEventIndicators*(comp: ModelInstance; eventIndicators: ptr fmi2Real;
                            ni: csize_t): fmi2Status =
    #var i:int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetEventIndicators", MASK_fmi2GetEventIndicators):
        return fmi2Error
    if invalidNumber(comp, "fmi2GetEventIndicators", "ni", ni.cint, NUMBER_OF_EVENT_INDICATORS):
        return fmi2Error
    when NUMBER_OF_EVENT_INDICATORS > 0:
        for i in 0 ..< ni:
            eventIndicators[i] = getEventIndicator(comp, i) # to be implemented by the includer of this file
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, "fmi2GetEventIndicators: z{i} = {eventIndicators[i]}")

    return fmi2OK


proc fmi2GetContinuousStates*(comp: ModelInstance; states: ptr fmi2Real; nx: csize_t): fmi2Status =
    #var i:int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetContinuousStates", MASK_fmi2GetContinuousStates):
        return fmi2Error
    if invalidNumber(comp, "fmi2GetContinuousStates", "nx", nx.cint, NUMBER_OF_STATES):
        return fmi2Error
    if nullPointer(comp, "fmi2GetContinuousStates", "states[]", states):
        return fmi2Error
    when NUMBER_OF_STATES > 0:
        for i in 0 ..< nx:
            var vr:fmi2ValueReference = vrStates[i]
            states[i] = getReal(comp, vr) # to be implemented by the includer of this file
            filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetContinuousStates: #r{vr}# = {states[i]}" )

    return fmi2OK


proc fmi2GetNominalsOfContinuousStates*(comp: ModelInstance; x_nominal: ptr fmi2Real;
                                       nx: csize_t): fmi2Status =
    #var i: int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2GetNominalsOfContinuousStates", MASK_fmi2GetNominalsOfContinuousStates):
        return fmi2Error
    if invalidNumber(comp, "fmi2GetNominalContinuousStates", "nx", nx.cint, NUMBER_OF_STATES):
        return fmi2Error
    if nullPointer(comp, "fmi2GetNominalContinuousStates", "x_nominal[]", x_nominal):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2GetNominalContinuousStates: x_nominal[0..{nx-1}] = 1.0")
    for i in 0 ..< nx:
        x_nominal[i] = 1
    return fmi2OK

{.pop.}
