## ---------------------------------------------------------------------------
## Private helpers used below to validate function arguments
## ---------------------------------------------------------------------------

proc invalidNumber*( comp:ptr ModelInstance, f:cstring, arg:cstring,
                     n:cint, nExpected:cint):bool  = 
    if n != nExpected:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = {n}. Expected {nExpected}.")
        return true
    return false

proc invalidState*( comp:ptr ModelInstance, f:cstring, 
                    statesExpected:ModelState):bool  = 
    if comp.isNil:#comp  == nil:  # TODO: (!comp)
        return true
    if not (comp.state.cint > 0 and  statesExpected.cint > 0):
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal call sequence." )
        return true
    
    return false

proc nullPointer*(comp:ptr ModelInstance, f:cstring, arg:cstring, p:pointer):bool =
    if p.isNil:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = NULL.")
        return true
    
    return false

proc vrOutOfRange*(comp:ptr ModelInstance, f:cstring,  vr:fmi2ValueReference, `end`:cint):bool =
    if vr.cint >= `end`:
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal value reference {vr}.")
        comp.state = modelError
        return true
    
    return false

proc unsupportedFunction*(c: fmi2Component; fName: cstring; statesExpected: ModelState): fmi2Status =
    var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    var log:fmi2CallbackLogger = comp.functions.logger
    if invalidState(comp, fName, statesExpected):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fName)
    filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{fName}: Function not implemented.")
    return fmi2Error



