model FCSegment 
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
      Text(extent=[2, -80; 22, -100], string="s"), 
      Rectangle(extent=[-80, 80; 80, -80], style(fillColor=49)), 
      Text(extent=[-78, 20; 82, -20], string="%name")), 
    Window(
      x=0.15, 
      y=0.1, 
      width=0.73, 
      height=0.76));
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
  Controllers.FC FC1 annotation (extent=[-20, -20; -60, 20], rotation=-90);
equation 
  connect(Switch1.outPort, outPort) annotation (points=[0, -61; 0, -86
        ; 0, -86]);
  connect(Constant1.outPort, Switch1.inPort1) annotation (points=[70, 18; 70, -
        20; 6, -20; 6, -36]);
  connect(Switch1.inPort2, off) annotation (points=[0, -38; 0, 60; 30, 60; 30, 
        94]);
  connect(sp, FC1.SP) annotation (points=[-84, 0; -54, 0]);
  connect(FC1.M, m) annotation (points=[-40, 18; -40, 86]);
  connect(Switch1.inPort3, FC1.AC) annotation (points=[-8, -38; -10, -30; -40, 
        -30; -40, -18]);
end FCSegment;
