model IdealFlowSource "Pump modeled as ideal flow source." 
  extends Interfaces.TwoFlange;
  
  parameter SI.VolumeFlowRate qsource=0.01;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Text(
        extent=[-96, 12; 66, -12], 
        string="qsource = %qsource", 
        style(color=41)), 
      Line(points=[80, 0; -40, 68], style(color=0, thickness=2)), 
      Line(points=[80, 0; -40, -68], style(color=0, thickness=2)), 
      Ellipse(extent=[-80, 80; 80, -80], style(color=0, thickness=2)), 
      Text(extent=[-100, -86; 102, -102], string="%name")), 
    Window(
      x=0.51, 
      y=0.36, 
      width=0.35, 
      height=0.49), 
    Documentation(info="<HTML>

<p>
A pump modeled as ideal flow source is an abstraction 
of the behavior of a volumetric pump (piston, displacement pumps),
which have a very steeep relation between pressure increase and 
flow across the pump.  The idealized characteristic is simply
<i>q_pump = q_source</i> where the flow rate through the pump is
a constant, independent of the pressure gradient.
</p>



</HTML>
"));
equation 
  dp = 0.0;
  q = qsource;
end IdealFlowSource;
