const
  fmi2True* = 1
  fmi2False* = 0  

type
  fmi2Component* {.exportc:"$1".} = pointer
    ##[
    This is a pointer to an FMU specific data structure that contains the information needed to
    process the model equations or to process the co-simulation of the respective slave. This data
    structure is implemented by the environment that provides the FMU; in other words, the calling
    environment does not know its content, and the code to process it must be provided by the FMU
    generation environment and must be shipped with the FMU.
    ]##

#  Pointer to FMU instance
  fmi2ComponentEnvironment* {.exportc:"$1".} = pointer
  ##[
  This is a pointer to a data structure in the simulation environment that calls the FMU. Using this
  pointer, data from the modelDescription.xml file [(for example, mapping of valueReferences to
  variable names)] can be transferred between the simulation environment and the logger function
  (see section 2.1.5).
  ]##

#  Pointer to FMU environment
  fmi2FMUstate* {.exportc:"$1".} = pointer

#  Pointer to internal FMU state
  fmi2ValueReference* {.exportc:"$1".} = uint32 # unsigned int
  fmi2Real* {.exportc:"$1".} = float64   # double
  fmi2Integer* {.exportc:"$1".} = int32  # int
  fmi2Boolean* {.exportc:"$1".} = int32 #{.dynlib.}
  fmi2Char* {.exportc:"$1".} = char
  fmi2String* {.exportc:"$1".}= cstring #ptr fmi2Char
  fmi2Byte* {.exportc:"$1".} = char

proc `$`(a:fmi2String): string =
  #var b:josemaria = true
  #echo(b)
  $(a.cstring)



proc `[]`*[T:SomeInteger](vr:ptr fmi2ValueReference, n:T):fmi2ValueReference =
    var v = cast[ptr UncheckedArray[fmi2ValueReference]](vr) #fmi2ValueReference] 
    v[n.uint64] #= cast[typeof(vr_tmp)](realloc(vr, nvr.int * sizeof(fmi2ValueReference)))

proc `[]`*(vr:ptr fmi2Real, n:uint64):fmi2Real =
    var v = cast[ptr UncheckedArray[fmi2Real]](vr) #fmi2ValueReference] 
    v[n] #= cast[typeof(vr_tmp)](realloc(vr, nvr.int * sizeof(fmi2ValueReference)))    

proc `[]=`*[I:SomeInteger](vr:ptr fmi2Real, n:I, val:fmi2Real) =
    var vr = cast[ptr UncheckedArray[fmi2Real]](vr)
    vr[n] = val

proc `[]`*(vr:ptr fmi2Integer, n:uint64):fmi2Integer =
    var v = cast[ptr UncheckedArray[fmi2Integer]](vr) #fmi2ValueReference] 
    v[n] #= cast[typeof(vr_tmp)](realloc(vr, nvr.int * sizeof(fmi2ValueReference)))    

proc `[]=`*(vr:ptr fmi2Integer, n:uint64, val:fmi2Integer) =
    var vr = cast[ptr UncheckedArray[fmi2Integer]](vr)
    vr[n] = val

proc `[]=`*(vr:ptr fmi2String, n:uint64, val:fmi2String) =
    var vr = cast[ptr UncheckedArray[fmi2String]](vr)
    vr[n] = val


proc `[]`*(vr:ptr fmi2String, n:uint64):fmi2String =
    var v = cast[ptr UncheckedArray[fmi2String]](vr) #fmi2ValueReference] 
    v[n] #= cast[typeof(vr_tmp)](realloc(vr, nvr.int * sizeof(fmi2ValueReference))) 