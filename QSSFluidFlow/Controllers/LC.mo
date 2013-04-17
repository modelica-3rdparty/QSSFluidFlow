model LC 
  parameter Real ValveOperatingPoint=0.5;
  parameter Real k=2 "Controller gain";
  parameter Real Ti=10 "Time constant of integrator block";
  parameter Real Td=0.1 "Time constant of derivative block";
  parameter Real ymax=0.5 "max output";
  parameter Real ymin=-0.5 "min output";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Line(points=[-80, 0; -60, 0]), 
      Line(points=[60, 0; 80, 0]), 
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=49)), 
      Text(extent=[-58, 22; 58, -24], string="%name")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
  Modelica.Blocks.Continuous.LimPID LimPID(
    k=k, 
    Ti=Ti, 
    Td=Td, 
    yMax=ymax, 
    yMin=ymin) annotation (extent=[0, -16; 20, 4]);
  Modelica.Blocks.Math.Add Add1(k2=-1) annotation (extent=[40, -10; 60, 10]);
  Modelica.Blocks.Sources.Constant VOP(k={0.5}) annotation (extent=[0, 28; 20, 
        48]);
  Modelica.Blocks.Interfaces.InPort SP annotation (extent=[-8, 60; 12, 80], 
      rotation=-90);
  Modelica.Blocks.Interfaces.OutPort AC annotation (extent=[80, -10; 100, 10]);
  Modelica.Blocks.Interfaces.InPort M annotation (extent=[-100, -10; -80, 10]);
equation 
  connect(VOP.outPort, Add1.inPort1) annotation (points=[21, 38; 28, 
        38; 28, 6; 38, 6]);
  connect(LimPID.inPort_m, M) annotation (points=[10, -20; 10, -40; -56, -40; -
        56, 0; -82, 0]);
  connect(Add1.outPort, AC) annotation (points=[60, 0; 84, 0]);
  connect(LimPID.inPort_s, SP) annotation (points=[-2, -6; -42, -6; -42, 64; 2
        , 64]);
  connect(LimPID.outPort, Add1.inPort2) annotation (points=[21, -6; 38, -6]);
end LC;
