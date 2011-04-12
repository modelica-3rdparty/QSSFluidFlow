partial model Fluid 
  //Constant values for the fluid used
  constant SI.Density rho=1000.0;
  constant SI.KinematicViscosity nu=1.0e-6;
  annotation (Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]));
end Fluid;
