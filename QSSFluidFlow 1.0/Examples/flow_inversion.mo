model flow_inversion 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.24, 
      y=0.01, 
      width=0.56, 
      height=0.85), 
    Diagram);
  Reservoirs.TankOpen T1(hstart=8) annotation (extent=[-104, -20; -30, 58]);
  FlowResistors.PipeHorizontal P1(L=10) annotation (extent=[-36, -44; 20, 10]);
  Interfaces.FlowBoundaryCondition FlowBoundaryCondition1 annotation (extent=[-
        78, 64; -56, 86]);
  Reservoirs.TankOpen T2(hstart=2) annotation (extent=[10, -20; 84, 58]);
  Modelica.Blocks.Sources.Step Step1(height={0.01}, startTime={1000}) 
    annotation (extent=[6, 66; 26, 86]);
  Interfaces.VariableFlowBoundaryCondition VariableFlowBoundaryCondition1 
    annotation (extent=[36, 66; 56, 86]);
equation 
  connect(P1.Fright, T2.Fbottom) annotation (points=[16, -16; 47, -16]
    );
  connect(Step1.outPort, VariableFlowBoundaryCondition1.In) annotation (points=
        [28, 76; 36, 76]);
  connect(T1.Fbottom, P1.Fleft) annotation (points=[-68, -16; -32, -16], style(
        color=73));
  connect(T1.Ftop, FlowBoundaryCondition1.Flange1) annotation (points=[-68, 56
        ; -68, 70], style(color=73));
  connect(T2.Ftop, VariableFlowBoundaryCondition1.Flange1) annotation (points=[
        48, 56; 48, 70], style(color=73));
end flow_inversion;
