model BatchContinuous 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Window(
      x=0.15, 
      y=0.01, 
      width=0.65, 
      height=0.93), 
    Diagram);
  Reservoirs.TankOpenInstrumented Educts(
    Dtank=10, 
    Ltank=40, 
    hstart=40) annotation (extent=[-78, 68; -42, 96]);
  Reservoirs.TankOpenInstrumented Reactor(
    Dtank=2, 
    Ltank=10, 
    hstart=0) annotation (extent=[-74, 18; -46, 44]);
  FlowResistors.PipeGeographicalElevation P1(
    L=5, 
    dz=-5, 
    D=0.1) annotation (extent=[-66, 44; -54, 56], rotation=-90);
  Valves.ValveLinearCharacteristic V1(kvs=100, xstart=1.0) annotation (extent=[
        -54, 56; -66, 68], rotation=-90);
  Controllers.LoadingController Loading annotation (extent=[-96, 52; -78, 72]);
  Controllers.TransferController Transfer(treaction=100) annotation (extent=[-
        94, 18; -74, -2]);
  Valves.ValveLinearCharacteristic V2(kvs=100, xstart=0.0) annotation (extent=[
        -54, 2; -66, 14], rotation=-90);
  Pumps.IdealPressureSource IdealPressureSource1(deltah=50) annotation (extent=
        [-44, -4; -34, 6]);
  FlowResistors.PipeGeographicalElevation P3(L=10, D=0.1) annotation (extent=[-
        34, 16; -22, 2], rotation=-90);
  Reservoirs.TankOpenInstrumented Buffer(
    Dtank=2, 
    Ltank=10, 
    hstart=7.5) annotation (extent=[-92, -46; -70, -20]);
  Reservoirs.TankOpenInstrumented T1(
    Dtank=2, 
    Ltank=10, 
    hstart=7.5) annotation (extent=[-38, -46; -16, -20]);
  Reservoirs.TankOpenInstrumented T2(
    Dtank=2, 
    Ltank=10, 
    hstart=7.5) annotation (extent=[14, -46; 36, -20]);
  Reservoirs.TankOpenInstrumented Product(
    Dtank=5, 
    Ltank=30, 
    hstart=0) annotation (extent=[62, -46; 98, -18]);
  Composites.FCPlantSegment FCPlantSeg1 annotation (extent=[-62, -80; -42, -60]
    );
  Composites.LCPlantSegment LCPlantSeg1 annotation (extent=[-10, -80; 10, -60])
    ;
  Sensors.FlowIndicator FlowIndicator1 annotation (extent=[-80, -76; -68, -64])
    ;
  Modelica.Blocks.Sources.Constant SP1(k={0.025}) annotation (extent=[-68, -56
        ; -60, -48], rotation=-90);
  Modelica.Blocks.Sources.BooleanPulse BooleanPulse1(period={2000}, startTime={
        10000}) annotation (extent=[-12, -94; -4, -86]);
  Modelica.Blocks.Sources.BooleanConstant BooleanConstant1(k={false}) 
    annotation (extent=[-64, -94; -56, -86]);
  Modelica.Blocks.Sources.Constant SP2(k={5}) annotation (extent=[-16, -56; -8
        , -48], rotation=-90);
  Modelica.Blocks.Sources.Constant SP3(k={5}) annotation (extent=[32, -56; 40, 
        -48], rotation=-90);
  Composites.LCPlantSegment LCPlantSeg2 annotation (extent=[38, -80; 58, -60]);
  Modelica.Blocks.Sources.BooleanConstant BooleanConstant2(k={false}) 
    annotation (extent=[36, -94; 44, -86]);
  Interfaces.FlowBoundaryCondition FlowBoundaryCondition1 annotation (extent=[
        84, -64; 96, -52]);
  Interfaces.FlowBoundaryCondition FlowBoundaryCondition2 annotation (extent=[-
        92, 84; -80, 96]);
  FlowResistors.PipeHorizontal P2(L=4, D=0.1) annotation (extent=[-58, -6; -44
        , 6]);
