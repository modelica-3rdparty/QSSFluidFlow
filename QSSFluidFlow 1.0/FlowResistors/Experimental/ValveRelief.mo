model ValveRelief 
  extends Interfaces.TwoFlange;
  parameter Real k=500000.0;
  parameter Real Rclosed=1.e2;
  parameter Real Gopen=1.e-12;
  parameter SI.Pressure level=10e5 
    "pressure difference for relief valve to open";
  
protected 
  Real s;
  Boolean s_closed(start=false) "s(witch)_closed: fluid can flow == true";
  annotation (Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), Icon(
      Line(points=[60, 40; 60, -40; -60, 40; -60, -40; 60, 40], style(color=0))
        , 
      Line(points=[-82, 0; -60, 0], style(color=0)), 
      Line(points=[60, 0; 82, 0], style(color=0)), 
      Line(points=[60, 40; 60, -40; -60, 40; -60, -40; 60, 40], style(color=0))
        , 
      Text(
        extent=[-84, -38; 76, -52], 
        string="k =  %k", 
        style(color=41)), 
      Line(points=[-82, 0; -60, 0], style(color=0)), 
      Line(points=[60, 0; 82, 0], style(color=0)), 
      Text(extent=[-102, -62; 98, -70], string="%name"), 
      Line(points=[0, 0; 0, 100], style(color=0)), 
      Line(points=[10, 100; -10, 80], style(color=0)), 
      Line(points=[16, 90; -16, 58], style(color=0)), 
      Line(points=[20, 80; -18, 42], style(color=0)), 
      Line(points=[0, 60; 40, 60], style(color=0, arrow=1))));
public 
  Interfaces.Flange Fin annotation (extent=[-100, -12; -80, 10], layer="icon");
  Interfaces.Flange Fout annotation (
    extent=[80, 12; 100, -10], 
    rotation=180, 
    layer="icon");
equation 
  s_closed = dp > level;
  
  dp = if s_closed then s*k else s;
  q = if s_closed then s else s*Gopen;
end ValveRelief;
