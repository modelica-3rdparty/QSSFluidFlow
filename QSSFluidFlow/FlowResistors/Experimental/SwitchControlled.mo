model SwitchControlled 
  parameter Real Rclosed=1.e2;
  parameter Real Gopen=1.e-12;
  parameter Real level=0.5;
  
protected 
  Real s;
  Boolean s_closed "s(witch)_closed: fluid can flow == true";
public 
  extends Interfaces.TwoFlange;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Line(points=[-82, 0; -46, 0], style(color=0)), 
      Line(points=[-36, 4; 18, 60], style(color=0)), 
      Ellipse(extent=[-48, 6; -34, -8], style(color=0)), 
      Line(points=[82, 0; 40, 0], style(color=0)), 
      Text(extent=[-100, -18; 100, -26], string="%name"), 
      Line(points=[0, 80; 0, 40], style(color=0)), 
      Line(points=[40, 8; 40, -8], style(color=0))), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
public 
  Interfaces.Flange Fin annotation (extent=[-100, -12; -80, 10], layer="icon");
  Interfaces.Flange Fout annotation (
    extent=[80, 12; 100, -10], 
    rotation=180, 
    layer="icon");
  Modelica.Blocks.Interfaces.InPort Control annotation (
    extent=[-10, 80; 10, 100], 
    rotation=-90, 
    layer="icon");
equation 
  s_closed = Control.signal[1] < level;
  dp = if s_closed then s*Rclosed else s;
  q = if s_closed then s else s*Gopen;
end SwitchControlled;
