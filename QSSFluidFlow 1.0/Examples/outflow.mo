model outflow 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.25, 
      y=0.02, 
      width=0.65, 
      height=0.86), 
    Diagram);
  Reservoirs.TankOpen T1 annotation (extent=[-92, -20; -18, 58]);
  FlowResistors.PipeHorizontal P1(L=10) annotation (extent=[-16, -44; 40, 10]);
  Interfaces.FlowBoundaryCondition FlowBoundaryCondition1 annotation (extent=[-
        66, 68; -46, 88]);
  Interfaces.PressureBoundaryCondition PressureBoundaryCondition1 annotation (
      extent=[58, -28; 78, -8]);
equation 
  connect(T1.Fbottom, P1.Fleft) annotation (points=[-52, -16; -13.2, -
        16]);
  connect(T1.Ftop, FlowBoundaryCondition1.Flange1) annotation (points=[-54, 56
        ; -54, 74], style(color=73));
  connect(P1.Fright, PressureBoundaryCondition1.Flange1) annotation (points=[38
        , -16; 60, -16], style(color=73));
end outflow;
