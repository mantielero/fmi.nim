import fmusdk
#[
from pythonfmu import Fmi2Causality, Fmi2Variability, Fmi2Slave, Real


class Resistor(Fmi2Slave):

    author = "John Doe"
    description = "A simple description"

    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        self.positive_pin_v = 20.
        self.positive_pin_i = 0.001
        self.negative_pin_v = 10.
        self.negative_pin_i = 0.001
        self.delta_v = 10.
        self.i = 0.001
        self.R = 10000.
        
        self.register_variable(Real("R", causality=Fmi2Causality.parameter, variability=Fmi2Variability.tunable))

        self.register_variable(Real("positive_pin_v", causality=Fmi2Causality.input))
        self.register_variable(Real("positive_pin_i", causality=Fmi2Causality.output))
        self.register_variable(Real("negative_pin_v", causality=Fmi2Causality.input))
        self.register_variable(Real("negative_pin_i", causality=Fmi2Causality.output))

        self.register_variable(Real("delta_v", causality=Fmi2Causality.local))
        self.register_variable(Real("i", causality=Fmi2Causality.local))

    def do_step(self, current_time, step_size):
        self.delta_v = self.positive_pin_v - self.negative_pin_v
        self.i = i = self.delta_v / self.R
        self.positive_pin_i = i
        self.negative_pin_i = -i
        return True
]#

#[
model circuit
   Resistor  R1(R=10);
   Capacitor C(C=0.01);
   Resistor  R2(R=100);
   Inductor  L(L=0.1);
   VsourceAC AC;
   Ground    G;
equation
   connect (AC.p, R1.p);    // Capacitor circuit
   connect (R1.n, C.p);
   connect (C.n, AC.n);
   connect (R1.p, R2.p);    // Inductor circuit
   connect (R2.n, L.p);
   connect (L.n,  C.n);
   connect (AC.n, G.p);     // Ground
end circuit;  
]#

model: "inc" "{8c4e810f-3df3-4a00-8276-176fa3c9f008}"
  decl:
    var a:int
  init:
    a = 1

  calc:
    proc calculateValues*( comp: ModelInstance) =
    if comp.state == modelInitializationMode:
        # set first time event
        comp.eventInfo.nextEventTimeDefined = fmi2True
        comp.eventInfo.nextEventTime        = 1 + comp.time

    