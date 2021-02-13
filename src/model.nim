import fmusdk
##[
Increments an int counter every second.


]##

#[
self.intOut = 1
self.realOut = 3.0
self.booleanVariable = True
self.stringVariable = "Hello World!"
self.register_variable(Integer("intOut", causality=Fmi2Causality.output))
self.register_variable(Real("realOut", causality=Fmi2Causality.output))
self.register_variable(Boolean("booleanVariable", causality=Fmi2Causality.local))
self.register_variable(String("stringVariable", causality=Fmi2Causality.local))
]#
#[
<ScalarVariable name="x" valueReference="0" description="the only state"
                causality="local" variability="continuous" initial="exact">
  <Real start="1"/>
</ScalarVariable>
<ScalarVariable name="der(x)" valueReference="1"
                causality="local" variability="continuous" initial="calculated">
  <Real derivative="1"/>
</ScalarVariable>
<ScalarVariable name="k" valueReference="2"
                causality="parameter" variability="fixed" initial="exact">
  <Real start="1"/>
</ScalarVariable>
]#


#[
param "k":
  causality: "parameter"
  variability: "fixed"
  initial: "exact"
]#

#fmu("inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"):
fmu( "inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"):
  #var contador:int
  #register(contador)
  const
    counter* = 0  # Es el identificador dentro del array

  proc setStartValues*( comp: ModelInstance)  =
      #var c = cast[ModelInstance](comp)
      #echo repr c.GUID.string
      comp.i[counter] = 1  # Asigna al primer valor entero el valor "1"


  proc calculateValues*( comp: ModelInstance) =
      if comp.state == modelInitializationMode:
          # set first time event
          comp.eventInfo.nextEventTimeDefined = fmi2True
          comp.eventInfo.nextEventTime        = 1 + comp.time

  proc eventUpdate*( comp: ModelInstance, eventInfo:ptr fmi2EventInfo,
                     timeEvent:int, isNewEventIteration:int) =
      if timeEvent != 0:
          comp.i[0] += 1
          if comp.i[0] == 13:
              eventInfo.terminateSimulation  = fmi2True
              eventInfo.nextEventTimeDefined = fmi2False
          else:
              eventInfo.nextEventTimeDefined = fmi2True
              eventInfo.nextEventTime        = 1 + comp.time



  #fmusdk-master/fmu20/bin/fmusim_me inc.fmu 10 0.1
  #readelf -Ws inc.so | grep fmi2 > nueva.txt
  #awk '{print $8}' nueva.txt > nueva_functions.txt
  #rm -r fmuTmp*

when not compileOption("app", "lib"):
  import system, osproc, os, strformat, strutils, genfmu

  #let filename = "prueba.fmu"
  #let path = "fmusdk-master/fmu20/src/models/inc/fmu/"
  #compressFolder(filename, path)
  #[
  let n = paramCount()
  if not n == 1:
    #raise newException(ValueError, "the request to the OS failed")
    echo "Only one argument accepted"
    quit(QuitFailure)
  let nimFile = paramStr(1)
  if ext.toLower != ".nim":
    echo "The extension should be .nim, but got: ", ext
    quit(QuitFailure)
  echo "[INFO] Processing: ", nimFile
  ]#
  let (_,name, ext) = getAppFilename().splitFile
  let nimFile = name & ".nim"

  # Create the library

  # Compilation
  let libName = fmt"{modelId}.so"
  # --nimcache:.cache
  doAssert execCmdEx( fmt"nim c --deadcodeElim:off  --gc:arc --app:lib -o:{libName} {nimFile}" ).exitCode == QuitSuccess

  # Move the library to the right folder
  let path = "fmusdk-master/fmu20/src/models/inc/fmu/"
  copyFile( libName, path / "binaries/linux64" / libName )


  let fmuName = fmt"{modelId}.fmu"
  compressFolder( fmuName, path )
  echo "CREATED: ", fmuName
  quit(QuitSuccess)
