model FCPlantSegment 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Rectangle(extent=[-80, 80; 80, -80]), 
      Text(extent=[-76, 20; 82, -20], string="%name"), 
      Text(extent=[-108, 96; -76, 80], string="sp"), 
      Text(extent=[-36, 94; -8, 78], string="ms")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
  Controllers.FCSegment FCSegment annotation (extent=[-20, -8; 20, 32]);
  FlowResistors.PipeHorizontal PipeHorizontal1(L=5, D=0.1) annotation (extent=[
        -80, -40; -60, -20]);
  FlowResistors.PipeGeographicalElevation PipeGeographicalElevation1(L=10, D=
        0.1) annotation (extent=[40, -20; 60, 0], rotation=90);
  Valves.ValveLinearCharacteristic ValveLinearCharacteristic1(kvs=100) 
    annotation (extent=[-10, -40; 10, -20]);
  Pumps.IdealPressureSource IdealPressureSource1(deltah=50) annotation (extent=
        [-46, -40; -26, -20]);
  Interfaces.Flange Fright annotation (extent=[80, -10; 100, 10]);
  Interfaces.Flange Fleft annotation (extent=[-100, -10; -80, 10]);
  ModelicaAdditions.Blocks.Logical.OR OR2 annotation (extent=[12, 48; 0, 36], 
      rotation=-270);
  ModelicaAdditions.Blocks.Logical.OR OR1 annotation (extent=[16, 68; 4, 56], 
      rotation=-270);
  Modelica.Blocks.Interfaces.BooleanInPort inPort1 annotation (extent=[60, 80; 
        80, 100], rotation=-90);
  Modelica.Blocks.Interfaces.BooleanInPort inPort2 annotation (extent=[30, 80; 
        50, 100], rotation=-90);
  Modelica.Blocks.Interfaces.BooleanInPort inPort3 annotation (extent=[-10, -80
        ; 10, -100], rotation=-90);
  Modelica.Blocks.Interfaces.InPort m annotation (extent=[-50, 80; -30, 100], 
      rotation=-90);
  Modelica.Blocks.Interfaces.InPort sp annotation (extent=[-80, 80; -60, 100], 
      rotation=-90);
equation 
  connect(FCSegment.outPort, ValveLinearCharacteristic1.Control) 
    annotation (points=[0, -8; 0, -20]);
  connect(ValveLinearCharacteristic1.Fright, PipeGeographicalElevation1.Fleft) 
    annotation (points=[8, -30; 50, -30; 50, -19]);
  connect(PipeHorizontal1.Fright, IdealPressureSource1.Fleft) annotation (
      points=[-62, -30; -44, -30]);
  connect(IdealPressureSource1.Fright, ValveLinearCharacteristic1.Fleft) 
    annotation (points=[-28, -30; -10, -30]);
  connect(PipeGeographicalElevation1.Fright, Fright) annotation (points=[50, 0
        ; 92, 0; 92, 0]);
  connect(PipeHorizontal1.Fleft, Fleft) annotation (points=[-80, -30; -90, -30
        ; -90, 0; -90, 0]);
  connect(FCSegment.off, OR2.outPort) annotation (points=[6, 30; 6, 36]);
  connect(OR2.inPort1, OR1.outPort) annotation (points=[10, 50; 10, 55.4]);
  connect(inPort3, OR2.inPort2) annotation (points=[0, -88; 0, -60; -50, -60; -
        52, -60; -52, 52; 2, 52; 2, 50]);
  connect(FCSegment.m, m) annotation (points=[-8, 30; -8, 78; -40, 78; -40, 90
        ; -40, 90]);
  connect(OR1.inPort2, inPort2) annotation (points=[6, 70; 6, 78; 40, 78; 40, 
        94]);
  connect(FCSegment.sp, sp) annotation (points=[-20, 10; -26, 10; -26, 72; -70
        , 72; -70, 84; -70, 88]);
  connect(OR1.inPort1, inPort1) annotation (points=[14, 70; 14, 74; 70, 74; 70
        , 94]);
end FCPlantSegment;
