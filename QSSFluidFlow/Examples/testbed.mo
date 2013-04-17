model testbed "Testbed model" 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Diagram, 
    Window(
      x=0.33, 
      y=0.01, 
      width=0.66, 
      height=0.94), 
    Documentation(info="<HTML>
This model was thoroughly tested with Dymola version 4.1c.
With this version and the selected model parameters, the 
model can be translated and simulated without any problem;
this is also true for initialization.
</HTML>
"));
  Reservoirs.TankOpen Tleft(
    Dtank=0.5, 
    Ltank=1, 
    hstart=0.3) annotation (extent=[-102, 32; -70, 64]);
  Reservoirs.TankOpen Tright(
    Dtank=0.5, 
    Ltank=1, 
    hstart=0.6) annotation (extent=[-4, 32; 28, 64]);
  Reservoirs.TankOpen Tbottom(
    Dtank=1, 
    Ltank=1, 
    hstart=0.5) annotation (extent=[-66, -60; -14, -22]);
  Interfaces.FlowBoundaryCondition FlowBC annotation (extent=[-92, 66; -80, 78]
    );
  Pumps.IdealPressureSource PumpPS(deltah=80) annotation (extent=[-4, -94; 16, 
        -74]);
  FlowResistors.PipeHorizontal P2(L=2.0) annotation (extent=[-26, -94; -6, -74]
    );
  FlowResistors.Bend B1 annotation (extent=[-40, -88; -28, -76]);
  FlowResistors.PipeHorizontal P3(L=1) annotation (extent=[18, -94; 38, -74]);
  Valves.ValveLinearCharacteristic CV1 annotation (extent=[40, -94; 60, -74]);
  Sensors.FlowIndicator FlowIndicator1 annotation (extent=[62, -94; 82, -74]);
  FlowResistors.Bend B2 annotation (extent=[82, -90; 94, -78]);
  FlowResistors.PipeGeographicalElevation P4(L=3.5) annotation (extent=[84, 14
        ; 104, -6], rotation=-90);
  FlowResistors.Bend B3 annotation (extent=[94, 94; 82, 82]);
  FlowResistors.PipeHorizontal P5(L=2.5) annotation (extent=[62, 78; 42, 98]);
  FlowResistors.Bend B4 annotation (extent=[24, 94; 12, 82]);
  Valves.ValveLinearCharacteristic CVright(kvs=40) annotation (extent=[2, 10; 
        22, 30], rotation=-90);
  Valves.ValveLinearCharacteristic CVleft(kvs=40) annotation (extent=[-96, 10; 
        -76, 30], rotation=-90);
  FlowResistors.PipeHorizontal P8(L=0.5) annotation (extent=[2, -4; -18, 16]);
  FlowResistors.Bend B5 annotation (extent=[16, 0; 4, 12]);
  FlowResistors.Bend B6 annotation (extent=[-20, 12; -32, 0]);
  FlowResistors.PipeHorizontal P10(L=0.5) annotation (extent=[-78, -4; -58, 16]
    );
  FlowResistors.Bend B7 annotation (extent=[-92, 0; -80, 12]);
  FlowResistors.Bend B8 annotation (extent=[-56, 10; -44, -2]);
  Modelica.Blocks.Sources.Constant SPright(k={0.5}) annotation (extent=[50, 34
        ; 40, 42]);
  Modelica.Blocks.Sources.Constant SPleft(k={0.4}) annotation (extent=[-50, 34
        ; -60, 42]);
  FlowResistors.PipeGeographicalElevation P1(L=0.5, dz=-0.5) annotation (extent
      =[-50, -80; -30, -60], rotation=-90);
  FlowResistors.PipeGeographicalElevation P6(L=0.5, dz=-0.5) annotation (extent
      =[2, 66; 22, 86], rotation=-90);
  FlowResistors.PipeGeographicalElevation P7(L=0.5, dz=-0.5) annotation (extent
      =[-40, -22; -20, -2], rotation=-90);
  FlowResistors.PipeGeographicalElevation P9(L=0.5, dz=-0.5) annotation (extent
      =[-58, -22; -38, -2], rotation=-90);
  FlowResistors.PipeHorizontal P11(L=0.5) annotation (extent=[-46, 14; -66, 34]
    );
  Controllers.LC LCleft(k=50, Ti=5) annotation (extent=[-76, 30; -60, 46], 
      rotation=-90);
  Controllers.LC LCright(ValveOperatingPoint=50, k=5) annotation (extent=[24, 
        30; 40, 46], rotation=-90);
  Controllers.FC FC(k=50, Ti=1) annotation (extent=[68, -68; 50, -52]);
  Valves.ValveLinearCharacteristic CV2 annotation (extent=[-24, 14; -44, 34]);
  FlowResistors.PipeHorizontal P12(L=0.5) annotation (extent=[-2, 14; -22, 34])
    ;
  Modelica.Blocks.Sources.Constant PoMiddle(k={0.5}) annotation (extent=[-22, 
        36; -32, 44]);
  Modelica.Blocks.Sources.Step Step1(
    height={0.0025}, 
    offset={0.00175}, 
    startTime={50}) annotation (extent=[42, -48; 52, -40]);
equation 
  connect(B1.Fright, P2.Fleft) annotation (points=[-28.6, -82; -24, -
        84]);
  connect(P2.Fright, PumpPS.Fleft) annotation (points=[-8, -84; -4, -84]);
  connect(PumpPS.Fright, P3.Fleft) annotation (points=[14, -84; 19, -84]);
  connect(P3.Fright, CV1.Fleft) annotation (points=[36, -84; 42, -84]);
  connect(CV1.Fright, FlowIndicator1.Fleft) annotation (points=[60, -84; 63, -
        84]);
  connect(FlowIndicator1.Fright, B2.Fleft) annotation (points=[80, -84; 82.6, -
        84]);
  connect(B3.Fright, P5.Fleft) annotation (points=[82.6, 88; 61, 88]);
  connect(P5.Fright, B4.Fleft) annotation (points=[43, 88; 24, 88]);
  connect(Tright.Fbottom, CVright.Fleft) annotation (points=[12, 34; 12, 28]);
  connect(B5.Fleft, CVright.Fright) annotation (points=[15.4, 6; 12, 12]);
  connect(CVleft.Fleft, Tleft.Fbottom) annotation (points=[-86, 28; -86, 34]);
  connect(CVleft.Fright, B7.Fleft) annotation (points=[-86, 12; -92, 6]);
  connect(B7.Fright, P10.Fleft) annotation (points=[-80, 6; -76, 6]);
  connect(P10.Fright, B8.Fleft) annotation (points=[-60, 6; -55.4, 4]);
  connect(Tbottom.Fbottom, P1.Fleft) annotation (points=[-40, -60; -40, -61]);
  connect(P1.Fright, B1.Fleft) annotation (points=[-40, -79; -40, -82]);
  connect(B4.Fright, P6.Fleft) annotation (points=[12, 88; 12, 86]);
  connect(P6.Fright, Tright.Ftop) annotation (points=[12, 68; 12, 62]);
  connect(B6.Fright, P7.Fleft) annotation (points=[-32, 6; -30, -2]);
  connect(P7.Fright, Tbottom.Ftop) annotation (points=[-30, -20; -40, -23.9]);
  connect(B8.Fright, P9.Fleft) annotation (points=[-44, 4; -48, -3]);
  connect(P9.Fright, Tbottom.Ftop) annotation (points=[-48, -21; -40, -23.9]);
  connect(LCleft.SP, SPleft.outPort) annotation (points=[-62.4, 37.84; -60.5, 
        38]);
  connect(LCleft.AC, CVleft.Control) annotation (points=[-68, 30.8; -68, 20; -
        76, 20], style(pattern=3));
  connect(Tright.Out, LCright.M) annotation (points=[24, 48; 32, 48; 32, 45.2]
      , style(pattern=3));
  connect(SPright.outPort, LCright.SP) annotation (points=[39.5, 38; 37.6, 
        37.84], style(pattern=3));
  connect(LCright.AC, CVright.Control) annotation (points=[32, 30.8; 32, 20; 22
        , 20], style(pattern=3));
  connect(FlowIndicator1.FI, FC.M) annotation (points=[72, -75; 72, -60; 67, -
        60], style(pattern=3));
  connect(FC.AC, CV1.Control) annotation (points=[50.9, -60; 50, -60; 50, -75]
      , style(pattern=3));
  connect(P11.Fright, Tleft.Fbottom) annotation (points=[-66, 24; -86, 34]);
  connect(CV2.Fright, P11.Fleft) annotation (points=[-44, 24; -46, 24]);
  connect(P12.Fright, CV2.Fleft) annotation (points=[-20, 24; -26, 24]);
  connect(P12.Fleft, Tright.Fbottom) annotation (points=[-4, 24; 12, 34]);
  connect(PoMiddle.outPort, CV2.Control) annotation (points=[-32.5, 40; -34, 40
        ; -34, 34], style(pattern=3));
  connect(Step1.outPort, FC.SP) annotation (points=[52.5, -44; 58, -44; 58, -54
        ], style(pattern=3));
  connect(P8.Fleft, B5.Fright) annotation (points=[0, 6; 4, 6]);
  connect(P8.Fright, B6.Fleft) annotation (points=[-16, 6; -20.6, 6]);
  connect(B2.Fright, P4.Fleft) annotation (points=[94, -84; 94, -4]);
  connect(P4.Fright, B3.Fleft) annotation (points=[94, 14; 94, 88]);
  connect(Tleft.Out, LCleft.M) annotation (points=[-76, 48; -68, 48; -68, 46], 
      style(pattern=3));
  connect(Tleft.Ftop, FlowBC.Flange1) annotation (points=[-86, 62; -86, 70], 
      style(color=0));
end testbed;
