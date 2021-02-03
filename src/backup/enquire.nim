## ---------------------------------------------------------------------------
## FMI functions: class methods not depending of a specific model instance
## ---------------------------------------------------------------------------

const
  fmi2Version = "2.0"  # pag. 19
  fmi2TypesPlatform = "default"

proc fmi2GetVersion():cstring {.exportc:"$1"} =
    return fmi2Version

proc fmi2GetTypesPlatform():cstring {.exportc:"$1"} =
    return fmi2TypesPlatform