model PipeGeographicalElevation 
  extends Interfaces.TwoFlange;
  
  //parameters  
  parameter SI.Length L=1.0;
  parameter SI.Height dz=L;
  parameter SI.Diameter D=0.04;
  parameter SI.Area A=pi/4*D^2;
  parameter SI.Velocity vRe2300=2300*nu/D;
  parameter SI.Velocity vRe4000=4000*nu/D;
  parameter Real klam=0.32*D^(-2)*nu*L*rho;
  parameter Real k1trans=(1/(vRe4000/vRe2300 - 1))*(kturb*vRe4000^(7/4) - klam*
      vRe4000);
  parameter Real k2trans=(1/vRe2300)*(klam*vRe2300 + k1trans);
  parameter Real kturb=0.182*D^(-5/4)*nu^(1/4)*L*rho;
  
  //variables
  SI.Velocity v(start=1.0, fixed=false) "flow velocity";
  Integer i 
    "flow regime indicator, 1: laminar, 2: transient positive, 3: transient negative 4: turbulent"
    ;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Ellipse(extent=[50, 40; 70, -40], style(fillColor=67)), 
      Rectangle(extent=[-60, 40; 60, -40], style(pattern=0, fillColor=67)), 
      Ellipse(extent=[-70, 40; -50, -40], style(fillColor=67)), 
      Line(points=[-60, 40; 60, 40]), 
      Line(points=[-60, -40; 60, -40]), 
      Text(
        extent=[-52, 40; 54, 14], 
        string="L = %L", 
        style(color=41)), 
      Text(
        extent=[-52, -12; 54, -38], 
        string="dz = %dz", 
        style(color=41)), 
      Line(points=[-60, -54; 58, -54], style(color=0)), 
      Line(points=[58, -54; 42, -46], style(color=0)), 
      Line(points=[58, -54; 44, -62], style(color=0)), 
      Text(extent=[-98, -72; 102, -80], string="%name"), 
      Line(points=[70, 0; 82, 0]), 
      Line(points=[-82, 0; -70, 0]), 
      Text(
        extent=[-48, 12; 58, -14], 
        string="D= %D", 
        style(color=41))), 
    Window(
      x=0.13, 
      y=0.01, 
      width=0.68, 
      height=0.78));
equation 
  //flow velocity
  v = q/A;
  
  //flow regime indicator
  i = if (v > -vRe2300) and (v < vRe2300) then 1 else if (v >= vRe2300) and (v
     < vRe4000) then 2 else if (v <= -vRe2300) and (v > -vRe4000) then 3 else 4
    ;
  
  //pressure drop relation
  dp - rho*g_n*dz = if (i == 1) then klam*v else if (i == 2) then -k1trans + 
    k2trans*v else if (i == 3) then k1trans + k2trans*v else kturb*sign(v)*
    noEvent(abs(v))^(7/4);
end PipeGeographicalElevation;
