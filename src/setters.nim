{.push exportc: "$1",dynlib,cdecl.}

#import fmi2TypesPlatform, status, modelinstancetype, helpers, masks, logger
#import model
import strformat

proc fmi2SetReal*(comp: ModelInstance; vr: ptr fmi2ValueReference; nvr: csize_t;
                 value: ptr fmi2Real): fmi2Status {.exportc:"$1".} =
    #var i:int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetReal", MASK_fmi2SetReal):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetReal", "vr[]", vr):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetReal", "value[]", value):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetReal: nvr = {nvr}" )
    # no check whether setting the value is allowed in the current state
    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2SetReal", vr[i], nReals):
            return fmi2Error
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetReal: #r{vr[i]}# = {value[i]}")
        comp.r[vr[i]][] = value[i].float

    if nvr > 0:
       comp.isDirtyValues = fmi2True
    return fmi2OK


proc fmi2SetInteger*( comp: ModelInstance; vr: ptr fmi2ValueReference; nvr: csize_t;
                      value: ptr fmi2Integer): fmi2Status {.exportc:"$1".} =
    #var i:int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetInteger", MASK_fmi2SetInteger):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetInteger", "vr[]", vr):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetInteger", "value[]", value) :
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetInteger: nvr = {nvr}")

    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2SetInteger", vr[i], nIntegers):
            return fmi2Error
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetInteger: #i{vr[i]}# = {value[i]}" )
        comp.i[vr[i]][] = value[i].int32

    if nvr > 0:
       comp.isDirtyValues = fmi2True
    return fmi2OK


proc fmi2SetBoolean*(comp: ModelInstance; vr: ptr fmi2ValueReference; nvr: csize_t;
                    value: ptr fmi2Boolean): fmi2Status {.exportc:"$1".} =
    #var i:int
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetBoolean", MASK_fmi2SetBoolean):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetBoolean", "vr[]", vr):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetBoolean", "value[]", value):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetBoolean: nvr = {nvr}")

    for i in 0 ..< nvr:
        if vrOutOfRange(comp, "fmi2SetBoolean", vr[i], nBooleans):
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


proc fmi2SetString*(comp: ModelInstance; vr: ptr fmi2ValueReference; nvr: csize_t;
                   value: ptr fmi2String): fmi2Status {.exportc:"$1".} =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    if invalidState(comp, "fmi2SetString", MASK_fmi2SetString):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetString", "vr[]", vr):
        return fmi2Error
    if nvr > 0 and nullPointer(comp, "fmi2SetString", "value[]", value):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetString: nvr = {nvr}")

    #for i in 0 ..< nvr:
        #char *string = (char *)comp->s[vr[i]];
        #var str*: cstring = cast[cstring](comp.s[vr[i]])
        #[
        let tmp = vr[i]
        var str* = comp.s[vr[i]]
        if vrOutOfRange(comp, "fmi2SetString", vr[i], NUMBER_OF_STRINGS):
            return fmi2Error
        filteredLog(comp, fmi2OK, LOG_FMI_CALL, fmt"fmi2SetString: #s{vr[i]}# = '{value[i]}'")
        ]#
        #[
        if value[i].isNil:
            if (str):
                comp.functions.freeMemory(str)
            comp.s[vr[i]] = nil
            filteredLog(comp, fmi2Warning, LOG_ERROR, fmt"fmi2SetString: string argument value[{i}] = NULL.")
        else:
            if (string == NULL || strlen(str) < strlen(value[i])):
                if (str):
                    comp.functions.freeMemory(str)
                comp.s[vr[i]] = cast[cstring]( comp.functions.allocateMemory(1 + strlen(value[i]),
                                               sizeof((char))))
                if (!comp.s[vr[i]]):
                    comp.state = modelError
                    filteredLog(comp, fmi2Error, LOG_ERROR, "fmi2SetString: Out of memory.")
                    return fmi2Error


            strcpy(cast[cstring](comp.s[vr[i]]), cast[cstring](value[i]))

        ]#
    #if nvr > 0:
    #    comp.isDirtyValues = fmi2True
    return fmi2OK

{.pop.}
