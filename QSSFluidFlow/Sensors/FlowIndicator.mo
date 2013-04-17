model FlowIndicator "Simple volumetric flow sensor." 
  extends Interfaces.TwoFlange;
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
      Line(points=[-82, 0; 82, 0], style(color=0))), 
    Window(
      x=0.34, 
      y=0.21, 
      width=0.6, 
      height=0.6), 
    Documentation(info="<HTML>

<p>
Element to be inserted into a flow channel to receive a reading of
the volumentric flow rate in the channel which is propagated to
a connector of type Real outport.
</p>

<p>
This sensor class does neither implement sensor dynamics, 
nor flow resistance or fluid capacity.
</p>


</HTML>
"));
  Modelica.Blocks.Interfaces.OutPort FI annotation (
    extent=[-10, 80; 10, 100], 
    rotation=90, 
    layer="icon");
equation 
  FI.signal[1] = Fleft.q;
  dp = 0.0;
end FlowIndicator;
