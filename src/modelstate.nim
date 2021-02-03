
type
  ModelState* = enum
    modelStartAndEnd        = (1 shl 0),  ##  ME state
    modelInstantiated       = (1 shl 1),  ##  ME states
    modelInitializationMode = (1 shl 2),  ##  ME states
    modelEventMode          = (1 shl 3),  ##  CS states
    modelContinuousTimeMode = (1 shl 4),  ##  CS states
    modelStepComplete       = (1 shl 5),
    modelStepInProgress     = (1 shl 6),
    modelStepFailed         = (1 shl 7),
    modelStepCanceled       = (1 shl 8),
    modelTerminated         = (1 shl 9),
    modelError              = (1 shl 10),
    modelFatal              = (1 shl 11)