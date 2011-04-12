model LinearFlowResistor 
  extends Interfaces.TwoFlange;
  
  parameter Real k=500000;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Text(
        extent=[-78, 16; 82, 2], 
        string="k =  %k", 
        style(color=41)), 
      Line(points=[-82, 0; -60, 0], style(color=0)), 
      Rectangle(extent=[-60, 40; 60, -40], style(color=0)), 
      Line(points=[60, 0; 82, 0], style(color=0)), 
      Text(extent=[-100, -66; 100, -74], string="%name")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
equation 
  dp = k*q;
end LinearFlowResistor;
