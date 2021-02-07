# nim c --deadcodeElim:off --nimcache:.cache --app:lib -o:inc.so inc.nim
# El fichero inc.so lo copiamos a: fmusdk-master/fmu20/src/models/inc/fmu/binaries/linux64/
# Generamos el fichero prueba.fmu mediante: ./genfmu
# fmusdk-master/fmu20/bin/fmusim_me prueba.fmu 10 0.1

# Podemos inspeccionar los símbolos exportados mediante: 
# readelf -Ws inc.so | grep fmi2 > nueva.txt
# readelf -Ws fmuTmpJSOGwH/binaries/linux64/inc.so | grep fmi2 > original.txt 
# awk '{print $8}' original.txt > original_functions.txt
# awk '{print $8}' nueva.txt > nueva_functions.txt
{.deadCodeElim: off.}

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