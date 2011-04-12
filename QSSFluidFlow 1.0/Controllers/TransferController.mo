model TransferController 
  parameter Real treaction=60;
  
  Real s;
  Real tend;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Rectangle(extent=[-80, 80; 80, -80], style(fillColor=45)), 
      Text(extent=[78, 34; 100, 8], string="s"), 
      Text(extent=[-50, -72; -2, -112], string="transfered"), 
      Text(extent=[66, -74; 100, -108], string="loaded"), 
      Text(extent=[-76, 12; 78, -12], string="%name")), 
    Window(
      x=0.28, 
      y=0.01, 
      width=0.52, 
      height=0.68));
  ModelicaAdditions.PetriNets.Place11 Swaiting(initialState=true) annotation (
      extent=[-86, 10; -66, 30]);
  ModelicaAdditions.PetriNets.Transition Tloadingdone annotation (extent=[-56, 
        30; -36, 10]);
  Modelica.Blocks.Interfaces.BooleanInPort Loaded annotation (extent=[-70, -100
        ; -50, -80], rotation=90);
  ModelicaAdditions.PetriNets.Place11 Sready annotation (extent=[-28, 10; -8, 
        30]);
  ModelicaAdditions.PetriNets.Transition Tstartreaction annotation (extent=[2, 
        10; 22, 30]);
  ModelicaAdditions.PetriNets.Place11 Sreact annotation (extent=[32, 10; 52, 30
        ]);
  ModelicaAdditions.PetriNets.Transition Tstarttransfer annotation (extent=[22
        , -30; 2, -10]);
  Modelica.Blocks.Interfaces.BooleanInPort Transfered annotation (extent=[50, -
        100; 70, -80], rotation=90);
  ModelicaAdditions.PetriNets.Transition Tstopreaction annotation (extent=[60, 
        10; 80, 30]);
  ModelicaAdditions.PetriNets.Place11 Sreadytransfer annotation (extent=[54, -
        30; 34, -10]);
  ModelicaAdditions.PetriNets.Place11 Stransfer annotation (extent=[-8, -30; -
        28, -10]);
  ModelicaAdditions.PetriNets.Transition Tstoptransfer annotation (extent=[-36
        , -30; -56, -10]);
  Modelica.Blocks.Interfaces.OutPort S annotation (extent=[80, -10; 100, 10]);
equation 
  connect(Swaiting.outTransition, Tloadingdone.inTransition) 
    annotation (points=[-65, 20; -52.05, 20]);
  connect(Tloadingdone.outTransition, Sready.inTransition) annotation (points=[
        -41, 20; -30, 20]);
  connect(Sready.outTransition, Tstartreaction.inTransition) annotation (points
      =[-7, 20; 5.95, 20]);
  connect(Tstartreaction.outTransition, Sreact.inTransition) annotation (points
      =[17, 20; 28, 20]);
  connect(Sreact.outTransition, Tstopreaction.inTransition) annotation (points=
        [54, 20; 62, 20]);
  connect(Tstopreaction.outTransition, Sreadytransfer.inTransition) annotation 
    (points=[74, 20; 78, 20; 78, -20; 56, -20]);
  connect(Stransfer.inTransition, Tstarttransfer.outTransition) annotation (
      points=[-6, -20; 8, -20]);
  connect(Tstoptransfer.outTransition, Swaiting.inTransition) annotation (
      points=[-52, -20; -94, -20; -94, 20; -90, 20]);
  connect(Sreadytransfer.outTransition, Tstarttransfer.inTransition) 
    annotation (points=[34, -20; 18, -20]);
  connect(Stransfer.outTransition, Tstoptransfer.inTransition) annotation (
      points=[-29, -20; -40, -20]);
  connect(Transfered, Tstoptransfer.conditionPort) annotation (points=[60, -88
        ; 60, -50; -46, -50; -46, -30]);
  connect(Loaded, Tloadingdone.conditionPort) annotation (points=[-60, -88; -60
        , -60; -98, -60; -98, 50; -46, 50; -46, 30]);
  //conditions for transitions
  Tstartreaction.condition = true;
  Tstopreaction.condition = time >= tend;
  Tstarttransfer.condition = true;
  
  //calculate end of reaction
  when Sreact.state then
    tend = time + treaction;
  end when;
  
  //output signal
  s = S.signal[1];
  s = if (Stransfer.state) then 1.0 else 0.0;
end TransferController;
