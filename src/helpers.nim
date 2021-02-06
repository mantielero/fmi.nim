## ---------------------------------------------------------------------------
## Private helpers used below to validate function arguments
## ---------------------------------------------------------------------------

proc invalidNumber*( comp:ptr ModelInstance, f:cstring, arg:cstring,
                     n:cint, nExpected:cint):bool  = # {.exportc:"$1"}
    if n != nExpected:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = {n}. Expected {nExpected}.")
        return true
    return false

proc invalidState*( comp:ptr ModelInstance, f:cstring, 
                    statesExpected:ModelState):bool  = #  {.exportc:"$1"}
    if comp.isNil:#comp  == nil:  # TODO: (!comp)
        return true
    if not (comp.state.cint > 0 and  statesExpected.cint > 0):
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal call sequence." )
        return true
    
    return false

proc nullPointer*(comp:ptr ModelInstance, f:cstring, arg:cstring, p:pointer):bool  {.exportc:"$1"} =
    if p.isNil:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = NULL.")
        return true
    
    return false

proc vrOutOfRange*(comp:ptr ModelInstance, f:cstring,  vr:fmi2ValueReference, `end`:cint):bool  {.exportc:"$1"} =
    if vr.cint >= `end`:
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal value reference {vr}.")
        comp.state = modelError
        return true
    
    return false

proc unsupportedFunction*(c:ModelInstance, fName:cstring, statesExpected:ModelState):fmi2Status  {.exportc:"$1"} =
    var comp:ptr ModelInstance = unsafeAddr(c)
    var log:fmi2CallbackLogger = comp.functions.logger
    if invalidState(comp, fName, statesExpected):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fName)
    filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{fName}: Function not implemented.")
    return fmi2Error



