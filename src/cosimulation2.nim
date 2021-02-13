#import fmi2TypesPlatform, status, modelinstance, modelinstancetype, helpers,
#       statuskind, masks, logger
import strformat

# Inquire slave status
proc getStatus*(fname: cstring; comp: ModelInstance; s: fmi2StatusKind): fmi2Status =
    var statusKind: array[0..2, string] = ["fmi2DoStepStatus", "fmi2PendingStatus",
                                 "fmi2LastSuccessfulTime"]

    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)

    if invalidState(comp, fname, MASK_fmi2GetStatus): # all get status have the same MASK_fmi2GetStatus
            return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"{fname}: fmi2StatusKind = {statusKind[s.int]}" )

    case s:
        of fmi2DoStepStatus:
            filteredLog(comp, fmi2Error, LOG_ERROR,
            fmt"{fname}: Can be called with fmi2DoStepStatus when fmi2DoStep returned fmi2Pending. This is not the case.")

        of fmi2PendingStatus:
            filteredLog(comp, fmi2Error, LOG_ERROR,
            fmt"{fname}: Can be called with fmi2PendingStatus when fmi2DoStep returned fmi2Pending. This is not the case.")

        of fmi2LastSuccessfulTime:
            filteredLog(comp, fmi2Error, LOG_ERROR,
            fmt"{fname}: Can be called with fmi2LastSuccessfulTime when fmi2DoStep returned fmi2Discard. This is not the case.")

        of fmi2Terminated:
            filteredLog(comp, fmi2Error, LOG_ERROR,
            fmt"{fname}: Can be called with fmi2Terminated when fmi2DoStep returned fmi2Discard. This is not the case.")

    return fmi2Discard

{.push exportc:"$1",cdecl,dynlib.}

proc fmi2GetStatus*(comp: ModelInstance; s: fmi2StatusKind; value: ptr fmi2Status): fmi2Status =
    return getStatus("fmi2GetStatus", comp, s)


proc fmi2GetRealStatus*(comp: ModelInstance; s: fmi2StatusKind; value: ptr fmi2Real): fmi2Status =
    if (s == fmi2LastSuccessfulTime):
        #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
        if invalidState(comp, "fmi2GetRealStatus", MASK_fmi2GetRealStatus):
            return fmi2Error

        value[] = comp.time
        return fmi2OK

    return getStatus("fmi2GetRealStatus", comp, s)

proc fmi2GetIntegerStatus*(comp: ModelInstance; s: fmi2StatusKind;
                          value: ptr fmi2Integer): fmi2Status =
    return getStatus("fmi2GetIntegerStatus", comp, s)


proc fmi2GetBooleanStatus*(comp: ModelInstance; s: fmi2StatusKind;
                          value: ptr fmi2Boolean): fmi2Status =
    if (s == fmi2Terminated):
        #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
        if invalidState(comp, "fmi2GetBooleanStatus", MASK_fmi2GetBooleanStatus):
            return fmi2Error

        value[] = comp.eventInfo.terminateSimulation
        return fmi2OK

    return getStatus("fmi2GetBooleanStatus", comp, s)


proc fmi2GetStringStatus*(comp: ModelInstance; s: fmi2StatusKind; value: ptr fmi2String): fmi2Status =
    return getStatus("fmi2GetStringStatus", comp, s)

{.pop.}
