## ---------------------------------------------------------------------------
## Private helpers used below to validate function arguments
## ---------------------------------------------------------------------------
#import modelinstancetype, modelstate, logger, status, fmi2TypesPlatform, fmi2callbackfunctions
import strformat

proc invalidNumber*( comp:ModelInstance, f, arg:string,
                     n, nExpected:int):bool  =
    if n != nExpected:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = {n}. Expected {nExpected}.")
        return true
    return false

proc invalidState*( comp:ModelInstance, f:string,
                    statesExpected:ModelState):bool  =
    if comp.isNil:
        return true
    #echo "invalidState: ", repr comp
    if not (comp.state.int > 0 and  statesExpected.int > 0):
        comp.state = modelError
        #echo $f
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{$f}: Illegal call sequence." )
        return true

    return false

proc nullPointer*(comp:ModelInstance, f:string, arg:string, p:pointer):bool =
    if p.isNil:
        comp.state = modelError
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Invalid argument {arg} = NULL.")
        return true

    return false

proc vrOutOfRange*(comp:ModelInstance, f:string,  vr:fmi2ValueReference, `end`:int):bool =
    if vr.int >= `end`:
        filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{f}: Illegal value reference {vr}.")
        comp.state = modelError
        return true

    return false

proc unsupportedFunction*(comp:ModelInstance; fName: string; statesExpected: ModelState): fmi2Status =
    #var comp: ptr ModelInstance = cast[ptr ModelInstance](c)
    #var log:fmi2CallbackLogger = comp.functions.logger
    if invalidState(comp, fName, statesExpected):
        return fmi2Error
    filteredLog(comp, fmi2OK, LOG_FMI_CALL, fName)
    filteredLog(comp, fmi2Error, LOG_ERROR, fmt"{fName}: Function not implemented.")
    return fmi2Error
