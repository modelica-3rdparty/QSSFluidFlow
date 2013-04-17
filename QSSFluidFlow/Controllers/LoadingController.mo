model LoadingController 
  Real s;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Rectangle(extent=[-80, 80; 80, -80], style(fillColor=45)), 
      Text(extent=[-64, 12; 54, -10], string="%name"), 
      Text(extent=[-90, -70; -54, -110], string="start"), 
      Text(extent=[56, -74; 90, -106], string="end"), 
      Text(extent=[74, 46; 110, 6], string="s")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
  ModelicaAdditions.PetriNets.Place11 Swaiting(initialState=true) annotation (
      extent=[-52, 20; -32, 40]);
  ModelicaAdditions.PetriNets.Transition Tstart annotation (extent=[-10, 40; 10
        , 20]);
  Modelica.Blocks.Interfaces.BooleanInPort Start annotation (extent=[-28, -100
        ; -52, -80], rotation=90);
  ModelicaAdditions.PetriNets.Place11 Sloading(initialState=false) annotation (
      extent=[28, 20; 48, 40]);
  ModelicaAdditions.PetriNets.Transition Tstop annotation (extent=[10, -20; -10
        , 0]);
  Modelica.Blocks.Interfaces.BooleanInPort End annotation (extent=[28, -100; 52
        , -80], rotation=90);
  Modelica.Blocks.Interfaces.OutPort S annotation (extent=[80, -12; 100, 12]);
equation 
  connect(Swaiting.outTransition, Tstart.inTransition) annotation (
      points=[-31, 30; -6.05, 30]);
  connect(Sloading.outTransition, Tstop.inTransition) annotation (points=[49, 
        30; 70, 30; 70, -10; 6.05, -10]);
  connect(Tstop.outTransition, Swaiting.inTransition) annotation (points=[-5, -
        10; -70, -10; -70, 30; -56, 30]);
  connect(Tstart.outTransition, Sloading.inTransition) annotation (points=[5, 
        30; 26, 30]);
  connect(Tstart.conditionPort, Start) annotation (points=[0, 40; 0, 60; -80, 
        60; -80, -60; -40, -60; -40, -86]);
  connect(Tstop.conditionPort, End) annotation (points=[0, -20; 0, -60; 40, -60
        ; 40, -84]);
  //output signal  
  s = S.signal[1];
  s = if (Sloading.state) then 1.0 else 0.0;
end LoadingController;
