# nim c --nimcache:.cache --app:lib -o:inc.so inc.nim

import strformat

const
   MODEL_IDENTIFIER* = "inc"
   MODEL_GUID* = "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"

   NUMBER_OF_REALS* = 0
   NUMBER_OF_INTEGERS* = 1
   NUMBER_OF_BOOLEANS* = 0
   NUMBER_OF_STRINGS* = 0
   NUMBER_OF_STATES* = 0
   NUMBER_OF_EVENT_INDICATORS* = 0

var DT_EVENT_DETECT* = 1e-10  # It could be modified


include status  # enums: 
include statuskind # enum:
include enquire  # fmi2GetVersion, fmi2GetTypesPlatform
include fmi2TypesPlatform
include fmi2type
include fmi2callbackunctions
include modelstate
include fmi2eventinfo
include modelinstance
include common

#proc getEventIndicator*(comp:ptr ModelInstance, i:int)

include cosimulation
include cosimulation2
include modelexchange