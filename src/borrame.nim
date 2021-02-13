

import
  typedefinition

import
  definitions, enquire

const
  `MODEL_IDENTIFIER`* = "inc"
  `MODEL_GUID`* = "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"
  `NUMBER_OF_REALS`* = 0
  `NUMBER_OF_INTEGERS`* = 1
  `NUMBER_OF_BOOLEANS`* = 0
  `NUMBER_OF_STRINGS`* = 0
  `NUMBER_OF_STATES`* = 0
  `NUMBER_OF_EVENT_INDICATORS`* = 0
  counter`gensym0 = 0
genModelInstance(0, 1, 0, 0, 0, 0, NUMBER_OF_CATEGORIES)
proc setStartValues*(comp: ModelInstance) =
  comp.i[0] = 1

proc calculateValues*(comp: ModelInstance) =
  if comp.state == modelInitializationMode:
    comp.eventInfo.nextEventTimeDefined = fmi2True
    comp.eventInfo.nextEventTime = 1 + comp.time

proc eventUpdate*(comp: ModelInstance; eventInfo: ptr fmi2EventInfo;
                  timeEvent: int; isNewEventIteration: int) =
  if timeEvent != 0:
    comp.i[0] += 1
    if comp.i[0] == 13:
      eventInfo.terminateSimulation = fmi2True
      eventInfo.nextEventTimeDefined = fmi2False
    else:
      eventInfo.nextEventTimeDefined = fmi2True
      eventInfo.nextEventTime = 1 + comp.time

when NUMBER_OF_STATES > 0:
  var vrStates`gensym0*: array[NUMBER_OF_STATES, fmi2ValueReference] = STATES
include
  logger, masks, helpers, getters, setters

include
  modelinstance

CC: stdlib_assertions.nim
CC: stdlib_dollars.nim
CC: stdlib_formatfloat.nim
CC: stdlib_repr_v2.nim
CC: stdlib_io.nim
CC: stdlib_system.nim
CC: definitions.nim
CC: enquire.nim
CC: stdlib_parseutils.nim
CC: stdlib_unicode.nim
CC: stdlib_strutils.nim
CC: stdlib_strformat.nim
CC: model.nim
