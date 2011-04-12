model IdealPressureSource "Pump modeled as ideal pressure source." 
  extends Interfaces.TwoFlange;
  
  parameter SI.Height deltah=10.0 "Pressure head generated";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Text(
        extent=[-96, 12; 76, -14], 
        string="deltah =  %deltah", 
        style(color=41)), 
      Line(points=[80, 0; -40, 68], style(color=0, thickness=2)), 
      Line(points=[80, 0; -40, -68], style(color=0, thickness=2)), 
      Ellipse(extent=[-80, 80; 80, -80], style(color=0, thickness=2)), 
      Text(extent=[-98, -86; 102, -102], string="%name")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="<HTML>

<p>
A pump modeled as pressure source is an idealized abstraction
of a centrifugal pump type. Its parameter can be set as height
<i>delta_h_source</i> which determines the pressure rise in the pump,
independent of the flow rate.  The pressure increase over the pump
is <i>delta_p = delta_h_source * rho * g</i>.
</p>



</HTML>
"));
equation 
  //pressure difference generated
  dp = -deltah*rho*g_n;
end IdealPressureSource;
