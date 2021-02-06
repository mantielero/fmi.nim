type
  fmi2CallbackLogger*  = proc( a1: fmi2ComponentEnvironment, 
                               a2: fmi2String, 
                               a3: fmi2Status, 
                               a4: fmi2String, a5: fmi2String) #{.cdecl.}
  fmi2CallbackAllocateMemory* = proc(a1: cuint, a2: cuint) #{.cdecl.}
  fmi2CallbackFreeMemory*  = proc(a1: pointer) #{.cdecl.}
  fmi2StepFinished*  = proc(a1: fmi2ComponentEnvironment, a2: fmi2Status) #{.cdecl.}


  fmi2CallbackFunctions*  = object #{.impfmuTemplate, bycopy.} = object
    logger*: fmi2CallbackLogger
    allocateMemory*: fmi2CallbackAllocateMemory
    freeMemory*: fmi2CallbackFreeMemory
    stepFinished*: fmi2StepFinished
    componentEnvironment*: fmi2ComponentEnvironment

##[
The struct contains pointers to functions provided by the environment to be used by the
FMU. It is not allowed to change these functions between fmi2Instantiate(..) and
fmi2Terminate(..) calls. Additionally, a pointer to the environment is provided
(componentEnvironment) that needs to be passed to the “logger” function, in order that the
logger function can utilize data from the environment, such as mapping a valueReference
to a string. In the unlikely case that fmi2Component is also needed in the logger, it has to be
passed via argument componentEnvironment. Argument componentEnvironment may be
a null pointer.
The componentEnvironment pointer is also passed to the stepFinished(..) function in
order that the environment can provide an efficient way to identify the slave that called
stepFinished(..).
In the default fmi2FunctionTypes.h file, typedefs for the function definitions are present
to simplify the usage; this is non-normative. The functions have the following meaning:
Function logger:
Pointer to a function that is called in the FMU, usually if an fmi2XXX function, does not
behave as desired. If “logger” is called with “status = fmi2OK”, then the message is a
pure information message. “instanceName” is the instance name of the model that calls this
function. “category” is the category of the message. The meaning of “category” is defined
by the modeling environment that generated the FMU. Depending on this modeling
environment, none, some or all allowed values of “category” for this FMU are defined in the
modelDescription.xml file via element “<fmiModelDescription><LogCategories>”,
see section 2.2.4. Only messages are provided by function logger that have a category
according to a call to fmi2SetDebugLogging (see below). Argument “message” is provided
in the same way and with the same format control as in function “printf” from the C
standard library. [Typically, this function prints the message and stores it optionally in a log
file.]
All string-valued arguments passed by the FMU to the logger may be deallocated by the
FMU directly after function logger returns. The environment must therefore create copies of
these strings if it needs to access these strings later.
The logger function will append a line break to each message when writing messages
after each other to a terminal or a file (the messages may also be shown in other ways, for
example, as separate text-boxes in a GUI). The caller may include line-breaks (using "\n")
within the message, but should avoid trailing line breaks.
Variables are referenced in a message with “#<Type><ValueReference>#” where
<Type> is “r” for fmi2Real, “i” for fmi2Integer, “b” for fmi2Boolean and “s” for
fmi2String. If character “#”shall be included in the message, it has to be prefixed with “#”,
so “#” is an escape character. [Example:
A message of the form
“#r1365# must be larger than zero (used in IO channel ##4)”
might be changed by the logger function to
“body.m must be larger than zero (used in IO channel #4)”
if “body.m” is the name of the fmi2Real variable with fmi2ValueReference =
1365.]
Function allocateMemory:
Pointer to a function that is called in the FMU if memory needs to be allocated. If attribute
“canNotUseMemoryManagementFunctions = true” in


<fmiModelDescription><ModelExchange / CoSimulation>, then function
allocateMemory is not used in the FMU and a void pointer can be provided. If this attribute
has a value of “false” (which is the default), the FMU must not use malloc, calloc or
other memory allocation functions. One reason is that these functions might not be available
for embedded systems on the target machine. Another reason is that the environment may
have optimized or specialized memory allocation functions. allocateMemory returns a
pointer to space for a vector of nobj objects, each of size “size” or NULL, if the request
cannot be satisfied. The space is initialized to zero bytes [(a simple implementation is to use
calloc from the C standard library)].
Function freeMemory:
Pointer to a function that must be called in the FMU if memory is freed that has been
allocated with allocateMemory. If a null pointer is provided as input argument obj, the
function shall perform no action [(a simple implementation is to use free from the C
standard library; in ANSI C89 and C99, the null pointer handling is identical as defined
here)]. If attribute “canNotUseMemoryManagementFunctions = true” in
<fmiModelDescription><ModelExchange / CoSimulation>, then function
freeMemory is not used in the FMU and a null pointer can be provided.
Function stepFinished:

Optional call back function to signal if the computation of a communication step of a co-
simulation slave is finished. A null pointer can be provided. In this case the master must

use fmiGetStatus(..) to query the status of fmi2DoStep. If a pointer to a function
is provided, it must be called by the FMU after a completed communication step.
[Note: In FMI 3.0, memory callback functions were removed, because their intended
uses failed to materialize and the implementations often had issues.
New in FMI 2.0.2: It is discouraged to use the memory callback functions.]

]##