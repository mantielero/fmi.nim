#[
This model increments an int counter every second.

The compilation of this file generates the creator of the fmu. So the following
line will create completely a `inc.fmu` in this case:

    $ nim c -r model  

To test `inc.fmu`, the following will test it for 10sec using 0.1sec steps:

    $ fmusdk-master/fmu20/bin/fmusim_me inc.fmu 10 0.1


https://github.com/ModiaSim/Modia.jl

FUTURO: Julia Modia
  using Modia
  @model FirstOrder begin
     x = Variable(start=1)   # start means x(0)
     T = Parameter(0.5)      # Time constant
     u = 2.0                 # Same as Parameter(2.0)
  @equations begin
     T*der(x) + x = u        # der() means time derivative
     end
  end;

model("FirstOrder"):
  
]#
import ../src/fmusdk

fmu( "inc", "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"):
  var contador:int = 1
  register(contador, cOutput, vDiscrete, iExact, "counts the seconds" )

  #calculate:  # Calculate values
  initialization:  # Initialization code goes here
      # set first time event
      comp.eventInfo.nextEventTimeDefined = fmi2True
      comp.eventInfo.nextEventTime        = 1 + comp.time  # So it will be 1sec if simulation starts at 0sec

  event:  # used to set the next time event (if any)
    if isTimeEvent:  # Each time there is a timeEvent, the counter is increased.
        contador += 1  # Increase the counter
        if contador == 13:  # Stop condition (avoids going further than 13sec)
            eventInfo.terminateSimulation  = fmi2True
            eventInfo.nextEventTimeDefined = fmi2False
        else:
            eventInfo.nextEventTimeDefined = fmi2True
            eventInfo.nextEventTime        = 1 + comp.time
