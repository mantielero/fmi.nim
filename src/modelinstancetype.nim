import fmi2TypesPlatform, fmi2type, fmi2callbackfunctions, modelstate, fmi2eventinfo

const
  LOG_ALL* = 0
  LOG_ERROR* = 1
  LOG_FMI_CALL* = 2
  LOG_EVENT* = 3
  NUMBER_OF_CATEGORIES* = 4   # Number of logging categorias
   

# {.exportc:"$1", bycopy.} 

type
  #myarray* = array[0..0, fmi2Integer]
  ModelInstance* = ref object
    r*:          seq[fmi2Real]#array[0..0, fmi2Real] #ptr UncheckedArray[fmi2Real]#(NUMBER_OF_REALS)
    i*:          array[0..0, fmi2Integer] #newSeq[fmi2Integer](1) #ptr UncheckedArray[fmi2Integer]#(NUMBER_OF_INTEGERS)
    b*:          seq[fmi2Boolean]#array[0..0, fmi2Boolean] #ptr UncheckedArray[fmi2Boolean]#(NUMBER_OF_BOOLEANS)
    s*:          seq[fmi2String] #array[0..0, fmi2String] #ptr UncheckedArray[fmi2String] #(NUMBER_OF_STRINGS)
    isPositive*: seq[fmi2Boolean] #array[0..0, fmi2Boolean]  #ptr UncheckedArray[fmi2Boolean]#(NUMBER_OF_EVENT_INDICATORS)
    time*: fmi2Real
    instanceName*: fmi2String
    `type`*: fmi2Type
    GUID*: fmi2String
    functions*: ptr fmi2CallbackFunctions
    loggingOn*: fmi2Boolean
    logCategories*: array[0..NUMBER_OF_CATEGORIES-1, fmi2Boolean]
    componentEnvironment*: fmi2ComponentEnvironment
    state*: ModelState
    eventInfo*: fmi2EventInfo
    isDirtyValues*: fmi2Boolean
    isNewEventIteration*: fmi2Boolean
 #ModelInstancePtr = ref ModelInstance