equation 
  connect(V1.Fleft, Educts.Fbottom) annotation (points=[-60, 68; -60, 
        69.4]);
  connect(P1.Fleft, V1.Fright) annotation (points=[-60, 55.5; -60, 56]);
  connect(Reactor.Ftop, P1.Fright) annotation (points=[-60, 42; -60, 44.6]);
  connect(Loading.S, V1.Control) annotation (points=[-78.9, 62; -65.4, 62]);
  connect(Transfer.S, V2.Control) annotation (points=[-75, 8; -66, 8]);
  connect(Transfer.Transfered, Reactor.LAL) annotation (points=[-78, 16; -76, 
        24; -50, 26]);
  connect(Transfer.Loaded, Reactor.LAH) annotation (points=[-90, 18; -86, 32; -
        70, 36]);
  connect(V2.Fleft, Reactor.Fbottom) annotation (points=[-60, 14; -60, 20]);
  connect(IdealPressureSource1.Fright, P3.Fleft) annotation (points=[-34.5, 1; 
        -28, 2.7]);
  connect(P3.Fright, Buffer.Ftop) annotation (points=[-28, 15.4; -28, 18; -20, 
        18; -20, -8; -78, -16; -81, -22]);
  connect(Buffer.Fbottom, FlowIndicator1.Fleft) annotation (points=[-80, -44; -
        80, -70]);
  connect(FlowIndicator1.Fright, FCPlantSeg1.Fleft) annotation (points=[-68, -
        70; -61, -70]);
  connect(FlowIndicator1.FI, FCPlantSeg1.m) annotation (points=[-74, -64.6; -74
        , -46; -56, -46; -56, -61]);
  connect(FCPlantSeg1.Fright, T1.Ftop) annotation (points=[-44, -70; -40, -70; 
        -40, -14; -26, -14; -26, -20]);
  connect(SP1.outPort, FCPlantSeg1.sp) annotation (points=[-64, -56; -60, -60])
    ;
  connect(Buffer.LAL, FCPlantSeg1.inPort2) annotation (points=[-73.3, -38; -48
        , -38; -48, -60]);
  connect(FCPlantSeg1.inPort1, T1.LAH) annotation (points=[-44, -60; -44, -28; 
        -34, -28]);
  connect(SP2.outPort, LCPlantSeg1.sp) annotation (points=[-12, -56; -8, -60]);
  connect(SP3.outPort, LCPlantSeg2.sp) annotation (points=[36, -56; 40, -60]);
  connect(T1.Out, LCPlantSeg1.m) annotation (points=[-20, -32; -4, -32; -4, -60
        ]);
  connect(T1.LAL, LCPlantSeg1.inPort2) annotation (points=[-20, -38; 4, -38; 4
        , -60]);
  connect(LCPlantSeg1.inPort1, T2.LAH) annotation (points=[8, -60; 8, -28; 18, 
        -28]);
  connect(LCPlantSeg1.Fright, T2.Ftop) annotation (points=[8, -70; 12, -70; 12
        , -20; 26, -20]);
  connect(T1.Fbottom, LCPlantSeg1.Fleft) annotation (points=[-28, -44; -28, -70
        ; -10, -70]);
  connect(T2.Fbottom, LCPlantSeg2.Fleft) annotation (points=[24, -44; 24, -70; 
        38, -70]);
  connect(LCPlantSeg2.Fright, Product.Ftop) annotation (points=[56, -70; 62, -
        70; 62, -18; 80, -18]);
  connect(T2.Out, LCPlantSeg2.m) annotation (points=[32, -32; 44, -32; 44, -60]
    );
  connect(T2.LAL, LCPlantSeg2.inPort2) annotation (points=[32, -38; 52, -38; 52
        , -60]);
  connect(LCPlantSeg2.inPort1, Product.LAH) annotation (points=[56, -60; 56, -
        26; 68, -26]);
  connect(BooleanConstant1.outPort, FCPlantSeg1.inPort3) annotation (points=[-
        56, -90; -52, -80]);
  connect(BooleanPulse1.outPort, LCPlantSeg1.inPort3) annotation (points=[-4, -
        90; 0, -78]);
  connect(BooleanConstant2.outPort, LCPlantSeg2.inPort3) annotation (points=[44
        , -90; 48, -80]);
  connect(Loading.Start, Reactor.LAL) annotation (points=[-90.6, 53; -86, 38; -
        50, 26]);
  connect(Loading.End, Reactor.LAH) annotation (points=[-83.4, 53; -80, 44; -70
        , 36]);
  connect(V2.Fright, P2.Fleft) annotation (points=[-60, 2; -57.3, 0]);
  connect(P2.Fright, IdealPressureSource1.Fleft) annotation (points=[-44.5, 0; 
        -43.5, 1]);
  connect(FlowBoundaryCondition2.Flange1, Educts.Ftop) annotation (points=[-84
        , 94; -60, 94], style(color=73));
  connect(Product.Fbottom, FlowBoundaryCondition1.Flange1) annotation (points=[
        80, -44; 88, -54], style(color=73));
end BatchContinuous;
