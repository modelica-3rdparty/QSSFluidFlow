model PressureBoundaryCondition 
  parameter SI.Pressure pBC=100000;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(Text(
        extent=[2, 48; 2, -40], 
        string="pBC", 
        style(color=0, fillColor=0))), 
    Window(
      x=0.11, 
      y=0.01, 
      width=0.69, 
      height=0.69));
  Flange Flange1 annotation (extent=[-100, -100; 100, 100], layer="icon");
equation 
  Flange1.p = pBC;
end PressureBoundaryCondition;
