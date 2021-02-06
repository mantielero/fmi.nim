type
  fmi2StatusKind* = enum
    fmi2DoStepStatus       = 0,
    fmi2PendingStatus      = 1,
    fmi2LastSuccessfulTime = 2,
    fmi2Terminated         = 3