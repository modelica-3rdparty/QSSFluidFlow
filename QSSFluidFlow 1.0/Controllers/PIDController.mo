model PIDController 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Text(extent=[-102, -10; -64, -34], string="Sensor"), 
      Text(extent=[60, -8; 98, -34], string="Actuator"), 
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=49)), 
      Line(points=[-80, 0; -60, 0]), 
      Line(points=[60, 0; 80, 0]), 
      Text(extent=[-58, 22; 58, -24], string="%name")), 
    Diagram, 
    Window(
      x=0.25, 
      y=0.06, 
      width=0.6, 
      height=0.72));
  Modelica.Blocks.Interfaces.InPort M annotation (extent=[-100, -10; -80, 10], 
      layer="icon");
  Modelica.Blocks.Continuous.LimPID LimPID1(
    k=10, 
    Ti=10, 
    yMax=0.5, 
    yMin=-0.5) annotation (extent=[0, -16; 20, 4]);
  Modelica.Blocks.Math.Add Add1(k2=-1) annotation (extent=[40, -10; 60, 10]);
  Modelica.Blocks.Sources.Constant ValveOperatingPoint(k={0.5}) annotation (
      extent=[0, 28; 20, 48]);
  Modelica.Blocks.Interfaces.InPort SP annotation (extent=[-8, 60; 12, 80], 
      rotation=-90);
  Modelica.Blocks.Interfaces.OutPort AC annotation (extent=[80, -10; 100, 10]);
equation 
  connect(ValveOperatingPoint.outPort, Add1.inPort1) annotation (
      points=[21, 38; 28, 38; 28, 6; 38, 6]);
  connect(LimPID1.inPort_m, M) annotation (points=[10, -20; 10, -40; -56, -40; 
        -56, 0; -82, 0]);
  connect(Add1.outPort, AC) annotation (points=[60, 0; 84, 0]);
  connect(LimPID1.inPort_s, SP) annotation (points=[-2, -6; -42, -6; -42, 64; 2
        , 64]);
  connect(LimPID1.outPort, Add1.inPort2) annotation (points=[21, -6; 38, -6]);
end PIDController;
