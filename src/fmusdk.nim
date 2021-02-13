
#modelinstancetype, modelstate
#import fmi2TypesPlatform, fmi2type, fmi2callbackfunctions, modelstate, fmi2eventinfo


#a, b: untyped
template fmu*(id, guid:string, body: untyped): untyped {.dirty.} =
  ## This templates creates the appropriate structure for the FMU

  #import typedefinition
  import definitions#, enquire
  include enquire



  const
      MODEL_IDENTIFIER* {.inject.} = id
      MODEL_GUID*       {.inject.} = guid

      NUMBER_OF_REALS*  {.inject.} = 0
      NUMBER_OF_INTEGERS* {.inject.} = 1
      NUMBER_OF_BOOLEANS* {.inject.} = 0
      NUMBER_OF_STRINGS* {.inject.} = 0
      NUMBER_OF_STATES* {.inject.} = 0
      NUMBER_OF_EVENT_INDICATORS* {.inject.} = 0

  #genModelInstance(0,1,0,0 ,0,0, NUMBER_OF_CATEGORIES)
  type
    ModelInstance* = ref object
        r*:          array[NUMBER_OF_REALS, fmi2Real]
        i*:          array[NUMBER_OF_INTEGERS, fmi2Integer]
        b*:          array[NUMBER_OF_BOOLEANS, fmi2Boolean]
        s*:          array[NUMBER_OF_STRINGS, fmi2String]
        isPositive*: array[NUMBER_OF_EVENT_INDICATORS, fmi2Boolean]
        time*: fmi2Real
        instanceName*: fmi2String
        `type`*: fmi2Type
        GUID*: fmi2String
        functions*: ptr fmi2CallbackFunctions  # <-----
        loggingOn*: fmi2Boolean
        logCategories*: array[NUMBER_OF_CATEGORIES, fmi2Boolean]
        componentEnvironment*: fmi2ComponentEnvironment
        state*: ModelState
        eventInfo*: fmi2EventInfo
        isDirtyValues*: fmi2Boolean
        isNewEventIteration*: fmi2Boolean

  body

  when NUMBER_OF_STATES > 0:
     # array of value references of states
     var vrStates*: array[NUMBER_OF_STATES, fmi2ValueReference] = STATES

  #include getters
  include logger, masks, helpers, getters, setters
  include modelinstance
  include common

  #proc getEventIndicator*(comp:ptr ModelInstance, i:int)

  include cosimulation
  include cosimulation2
  include modelexchange
