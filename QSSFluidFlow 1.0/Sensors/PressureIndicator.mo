model PressureIndicator "Simple pressure sensor." 
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
        string="PI", 
        style(color=0)), 
      Line(points=[-82, 0; 82, 0], style(color=0))), 
    Window(
      x=0.15, 
      y=0.01, 
      width=0.65, 
      height=0.49), 
    Documentation(info="<HTML>

<p>
Element to be inserted into a flow channel to receive a reading of
the absolute pressure in the channel which is propagated to
a connector of type Real outport.
</p>

<p>
This sensor class does neither implement sensor dynamics, 
nor flow resistance or fluid capacity.
</p>


</HTML>
"));
  Modelica.Blocks.Interfaces.OutPort PI annotation (
    extent=[-10, 80; 10, 100], 
    rotation=90, 
    layer="icon");
equation 
  PI.signal[1] = Fleft.p;
  dp = 0.0;
end PressureIndicator;
