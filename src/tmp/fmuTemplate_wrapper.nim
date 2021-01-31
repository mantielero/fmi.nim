import nimterop/cimport

static:
  cDebug()
cDefine("DISABLE_PREFIX")
cDefine("FMI2_Export")
cDefine("FMI2_FUNCTION_PREFIX", "MyModel_")

cIncludeDir("../shared/include")
cIncludeDir("../shared")

cImport("fmuTemplate.h", recurse=true)
