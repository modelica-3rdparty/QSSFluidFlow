model QuadraticFlowResistor 
  extends Interfaces.TwoFlange;
  
  parameter Real zeta=0.75 "irreversible pressure loss coefficient";
  parameter SI.Diameter D=0.04;
  
  SI.Area A;
  SI.Velocity v;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Text(
        extent=[-78, 16; 82, 2], 
        string="zeta =  %zeta", 
        style(color=41)), 
      Line(points=[-82, 0; -60, 0], style(color=0)), 
      Rectangle(extent=[-60, 40; 60, -40], style(color=0)), 
      Line(points=[60, 0; 82, 0], style(color=0)), 
      Rectangle(extent=[-64, 46; 64, -46], style(color=0)), 
      Text(extent=[-100, -62; 100, -70], string="%name")), 
    Window(
      x=0.33, 
      y=0.13, 
      width=0.55, 
      height=0.82));
equation 
  A = (pi/4)*D^2;
  q = v*A;
  dp = noEvent(if (v >= 0) then zeta*(rho/2)*v^2 else -zeta*(rho/2)*(-v)^2);
  
end QuadraticFlowResistor;
