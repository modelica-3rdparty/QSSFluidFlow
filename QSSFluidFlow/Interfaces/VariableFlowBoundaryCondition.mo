model VariableFlowBoundaryCondition 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.15, 
      y=0.01, 
      width=0.65, 
      height=0.72), 
    Icon(Text(
        extent=[0, 70; 0, -18], 
        string="qBC", 
        style(color=0, fillColor=0)), Text(
        extent=[0, -18; 0, -70], 
        string="variable", 
        style(color=0, fillColor=0))));
  Modelica.Blocks.Interfaces.InPort In annotation (extent=[-100, -10; -80, 10])
    ;
  Flange Flange1 annotation (extent=[-100, -100; 100, 100], layer="icon");
equation 
  Flange1.q = -In.signal[1];
end VariableFlowBoundaryCondition;
