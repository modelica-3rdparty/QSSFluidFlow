model level_equalization 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.18, 
      y=0.01, 
      width=0.62, 
      height=0.91), 
    Diagram);
  Reservoirs.TankOpen T1(hstart=8) annotation (extent=[-104, -20; -30, 58]);
  FlowResistors.PipeHorizontal P1(L=10) annotation (extent=[-36, -44; 20, 10]);
  Interfaces.FlowBoundaryCondition FlowBoundaryCondition1 annotation (extent=[-
        76, 68; -56, 88]);
  Reservoirs.TankOpen T2(hstart=2) annotation (extent=[10, -20; 84, 58]);
  Interfaces.FlowBoundaryCondition FlowBoundaryCondition2 annotation (extent=[
        38, 66; 58, 86]);
equation 
  connect(T1.Fbottom, P1.Fleft) annotation (points=[-67, -16; -35.2, -
        16]);
  connect(P1.Fright, T2.Fbottom) annotation (points=[16, -16; 47, -16]);
  connect(T1.Ftop, FlowBoundaryCondition1.Flange1) annotation (points=[-66, 56
        ; -66, 72], style(color=73));
  connect(T2.Ftop, FlowBoundaryCondition2.Flange1) annotation (points=[48, 56; 
        48, 70], style(color=73));
end level_equalization;
