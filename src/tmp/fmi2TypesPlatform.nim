
{.passC: "-DDISABLE_PREFIX".}


{.passC: "-I/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include".}

{.passC: "-I/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared".}
# Importing /home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include/fmi2TypesPlatform.h
# Generated at 2019-07-11T22:55:48+02:00
# Command line:
#   /home/jose/.nimble/pkgs/nimterop-0.1.0/nimterop/toast --pnim --preprocess --defines+=DISABLE_PREFIX --includeDirs+=/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include --includeDirs+=/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared --nim:/usr/bin/nim /home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include/fmi2TypesPlatform.h

{.hint[ConvFromXtoItselfNotNeeded]: off.}

import nimterop/types

const
  headerfmi2TypesPlatform {.used.} = "/home/jose/src/nimlang/fmusdk-master/fmu20/src/shared/include/fmi2TypesPlatform.h"

#  Values for fmi2Boolean
  fmi2True* = 1
  fmi2False* = 0

{.pragma: impfmi2TypesPlatform, importc, header: headerfmi2TypesPlatform.}
{.pragma: impfmi2TypesPlatformC, impfmi2TypesPlatform, cdecl.}

type

#  Standard header file to define the argument types of the
#    functions of the Functional Mock-up Interface 2.0.
#    This header file must be utilized both by the model and
#    by the simulation engine.
#    Revisions:
#    - Apr.  9, 2014: all prefixes "fmi" renamed to "fmi2" (decision from April 8)
#    - Mar   31, 2014: New datatype fmiChar introduced.
#    - Feb.  17, 2013: Changed fmiTypesPlatform from "standard32" to "default".
#                      Removed fmiUndefinedValueReference since no longer needed
#                      (because every state is defined in ScalarVariables).
#    - March 20, 2012: Renamed from fmiPlatformTypes.h to fmiTypesPlatform.h
#    - Nov.  14, 2011: Use the header file "fmiPlatformTypes.h" for FMI 2.0
#                      both for "FMI for model exchange" and for "FMI for co-simulation"
#                      New types "fmiComponentEnvironment", "fmiState", and "fmiByte".
#                      The implementation of "fmiBoolean" is change from "char" to "int".
#                      The #define "fmiPlatform" changed to "fmiTypesPlatform"
#                      (in order that #define and function call are consistent)
#    - Oct.   4, 2010: Renamed header file from "fmiModelTypes.h" to fmiPlatformTypes.h"
#                      for the co-simulation interface
#    - Jan.   4, 2010: Renamed meModelTypes_h to fmiModelTypes_h (by Mauss, QTronic)
#    - Dec.  21, 2009: Changed "me" to "fmi" and "meModel" to "fmiComponent"
#                      according to meeting on Dec. 18 (by Martin Otter, DLR)
#    - Dec.   6, 2009: Added meUndefinedValueReference (by Martin Otter, DLR)
#    - Sept.  9, 2009: Changes according to FMI-meeting on July 21:
#                      Changed "version" to "platform", "standard" to "standard32",
#                      Added a precise definition of "standard32" as comment
#                      (by Martin Otter, DLR)
#    - July  19, 2009: Added "me" as prefix to file names, added meTrue/meFalse,
#                      and changed meValueReferenced from int to unsigned int
#                      (by Martin Otter, DLR).
#    - March  2, 2009: Moved enums and function pointer definitions to
#                      ModelFunctions.h (by Martin Otter, DLR).
#    - Dec.  3, 2008 : First version by Martin Otter (DLR) and
#                      Hans Olsson (Dynasim).
#    Copyright © 2008-2011 MODELISAR consortium,
#                2012-2013 Modelica Association Project "FMI"
#                All rights reserved.
#    This file is licensed by the copyright holders under the BSD 2-Clause License
#    (http:www.opensource.org/licenses/bsd-license.html):
#    ----------------------------------------------------------------------------
#    Redistribution and use in source and binary forms, with or without
#    modification, are permitted provided that the following conditions are met:
#    - Redistributions of source code must retain the above copyright notice,
#      this list of conditions and the following disclaimer.
#    - Redistributions in binary form must reproduce the above copyright notice,
#      this list of conditions and the following disclaimer in the documentation
#      and/or other materials provided with the distribution.
#    - Neither the name of the copyright holders nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
#    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#    PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
#    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
#    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#    PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#    OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#    WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#    OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#    ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#    ----------------------------------------------------------------------------
#    with the extension:
#    You may distribute or publicly perform any modification only under the
#    terms of this license.
#    (Note, this means that if you distribute a modified file,
#     the modified file must also be provided under this license).
# 
#  Platform (unique identification of this header file)
#  Type definitions of variables passed as arguments
#    Version "default" means:
#    fmi2Component           : an opaque object pointer
#    fmi2ComponentEnvironment: an opaque object pointer
#    fmi2FMUstate            : an opaque object pointer
#    fmi2ValueReference      : handle to the value of a variable
#    fmi2Real                : double precision floating-point data type
#    fmi2Integer             : basic signed integer data type
#    fmi2Boolean             : basic signed integer data type
#    fmi2Char                : character data type
#    fmi2String              : a pointer to a vector of fmi2Char characters
#                              ('\0' terminated, UTF8 encoded)
#    fmi2Byte                : smallest addressable unit of the machine, typically one byte.
# 
  fmi2Component* {.impfmi2TypesPlatform.} = pointer

#  Pointer to FMU instance
  fmi2ComponentEnvironment* {.impfmi2TypesPlatform.} = pointer

#  Pointer to FMU environment
  fmi2FMUstate* {.impfmi2TypesPlatform.} = pointer

#  Pointer to internal FMU state
  fmi2ValueReference* {.impfmi2TypesPlatform.} = cuint
  fmi2Real* {.impfmi2TypesPlatform.} = cdouble
  fmi2Integer* {.impfmi2TypesPlatform.} = cint
  fmi2Boolean* {.impfmi2TypesPlatform.} = cint
  fmi2Char* {.impfmi2TypesPlatform.} = cchar
  fmi2String* {.impfmi2TypesPlatform.} = ptr fmi2Char
  fmi2Byte* {.impfmi2TypesPlatform.} = cchar

