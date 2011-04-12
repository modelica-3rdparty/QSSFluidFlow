connector Flange 
  SI.Pressure p;
  flow SI.VolumeFlowRate q;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(Rectangle(extent=[-80, 82; 80, -78], style(
          color=0, 
          thickness=2, 
          fillColor=49))), 
    Window(
      x=0.21, 
      y=0.01, 
      width=0.59, 
      height=0.85));
end Flange;
