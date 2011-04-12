model Idle 
  extends Interfaces.TwoFlange;
  annotation (Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), Icon(
      Rectangle(extent=[-60, 40; 60, -40], style(color=0, pattern=3)), 
      Text(extent=[-100, -50; 100, -58], string="%name"), 
      Line(points=[-82, 0; -40, 0], style(color=0)), 
      Line(points=[40, 0; 82, 0], style(color=0))));
  Interfaces.Flange Fin annotation (extent=[-100, -12; -80, 10], layer="icon");
  Interfaces.Flange Fout annotation (
    extent=[80, 12; 100, -10], 
    rotation=180, 
    layer="icon");
equation 
  q = 0.0;
end Idle;
