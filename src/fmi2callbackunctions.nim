import fmi2TypesPlatform, status

const
  headerfmuTemplate {.used.} = "./fmusdk-master/fmu20/src/models/fmuTemplate.h"

{.pragma: impfmuTemplate, importc, header: headerfmuTemplate.}
{.pragma: impfmuTemplateC, impfmuTemplate, cdecl.}

type
  fmi2CallbackLogger* {.impfmuTemplate.} = proc(a1: fmi2ComponentEnvironment, a2: fmi2String, a3: fmi2Status, a4: fmi2String, a5: fmi2String) {.cdecl.}
  fmi2CallbackAllocateMemory* {.impfmuTemplate.} = proc(a1: cuint, a2: cuint) {.cdecl.}
  fmi2CallbackFreeMemory* {.impfmuTemplate.} = proc(a1: pointer) {.cdecl.}
  fmi2StepFinished* {.impfmuTemplate.} = proc(a1: fmi2ComponentEnvironment, a2: fmi2Status) {.cdecl.}


  fmi2CallbackFunctions* {.exportc:"$1".} = object #{.impfmuTemplate, bycopy.} = object
    logger*: fmi2CallbackLogger
    allocateMemory*: fmi2CallbackAllocateMemory
    freeMemory*: fmi2CallbackFreeMemory
    stepFinished*: fmi2StepFinished
    componentEnvironment*: fmi2ComponentEnvironment