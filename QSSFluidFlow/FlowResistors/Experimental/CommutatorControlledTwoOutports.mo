model CommutatorControlledTwoOutports 
  parameter Real Rclosed=1.e2;
  parameter Real Gopen=1.e-12;
  parameter Real level=0.5;
  
protected 
  Real s1;
  Real s2;
  Boolean l1_closed "l(ine)1_closed: fluid can flow == true";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Ellipse(extent=[-46, 6; -32, -8], style(color=0)), 
      Line(points=[-34, 4; 36, 40], style(color=0)), 
      Line(points=[-82, 0; -46, 0], style(color=0)), 
      Line(points=[0, 80; 0, 22], style(color=0)), 
      Line(points=[84, 40; 42, 40], style(color=0)), 
      Line(points=[84, -40; 42, -40], style(color=0)), 
      Line(points=[42, 48; 42, 32], style(color=0)), 
      Line(points=[42, -32; 42, -48], style(color=0)), 
      Text(extent=[-102, -72; 98, -80], string="%name"), 
      Text(
        extent=[60, 60; 60, 40], 
        string="1", 
        style(color=0)), 
      Text(
        extent=[62, -18; 62, -38], 
        string="2", 
        style(color=0))), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
public 
  Modelica.Blocks.Interfaces.InPort Control annotation (
    extent=[-10, 80; 10, 100], 
    rotation=-90, 
    layer="icon");
  Interfaces.Flange Fin annotation (extent=[-100, -10; -80, 10], layer="icon");
  Interfaces.Flange Fout1 annotation (extent=[80, 30; 100, 50], layer="icon");
  Interfaces.Flange Fout2 annotation (extent=[80, -50; 100, -30], layer="icon")
    ;
equation 
  0 = Fin.q + Fout1.q + Fout2.q;
  l1_closed = (Control.signal[1] < level);
  
  //line 1:
  Fin.p - Fout1.p = if l1_closed then s1*Rclosed else s1;
  Fout1.q = if l1_closed then s1 else s1*Gopen;
  
  //line 2:
  Fin.p - Fout2.p = if (not l1_closed) then s2*Rclosed else s2;
  Fout2.q = if (not l1_closed) then s2 else s2*Gopen;
  
end CommutatorControlledTwoOutports;
