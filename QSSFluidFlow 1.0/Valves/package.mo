package Valves "Control valves"
extends Modelica.Icons.Library2;


annotation (
  Coordsys(
    extent=[0, 0; 442, 394], 
    grid=[1, 1], 
    component=[20, 20]), 
  Window(
    x=0.45, 
    y=0.01, 
    width=0.35, 
    height=0.49, 
    library=1, 
    autolayout=1), 
  Documentation(info="<HTML>

<p>
Selection of valves with different characteristics (depending on type
and construction of the valve) with and without positioning dynamics 
(first order exponential lag with time constant <i>tau</i>.  The valve 
characteristics are implemented according to the relations given in 
Thomas P. (1999), <i>Simulation of Industrial Processes For Control
Engineers</i>,  Butterworth-Heinemann, Oxford, UK.
</p>

<p>
The minimum valve travel <i>xmin</i> (stroke of valve actuator piston) is
set by default to a small value, to prevent complete closure
of the valve. This, in order to prevent potential problems at simulation 
execution time.  For certain system structures, the value of <i>xmin</i>
can be set to zero if desired.
</p>

</HTML>
"));
end Valves;
