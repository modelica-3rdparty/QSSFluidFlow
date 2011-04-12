model LCSegment 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Diagram(Text(extent=[2, -34; 34, -40], string="shutoff")), 
    Icon(
      Text(extent=[-76, 98; -56, 78], string="m"), 
      Text(extent=[24, 98; 88, 80], string="close"), 
      Text(extent=[-102, -6; -82, -26], string="sp"), 
      Rectangle(extent=[-80, 80; 80, -80], style(fillColor=49)), 
      Rectangle(extent=[-80, 80; 80, -80], style(fillColor=49)), 
      Text(extent=[-82, 20; 78, -20], string="%name")), 
    Window(
      x=0.11, 
      y=0.01, 
      width=0.69, 
      height=0.92));
  ModelicaAdditions.Blocks.Logical.Switch Switch1 annotation (extent=[-10, -60
        ; 10, -40], rotation=-90);
  Modelica.Blocks.Interfaces.OutPort outPort annotation (extent=[-10, -100; 10
        , -80], rotation=-90);
  Modelica.Blocks.Sources.Constant Constant1(k={0.0}) annotation (extent=[60, 
        20; 80, 40], rotation=-90);
  Modelica.Blocks.Interfaces.InPort sp annotation (extent=[-100, -10; -80, 10])
    ;
  Modelica.Blocks.Interfaces.InPort m annotation (extent=[-50, 80; -30, 100], 
      rotation=-90);
  Modelica.Blocks.Interfaces.BooleanInPort off annotation (extent=[20, 80; 40, 
        100], rotation=-90);
  LC LC1 annotation (extent=[-20, -20; -60, 20], rotation=-90);
equation 
  connect(Switch1.outPort, outPort) annotation (points=[0, -61; 0, -86
        ; 0, -86]);
  connect(Constant1.outPort, Switch1.inPort1) annotation (points=[70, 18; 70, -
        20; 6, -20; 6, -36]);
  connect(Switch1.inPort2, off) annotation (points=[0, -38; 0, 60; 30, 60; 30, 
        94]);
  connect(sp, LC1.SP) annotation (points=[-90, 0; -56, 0]);
  connect(LC1.M, m) annotation (points=[-40, 18; -40, 88]);
  connect(LC1.AC, Switch1.inPort3) annotation (points=[-40, -18; -40, -28; -8, 
        -28; -8, -38]);
end LCSegment;
