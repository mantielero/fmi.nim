# nim c --deadcodeElim:off --nimcache:.cache --app:lib -o:inc.so inc.nim
# El fichero inc.so lo copiamos a: fmusdk-master/fmu20/src/models/inc/fmu/binaries/linux64/
# Generamos el fichero prueba.fmu mediante: ./genfmu
# fmusdk-master/fmu20/bin/fmusim_me prueba.fmu 10 0.1

# Podemos inspeccionar los símbolos exportados mediante: 
# readelf -Ws inc.so | grep fmi2 > nueva.txt
# readelf -Ws fmuTmpJSOGwH/binaries/linux64/inc.so | grep fmi2 > original.txt 
# awk '{print $8}' original.txt > original_functions.txt
# awk '{print $8}' nueva.txt > nueva_functions.txt
#{.deadCodeElim: off.}

#include status  # enums: 
#include statuskind # enum:
import enquire  # fmi2GetVersion, fmi2GetTypesPlatform
import fmi2TypesPlatform
import fmi2type
import fmi2callbackfunctions
import modelstate
import fmi2eventinfo
import modelinstance
import common

#proc getEventIndicator*(comp:ptr ModelInstance, i:int)

import cosimulation
import cosimulation2
import modelexchange