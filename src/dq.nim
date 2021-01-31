#[
Sample implementation of an FMU - the Dahlquist test equation.

 der(x) = - k * x and x(0) = 1.
 Analytical solution: x(t) = exp(-k*t).
 Copyright QTronic GmbH. All rights reserved.

]#

# nim c --nimcache:.cache --app:lib -o:dq.so dq.nim

import fmuTemplate
# define class name and unique id
const
  MODEL_IDENTIFIER* = "dq"
  MODEL_GUID*       {.exportc.} = "{8c4e810f-3df3-4a00-8276-176fa3c9f000}"

# define model size
  NUMBER_OF_REALS            = 3
  NUMBER_OF_INTEGERS         = 0
  NUMBER_OF_BOOLEANS         = 0
  NUMBER_OF_STRINGS          = 0
  NUMBER_OF_STATES           = 1
  NUMBER_OF_EVENT_INDICATORS = 0

# include fmu header files, typedefs and macros
#include "fmuTemplate.h"

# define all model variables and their value references
# conventions used here:
# - if x is a variable, then macro x is its variable reference
# - the vr of a variable is its index in array  r, i, b or s
# - if k is the vr of a real state, then k+1 is the vr of its derivative
  x     = 0
  der_x = 1
  k     = 2

# define state vector as vector of value references
  STATES = { x }

#  called by fmi2Instantiate
# Set values for all variables that define a start value
# Settings used unless changed by fmi2SetX before fmi2EnterInitializationMode


proc setStartValues(comp:ptr ModelInstance):void =
  #ptrMath:
  #  (comp.r+0)[]= 1
  #  comp.r[k]= 1
  #cast[ptr type(comp[])](cast[ByteAddress](p) +% off * sizeof(p[]))
  #cast[ptr ModelInstance](cast[int](addr comp) + 0 * sizeof(int) ) = 1
  #cast[ptr ModelInstance](cast[int](addr comp) + 2 * sizeof(int) ) = 1
  #comp.r[] = fmi2Real(x)#addr fmi2Real(x)
  #(comp.r + k) = addr fmi2Real(k)
  #var tmp:array[3,fmi2Real]
  var z = cast[ptr array[3,fmi2Real]](addr comp.r)
  z[0] = 1
  z[2] = 1
  #= fmi2Real(1)


# called by fmi2GetReal, fmi2GetInteger, fmi2GetBoolean, fmi2GetString, fmi2ExitInitialization
# if setStartValues or environment set new values through fmi2SetXXX.
# Lazy set values for all variable that are computed from other variables.
proc calculateValues(comp:ptr ModelInstance):void = discard
    #if (comp->state == modelInitializationMode) {
    #  initialization code here
    #  set first time event, if any, using comp->eventInfo.nextEventTime
    #}

# called by fmi2GetReal, fmi2GetContinuousStates and fmi2GetDerivatives
proc getReal(comp:ptr ModelInstance, vr:fmi2ValueReference):fmi2Real =
    var r = cast[ptr array[3,fmi2Real]](addr comp.r)
    case vr:
      of x     : return r[x]
      of der_x : return - r[k] * r[x]
      of k     : return r[k]
      else     : return 0



# used to set the next time event, if any.
proc eventUpdate(comp:ptr ModelInstance, eventInfo:ptr fmi2EventInfo, isTimeEvent:int, isNewEventIteration:int):void = discard


# include code that implements the FMI based on the above definitions
{.passC:"-fvisibility=hidden".}

{.passC: "-I./fmusdk-master/fmu20/src/shared/include -w -fmax-errors=5".}

{.passC: "-DMODEL_IDENTIFIER=\\\"" & MODEL_IDENTIFIER & "\\\"".}
{.passC: "-DMODEL_GUID=\\\"" & MODEL_GUID & "\\\"".}
{.passC: "-DNUMBER_OF_REALS=" & $NUMBER_OF_REALS .}
{.passC: "-DNUMBER_OF_INTEGERS=" & $NUMBER_OF_INTEGERS .}
{.passC: "-DNUMBER_OF_BOOLEANS=" & $NUMBER_OF_BOOLEANS .}
{.passC: "-DNUMBER_OF_STRINGS=" & $NUMBER_OF_STRINGS .}
{.passC: "-DNUMBER_OF_STATES=" & $NUMBER_OF_STATES .}
{.passC: "-DNUMBER_OF_EVENT_INDICATORS=" & $NUMBER_OF_EVENT_INDICATORS .}
{.compile: "fmusdk-master/fmu20/src/models/fmuTemplate2.c".} # Edited (with #include "fmuTemplate.h")
