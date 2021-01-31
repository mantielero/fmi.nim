//static fmi2Boolean invalidNumber(ModelInstance *comp, const char *f, const char *arg, int n, int nExpected);
//static fmi2String logCategoriesNames[] = {"logAll", "logError", "logFmiCall", "logEvent"};
//typedef char            fmi2Char;
//typedef const fmi2Char* fmi2String;
//typedef const char* prueba;
fmi2Component fmi2Instantiate(fmi2String instanceName, fmi2Type fmuType, fmi2String fmuGUID,

                            fmi2String fmuResourceLocation, const fmi2CallbackFunctions *functions,

                            fmi2Boolean visible, fmi2Boolean loggingOn);
