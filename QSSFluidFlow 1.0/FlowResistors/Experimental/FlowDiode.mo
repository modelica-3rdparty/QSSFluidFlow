model FlowDiode 
  extends Interfaces.TwoFlange;
  parameter Real Rclosed=1.e2;
  parameter Real Gopen=1.e-12;
  
  Real s;
  Boolean s_closed "s(witch)_closed: fluid can flow == true";
  annotation (Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), Icon(
      Text(extent=[-100, -40; 100, -60], string="%name"), 
      Line(points=[-82, 0; -60, 0], style(color=0)), 
      Line(points=[60, 0; 82, 0], style(color=0)), 
      Line(points=[60, 40; 60, -40], style(color=0)), 
      Line(points=[-60, 40; -60, -40], style(color=0)), 
      Line(points=[-60, 40; 60, -40], style(color=0)), 
      Polygon(points=[60, -40; 52, -28; 46, -38; 60, -40], style(color=0, 
            fillColor=0))));
  Interfaces.Flange Fin annotation (extent=[-100, -12; -80, 10], layer="icon");
  Interfaces.Flange Fout annotation (
    extent=[80, 12; 100, -10], 
    rotation=180, 
    layer="icon");
equation 
  s_closed = (s > 0);
  dp = if s_closed then s*Rclosed else s;
  q = if s_closed then s else s*Gopen;
end FlowDiode;
