import modelinstancetype, modelstate, fmi2TypesPlatform, fmi2eventinfo

const
   MODEL_IDENTIFIER* = "inc"
   MODEL_GUID* = "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"

   NUMBER_OF_REALS* = 0
   NUMBER_OF_INTEGERS* = 1
   NUMBER_OF_BOOLEANS* = 0
   NUMBER_OF_STRINGS* = 0
   NUMBER_OF_STATES* = 0
   NUMBER_OF_EVENT_INDICATORS* = 0

   DT_EVENT_DETECT* = 1e-10  # It could be modified  
   counter = 0   

when NUMBER_OF_STATES > 0:
   # array of value references of states
   var vrStates*: array[NUMBER_OF_STATES, fmi2ValueReference] = STATES


proc setStartValues*( comp: ptr ModelInstance)  =
    var c = cast[ModelInstance](comp)
    #echo repr c.GUID.string
    c.i[counter] = 1  # Asigna al primer valor entero el valor "1"


proc calculateValues*( comp: ptr ModelInstance) =
    if comp.state == modelInitializationMode:
        # set first time event
        comp.eventInfo.nextEventTimeDefined = fmi2True
        comp.eventInfo.nextEventTime        = 1 + comp.time

proc eventUpdate*( comp: ptr ModelInstance, eventInfo:ptr fmi2EventInfo,
                  timeEvent:int, isNewEventIteration:int) =
    if timeEvent != 0:
        comp.i[counter] += 1
        if comp.i[counter] == 13:
            eventInfo.terminateSimulation  = fmi2True
            eventInfo.nextEventTimeDefined = fmi2False
        else:
            eventInfo.nextEventTimeDefined = fmi2True
            eventInfo.nextEventTime        = 1 + comp.time