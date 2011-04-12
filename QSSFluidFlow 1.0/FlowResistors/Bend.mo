model Bend 
  extends Interfaces.TwoFlange;
  
  parameter Real Kbend=0.75;
  parameter SI.Diameter D=0.04;
  
  SI.Area A;
  SI.Velocity v(start=1.0, fixed=false);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Diagram, 
    Icon(
      Text(extent=[0, -100; 0, -132], string="%name"), 
      Polygon(points=[-100, -28; -54, -76; 0, -94; 54, -76; 100, -28; 60, 12; 
            60, 12; 20, -26; 0, -32; -20, -28; -60, 12; -100, -28], style(
            fillColor=67)), 
      Line(points=[-60, -54; 58, -54], style(color=0)), 
      Line(points=[58, -54; 42, -46], style(color=0)), 
      Line(points=[58, -54; 44, -62], style(color=0))), 
    Window(
      x=0.37, 
      y=0.32, 
      width=0.6, 
      height=0.6));
equation 
  A = (pi/4)*D^2;
  
  q = v*A;
  dp = noEvent(if (v >= 0) then Kbend*(rho/2)*v^2 else -Kbend*(rho/2)*(-v)^2);
end Bend;
