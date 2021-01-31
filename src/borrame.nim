## static fmi2Boolean invalidNumber(ModelInstance *comp, const char *f, const char *arg, int n, int nExpected);
## static fmi2String logCategoriesNames[] = {"logAll", "logError", "logFmiCall", "logEvent"};
## typedef char            fmi2Char;
## typedef const fmi2Char* fmi2String;
## typedef const char* prueba;

proc fmi2Instantiate*(instanceName: fmi2String; fmuType: fmi2Type;
                     fmuGUID: fmi2String; fmuResourceLocation: fmi2String;
                     functions: ptr fmi2CallbackFunctions; visible: fmi2Boolean;
                     loggingOn: fmi2Boolean): fmi2Component