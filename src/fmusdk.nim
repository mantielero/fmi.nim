
#modelinstancetype, modelstate
#import fmi2TypesPlatform, fmi2type, fmi2callbackfunctions, modelstate, fmi2eventinfo


#a, b: untyped
template fmu*(id, guid:string, body: untyped): untyped {.dirty.} =
  ## This templates creates the appropriate structure for the FMU

  #import typedefinition
  include definitions#, enquire
  include enquire

  const
      modelId* = id
      modelGuid*       = guid

      nReals*   = 0
      nIntegers*  = 1
      nBooleans*  = 0
      nStrings*  = 0
      nStates*  = 0
      nEventIndicators*  = 0

  #genModelInstance(0,1,0,0 ,0,0, NUMBER_OF_CATEGORIES)
  type
    ModelInstance* = ref object
        r*:          array[nReals, fmi2Real]
        i*:          array[nIntegers, fmi2Integer]
        b*:          array[nBooleans, fmi2Boolean]
        s*:          array[nStrings, fmi2String]
        isPositive*: array[nEventIndicators, fmi2Boolean]
        time*: fmi2Real
        instanceName*: fmi2String
        `type`*: fmi2Type
        GUID*: fmi2String
        functions*: fmi2CallbackFunctions  #ptr fmi2CallbackFunctions  # <-----
        loggingOn*: fmi2Boolean
        logCategories*: array[nCategories, fmi2Boolean]
        componentEnvironment*: fmi2ComponentEnvironment
        state*: ModelState
        eventInfo*: fmi2EventInfo
        isDirtyValues*: fmi2Boolean
        isNewEventIteration*: fmi2Boolean

  body

  when nStates > 0:
     # array of value references of states
     var vrStates*: array[nStates, fmi2ValueReference] = STATES

  #include getters
  include logger, masks, helpers, getters, setters
  include modelinstance
  include common

  #proc getEventIndicator*(comp:ptr ModelInstance, i:int)

  include cosimulation
  include cosimulation2
  include modelexchange
