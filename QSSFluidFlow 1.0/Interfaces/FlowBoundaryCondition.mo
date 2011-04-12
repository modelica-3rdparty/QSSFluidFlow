model FlowBoundaryCondition 
  parameter SI.VolumeFlowRate qBC=0.0;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(Text(
        extent=[2, 48; 2, -40], 
        string="qBC", 
        style(color=0, fillColor=0))), 
    Window(
      x=0.28, 
      y=0.01, 
      width=0.52, 
      height=0.71));
  Flange Flange1 annotation (extent=[-100, -100; 100, 100], layer="icon");
equation 
  Flange1.q = -qBC;
end FlowBoundaryCondition;
