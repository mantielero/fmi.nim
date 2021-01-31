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
  fmi2FMUstate* {.impfmuTemplate.} = pointer

#  Pointer to internal FMU state
  fmi2ValueReference* {.impfmuTemplate.} = cuint
  fmi2Real* {.impfmuTemplate.} = cdouble
  fmi2Integer* {.impfmuTemplate.} = cint
  fmi2Boolean* {.impfmuTemplate.} = cint
  fmi2Char* {.impfmuTemplate.} = cchar
  fmi2String* {.impfmuTemplate.} = cstring #ptr fmi2Char
  fmi2Byte* {.impfmuTemplate.} = cchar  