import fmusdk


#fmu("inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"):
fmu( "inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"):
  const
    counter* = 0

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
