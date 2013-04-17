partial model TwoFlange 
  extends Basic.Fluid;
  
  SI.Pressure dp;
  SI.VolumeFlowRate q(start=0.01, fixed=false);
  annotation (Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49));
  Flange Fleft annotation (extent=[-100, -10; -80, 10]);
  Flange Fright annotation (extent=[80, -10; 100, 10]);
equation 
  //pressure drop
  dp = Fleft.p - Fright.p;
  
  //volumetric flow relation
  q = Fleft.q;
  Fright.q = -q;
  
end TwoFlange;
