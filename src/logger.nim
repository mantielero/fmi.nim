import modelinstancetype, fmi2TypesPlatform, status
## ---------------------------------------------------------------------------
## Private helpers logger
## ---------------------------------------------------------------------------

proc isCategoryLogged*(comp:ptr ModelInstance, categoryIndex:cint):bool  =
    ## return fmi2True if logging category is on. Else return fmi2False.
    if categoryIndex < NUMBER_OF_CATEGORIES and ((comp.logCategories[categoryIndex] > 0) or (comp.logCategories[LOG_ALL] > 0)):
        return true
    return false  

proc logCategoriesNames*(idx: cint):fmi2String =
  let categoriesNames: seq[string] = @["logAll", "logError", "logFmiCall", "logEvent"]
  return categoriesNames[idx].fmi2String

proc filteredLog*(instance:ptr ModelInstance, status:fmi2Status, categoryIndex:cint, message:cstring) =
   if status == fmi2Error or 
      status == fmi2Fatal or 
      isCategoryLogged(instance, categoryIndex):
      let log = instance.functions.logger

      log( instance.functions.componentEnvironment, instance.instanceName,
           status, logCategoriesNames(categoryIndex), message.fmi2String )