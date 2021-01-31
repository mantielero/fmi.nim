# nim c wrapper.nim > fmuTemplate.nim

import nimterop/cimport

static:
  cDebug()
  cDisableCaching()           # Regenerate Nim wrapper every time

#cDefine("HAS_ABC")            # Set #defines for preprocessor and compiler
#cDefine("HAS_ABC", "DEF")

cDefine("DISABLE_PREFIX")
cDefine("FMI2_Export")
cDefine("FMI2_FUNCTION_PREFIX", "MyModel_")

cIncludeDir("./fmusdk-master/fmu20/src/shared/include")   # Setup any include directories
#cExclude("clib/file.h")       # Exclude file from wrapped output

c2nImport("./fmusdk-master/fmu20/src/models/fmuTemplate.h", recurse = true, mode= "c")  # Generate wrappers for header specified

#cCompile("clib/src/*.c")      # Compile in any implementation source files