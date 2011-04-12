model PumpCentrifugal 
  "Centrifugal pump model (experimental model, not thoroughly tested)." 
  extends Interfaces.TwoFlange;
  
  //parameters
  parameter SIunits.Inertia Jw=1 "moment of inertia";
  parameter Real crp0=1 "rotational friction coefficient 0th order";
  parameter Real crp2=1 "rotational friction coefficient 2nd order";
  parameter Real k=0.75 "pump shook coefficient";
  //  parameter Real r1 = 0.1 "inner radius of wheel";
  parameter Real r2=0.25 "outer radius of wheel";
  parameter Real b2=0.02 "outer width of wheel";
  parameter Real beta2=25/360*2*pi;
  parameter Real hth1=(k/g_n)*r2^2 "theoretical pumping coefficient 1";
  parameter Real hth2=k/(g_n*b2*2*pi*tan(beta2)) 
    "theoretical pumping coefficient 2";
  parameter Real hnn=1 "pump characteristic coefficient 1";
  parameter Real hnv=1 "pump characteristic coefficient 2";
  parameter Real hvv=1 "pump characteristic coefficient 3";
  
  //variables
  SIunits.AngularVelocity w "Absolute angular velocity of component";
  SIunits.Torque Mw;
  SIunits.Torque Mrp;
  SIunits.Torque Mth;
  Real Hth;
  Real H;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Ellipse(extent=[-80, 80; 80, -80], style(color=0, thickness=2)), 
      Line(points=[80, 0; -40, 68], style(color=0, thickness=2)), 
      Line(points=[80, 0; -40, -68], style(color=0, thickness=2)), 
      Rectangle(extent=[10, -80; -10, 0], style(gradient=1)), 
      Text(extent=[6, -78; 88, -98], string="pump shaft")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="<HTML>

<p>
A more detailed and realistic centrifugal pump model, namely
a first order model with nonlinear algebraic constraint equations
as described in (German language) 
Geiger G. (1985), <i>Technische Fehlerdiagnose mittels Parameterschtzung und
Fehlerklassifikation am Beispiel einer elektrisch angetriebnen Kreiselpumpe</i>,
 VDI Verlag, Dsseldorf, Germany.
</p>

<p>
Note, this pump model is not thoroughly tested yet and of an experimental
character at the time.
</p>

</HTML>
"));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a RotationalFlange 
    annotation (extent=[-10, -100; 10, -80], layer="icon");
equation 
  w = der(RotationalFlange.phi);
  
  //pump shaft connection
  RotationalFlange.tau = Mw;
  
  //momentum balance for pump shaft
  Mw = Jw*der(w) + Mrp + Mth;
  
  //shaft rotational friction
  Mrp = crp0 + crp2*w^2;
  
  //relation of ideal shaft torque to ideal pump head
  w*Mth = rho*g_n*q*Hth;
  
  //ideal pump head (derived form Euler's turbo equation)
  Hth = hth1*w^2 - hth2*q;
  
  //pump charachteristic equation
  H = hnn*w^2 - hnv*w*q - hvv*q^2;
  
  //relation of head to pressure increase over the pump
  dp = rho*g_n*H;
  
end PumpCentrifugal;
