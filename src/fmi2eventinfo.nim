#import fmi2TypesPlatform

type
  fmi2EventInfo* {.exportc:"$1", bycopy.} = object
    newDiscreteStatesNeeded*: fmi2Boolean
    terminateSimulation*: fmi2Boolean
    nominalsOfContinuousStatesChanged*: fmi2Boolean
    valuesOfContinuousStatesChanged*: fmi2Boolean
    nextEventTimeDefined*: fmi2Boolean
    nextEventTime*: fmi2Real