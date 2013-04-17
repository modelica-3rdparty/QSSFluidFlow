model CommutatorControlledThreeOutports 
  parameter Real Rclosed=1.e2;
  parameter Real Gopen=1.e-12;
  parameter Real level1=0.1;
  parameter Real level2=0.9;
  
protected 
  Real s1;
  Real s2;
  Real s3;
  Boolean l1_closed(start=false) "l(ine)1_closed: fluid can flow == true";
  Boolean l2_closed(start=true) "l(ine)2_closed: fluid can flow == true";
  Boolean l3_closed(start=false) "l(ine)3_closed: fluid can flow == true";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Diagram(
      Ellipse(extent=[-46, 6; -32, -8], style(color=0)), 
      Line(points=[-34, 4; 36, 40], style(color=0)), 
      Line(points=[-82, 0; -46, 0], style(color=0)), 
      Line(points=[0, 80; 0, 22], style(color=0)), 
      Line(points=[84, 40; 42, 40], style(color=0)), 
      Line(points=[84, 0; 42, 0], style(color=0)), 
      Line(points=[42, 48; 42, 32], style(color=0)), 
      Line(points=[42, 8; 42, -8], style(color=0)), 
      Line(points=[84, -40; 42, -40], style(color=0)), 
      Line(points=[42, -32; 42, -48], style(color=0)), 
      Text(extent=[-102, -72; 98, -80], string="%name"), 
      Text(
        extent=[80, 50; 98, 30], 
        string="1", 
        style(color=0)), 
      Text(
        extent=[80, 10; 98, -10], 
        string="2", 
        style(color=0)), 
      Text(
        extent=[80, -30; 98, -50], 
        string="3", 
        style(color=0))), 
    Icon(
      Ellipse(extent=[-46, 6; -32, -8], style(color=0)), 
      Line(points=[-34, 4; 36, 40], style(color=0)), 
      Line(points=[-82, 0; -46, 0], style(color=0)), 
      Line(points=[0, 80; 0, 22], style(color=0)), 
      Line(points=[82, 40; 42, 40], style(color=0)), 
      Line(points=[82, 0; 42, 0], style(color=0)), 
      Line(points=[42, 48; 42, 32], style(color=0)), 
      Line(points=[42, 8; 42, -8], style(color=0)), 
      Line(points=[82, -40; 42, -40], style(color=0)), 
      Line(points=[42, -32; 42, -48], style(color=0)), 
      Text(extent=[-102, -72; 98, -80], string="%name"), 
      Text(
        extent=[60, 60; 60, 40], 
        string="1", 
        style(color=0)), 
      Text(
        extent=[60, 20; 60, 0], 
        string="2", 
        style(color=0)), 
      Text(
        extent=[60, -20; 60, -40], 
        string="3", 
        style(color=0))), 
    Window(
      x=0.24, 
      y=0.01, 
      width=0.56, 
      height=0.7));
public 
  Modelica.Blocks.Interfaces.InPort Control annotation (
    extent=[-10, 80; 10, 100], 
    rotation=-90, 
    layer="icon");
  Interfaces.Flange Fin annotation (extent=[-100, -10; -80, 10], layer="icon");
  Interfaces.Flange Fout1 annotation (extent=[80, 30; 100, 50], layer="icon");
  Interfaces.Flange Fout2 annotation (extent=[80, -10; 100, 10], layer="icon");
  Interfaces.Flange Fout3 annotation (extent=[80, -50; 100, -30], layer="icon")
    ;
equation 
  0 = Fin.q + Fout1.q + Fout2.q + Fout3.q;
  
  //state of commutator:
  l1_closed = (Control.signal[1] < level1);
  l2_closed = ((Control.signal[1] > level1) and (Control.signal[1] < level2));
  l3_closed = (Control.signal[1] > level2);
  
  //line 1:
  Fin.p - Fout1.p = if l1_closed then s1*Rclosed else s1;
  Fout1.q = if l1_closed then s1 else s1*Gopen;
  
  //line 2:
  Fin.p - Fout2.p = if l2_closed then s2*Rclosed else s2;
  Fout2.q = if l2_closed then s2 else s2*Gopen;
  
  //line 3:
  Fin.p - Fout3.p = if l3_closed then s3*Rclosed else s3;
  Fout3.q = if l3_closed then s3 else s3*Gopen;
  
end CommutatorControlledThreeOutports;
