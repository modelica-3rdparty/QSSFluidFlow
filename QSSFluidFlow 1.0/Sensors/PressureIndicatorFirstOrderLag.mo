model PressureIndicatorFirstOrderLag 
  "Pressure sensor with 1st order exponential lag." 
  extends Interfaces.TwoFlange;
  
  parameter SI.Time tau=1.0 "delay of first order lag of sensor dynamics";
  parameter SI.Pressure ps_start=1e5 "start value of pressure sensor state";
  
protected 
  SI.Pressure ps(start=ps_start) "sensor state";
  SI.Pressure pa "physical property to be measured";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Ellipse(extent=[-32, 80; 28, 20], style(color=0)), 
      Line(points=[0, 20; 0, 0], style(color=0)), 
      Text(
        extent=[-24, 66; 22, 34], 
        string="PI", 
        style(color=0)), 
      Line(points=[-82, 0; 82, 0], style(color=0)), 
      Text(
        extent=[-80, 0; 84, -18], 
        string="tau =  %tau", 
        style(color=41))), 
    Documentation(info="<HTML>

<p>
Element to be inserted into a flow channel to receive a reading of
the absolute pressure in the channel which is propagated to
a connector of type Real outport.
</p>

<p>
This sensor class does not implement flow resistance or fluid capacity.
</p>

<p>
The sensor is modeled to have first order exponential lag characteristic.
The actual physical property <i>pa</i> to be measured is transfered to the sensor output
signal <i>ps</i> via first order exponential delay with delay constant <i>tau</i>.
</p>


</HTML>
"), 
    Window(
      x=0.1, 
      y=0.01, 
      width=0.7, 
      height=0.93));
public 
  Modelica.Blocks.Interfaces.OutPort PI annotation (
    extent=[-10, 80; 10, 100], 
    rotation=90, 
    layer="icon");
equation 
  //actual pressure value
  pa = Fleft.p;
  //sensor signal output
  PI.signal[1] = ps;
  //sensor dynamics
  tau*der(ps) = -ps + pa;
  //pressure drop over sensor
  dp = 0.0;
end PressureIndicatorFirstOrderLag;
