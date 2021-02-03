#[
pag. 18

2.1.3 Status Returned by Functions
This section defines the “status” flag (an enumeration of type fmi2Status defined in file
“fmi2FunctionTypes.h”) that is returned by all functions to indicate the success of the function call:
]#

type
  fmi2Status* = enum
    ## Status returned by functions. The status has the following meaning
    fmi2OK      = 0,
      ## all well
    fmi2Warning = 1, 
      ## things are not quite right, but the computation can continue. Function “logger” was
      ## called in the model (see below), and it is expected that this function has shown the prepared
      ## information message to the user.
    fmi2Discard = 2,
      ##[
      this return status is only possible if explicitly defined for the corresponding function3
      (ModelExchange: fmi2SetReal, fmi2SetInteger, fmi2SetBoolean, fmi2SetString,
      fmi2SetContinuousStates, fmi2GetReal, fmi2GetDerivatives,
      fmi2GetContinuousStates, fmi2GetEventIndicators;
      CoSimulation: fmi2SetReal, fmi2SetInteger, fmi2SetBoolean, fmi2SetString,
      fmi2DoStep, fmiGetXXXStatus):
      - For "model exchange": It is recommended to perform a smaller step size and evaluate the model
      equations again, for example because an iterative solver in the model did not converge or because
      a function is outside of its domain (for example sqrt(<negative number>)). If this is not possible, the
      simulation has to be terminated.
      - For "co-simulation": fmi2Discard is returned also if the slave is not able to return the required
      status information. The master has to decide if the simulation run can be continued.
      In both cases, function “logger” was called in the FMU (see below) and it is expected that this
      function has shown the prepared information message to the user if the FMU was called in debug
      mode (loggingOn = fmi2True). Otherwise, “logger” should not show a message.

      3 Functions fmi2SetXXX do not usually perform calculations but just store the values that are passed in internal buffers. The
      actual calculation is performed by fmi2GetXXX functions. Still fmi2SetXXX functions could check whether the input arguments
      are in their validity range. If not, these functions could return with fmi2Discard.
      ]##
    fmi2Error   = 3,
      ##[
      the FMU encountered an error. The simulation cannot be continued with this FMU
      instance. If one of the functions returns fmi2Error, it can be tried to restart the simulation from a
      formerly stored FMU state by calling fmi2SetFMUstate. This can be done if the capability flag
      canGetAndSetFMUstate is true and fmi2GetFMUstate was called before in non-erroneous state.
      If not, the simulation cannot be continued and fmi2FreeInstance or fmi2Reset must be called
      afterwards.4
      Further processing is possible after this call; especially other FMU instances are not affected.
      Function “logger” was called in the FMU (see below), and it is expected that this function has
      shown the prepared information message to the user.
      ]##
    fmi2Fatal   = 4,
      ##[
      the model computations are irreparably corrupted for all FMU instances. [For example,
      due to a run-time exception such as access violation or integer division by zero during the execution
      of an fmi function]. Function “logger” was called in the FMU (see below), and it is expected that this
      function has shown the prepared information message to the user. It is not possible to call any other
      function for any of the FMU instances.
      ]##
    fmi2Pending = 5
      ##[
      this status is returned only from the co-simulation interface, if the slave executes the
      function in an asynchronous way. That means the slave starts to compute but returns immediately.
      The master has to call fmi2GetStatus(..., fmi2DoStepStatus) to determine if the slave has
      finished the computation. Can be returned only by fmi2DoStep and by fmi2GetStatus (see
      section 4.2.3).
      ]##