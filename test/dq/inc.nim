# nim c --nimcache:.cache --app:lib -o:inc.so inc.nim
import fmuTemplate
import strformat

# Porting inc.c (a particular model)
const
   MODEL_IDENTIFIER="inc"
   MODEL_GUID="{8c4e810f-3df3-4a00-8276-176fa3c9f008}"
   
   #define model size
   NUMBER_OF_REALS= 0
   NUMBER_OF_INTEGERS=1
   NUMBER_OF_BOOLEANS=0
   NUMBER_OF_STRINGS=0
   NUMBER_OF_STATES=0
   NUMBER_OF_EVENT_INDICATORS=0

const
   counter = 0

proc setStartValues(comp:ptr ModelInstance) {.exportc: "$1".} =
    comp.i[counter] = 1

proc calculateValues(comp:ptr ModelInstance) {.exportc: "$1".}=
    if comp.state == modelInitializationMode:
        # set first time event
        comp.eventInfo.nextEventTimeDefined = fmi2True
        comp.eventInfo.nextEventTime        = 1 + comp.time

proc eventUpdate(comp:ptr ModelInstance, eventInfo:ptr fmi2EventInfo, timeEvent:cint, isNewEventIteration:cint) {.exportc: "$1".} =
    if timeEvent != 0:
        comp.i[counter] += 1;
        if comp.i[counter] == 13:
            eventInfo.terminateSimulation  = fmi2True
            eventInfo.nextEventTimeDefined = fmi2False
        else:
            eventInfo.nextEventTimeDefined = fmi2True
            eventInfo.nextEventTime        = 1 + comp.time

{.passC: "-I/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include/ -w -fmax-errors=5" .}

{.passC: "-DMODEL_IDENTIFIER=\\\"" & MODEL_IDENTIFIER & "\\\"".}
{.passC: "-DMODEL_GUID=\\\"" & MODEL_GUID & "\\\"".}
{.passC: "-DNUMBER_OF_REALS=" & $NUMBER_OF_REALS .}
{.passC: "-DNUMBER_OF_INTEGERS=" & $NUMBER_OF_INTEGERS .}
{.passC: "-DNUMBER_OF_BOOLEANS=" & $NUMBER_OF_BOOLEANS .}
{.passC: "-DNUMBER_OF_STRINGS=" & $NUMBER_OF_STRINGS .}
{.passC: "-DNUMBER_OF_STATES=" & $NUMBER_OF_STATES .}
{.passC: "-DNUMBER_OF_EVENT_INDICATORS=" & $NUMBER_OF_EVENT_INDICATORS .}
#{.passC: "-include ../fmuTemplate.h".}
{.compile: "../fmuTemplate.c".}