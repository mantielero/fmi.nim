## ---------------------------------------------------------------------------
## FMI functions: class methods not depending of a specific model instance
## ---------------------------------------------------------------------------

const
  fmi2Version = "2.0"  # pag. 19
  fmi2TypesPlatform = "default"


{.push exportc: "$1",dynlib,cdecl.}

proc fmi2GetVersion():string = #{.exportc:"$1",dynlib,cdecl} =
  ##[
  Returns the version of the “fmi2Functions.h” header file which was used to compile the
  functions of the FMU. The function returns “fmiVersion” which is defined in this header file.
  The standard header file as documented in this specification has version “2.0” (so this function
  usually returns “2.0”).
  ]##
  return fmi2Version

proc fmi2GetTypesPlatform():string = # {.exportc:"$1",dynlib,cdecl} =
  ##[
  Returns the string to uniquely identify the “fmi2TypesPlatform.h” header file used for
  compilation of the functions of the FMU. The function returns a pointer to a static string specified
  by “fmi2TypesPlatform” defined in this header file. The standard header file, as documented
  in this specification, has fmi2TypesPlatform set to “default” (so this function usually returns
  “default”).
  ]##  
  return fmi2TypesPlatform

{.pop.}