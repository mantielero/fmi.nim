#[
The compilation of this file generates the creator of the fmu. So the following
line will create completely a `inc.fmu` in this case:

    $ nim c -r model  
    
]#
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



fmu( "inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"):
  var contador:int = 1
  register(contador, cOutput, vDiscrete, iExact, "counts the seconds" )

  const
    counter* = 0  # Es el identificador dentro del array

  proc setStartValues*( comp: ModelInstance)  =
      comp.i[counter] = 1  # Asigna al primer valor entero el valor "1"
      #discard



  proc calculateValues*( comp: ModelInstance) =
      if comp.state == modelInitializationMode:
          # set first time event
          comp.eventInfo.nextEventTimeDefined = fmi2True
          comp.eventInfo.nextEventTime        = 1 + comp.time

  proc eventUpdate*( comp: ModelInstance, eventInfo:ptr fmi2EventInfo,
                     timeEvent:bool, isNewEventIteration:int) =
      ##[
      Used to set the next time event, if any.
      `eventInfo`:
      ]##
      if timeEvent:  # Each time there is a timeEvent, the counter is increased.
          comp.i[0] += 1  # Increase the counter
          #echo "OK: ", comp.time
          #contador += 1
          #if comp.i[0] == 13:  # Stop when we reach 14.
          if contador == 13:
              eventInfo.terminateSimulation  = fmi2True
              eventInfo.nextEventTimeDefined = fmi2False
          else:
              eventInfo.nextEventTimeDefined = fmi2True
              eventInfo.nextEventTime        = 1 + comp.time



  #fmusdk-master/fmu20/bin/fmusim_me inc.fmu 10 0.1
  #readelf -Ws inc.so | grep fmi2 > nueva.txt
  #awk '{print $8}' nueva.txt > nueva_functions.txt
