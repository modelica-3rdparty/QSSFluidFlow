model FlowIndicatorFirstOrderLag 
  "Volumetric flow sensor with 1st order exponential lag." 
  extends Interfaces.TwoFlange;
  
  parameter SI.Time tau=1.0 "delay of first order lag of sensor dynamics";
  parameter SI.VolumeFlowRate qs_start=0.0 
    "start value of volumetric flow sensor state";
  
protected 
  SI.VolumeFlowRate qs(start=qs_start) "sensor state";
  SI.VolumeFlowRate qa "physical property to be measured";
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
        string="FI", 
        style(color=0)), 
      Line(points=[-82, 0; 82, 0], style(color=0)), 
      Text(
        extent=[-80, 0; 84, -18], 
        string="tau =  %tau", 
        style(color=41))), 
    Documentation(info="<HTML>

<p>
Element to be inserted into a flow channel to receive a reading of
the volumentric flow rate in the channel which is propagated to
a connector of type Real outport.
</p>

<p>
This sensor class does not implement flow resistance or fluid capacity.
</p>

<p>
The sensor is modeled to have first order exponential lag characteristic.
The actual physical property <i>qa</i> to be measured is transfered to the sensor output
signal <i>qs</i> via first order exponential delay with delay constant <i>tau</i>.
</p>

</HTML>
"), 
    Window(
      x=0.09, 
      y=0.1, 
      width=0.6, 
      height=0.87));
public 
  Modelica.Blocks.Interfaces.OutPort FI annotation (
    extent=[-10, 80; 10, 100], 
    rotation=90, 
    layer="icon");
equation 
  //actual pressure value
  qa = Fleft.q;
  //sensor signal output
  FI.signal[1] = qs;
  //sensor dynamics
  tau*der(qs) = -qs + qa;
  //pressure drop over sensor
  dp = 0.0;
end FlowIndicatorFirstOrderLag;
