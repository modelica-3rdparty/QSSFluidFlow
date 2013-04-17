model PipeChangeOfDiameter 
  extends Interfaces.TwoFlange;
  
  parameter SI.Diameter D1=0.04;
  parameter Real Dratio=0.5 "value limited to > 0.0 and <=1.0! (convention)";
  parameter SI.Diameter D2=D1*Dratio;
  parameter SI.Area A1=(pi/4)*D1^2;
  parameter SI.Area A2=(pi/4)*D2^2;
  //pressure loss coefficients for the case of accelerated flow (narrowing)
  //and deccelerated flow (widening), here in this component, the convention
  //is, for positive flow rate q, we have the case of accelerated, and for
  
  
    //negative flow rate q, the case of decelerated flow.  The respective pressure
  
  
    //loss cofficients for the cases and the desired geometry can be taken from the
  //literature
  parameter Real zeta_narr=0.5 "pressure loss coefficient v>=0.0 (narrowing)";
  parameter Real zeta_wid=0.5 "pressure loss coefficient v <0.0 (widening)";
  
  SI.Velocity v1;
  SI.Velocity v2(start=1.0, fixed=false);
  SI.Pressure dp_rev "reversible pressure drop";
  SI.Pressure dp_irr_narr "irreversible pressure loss narrowing case";
  SI.Pressure dp_irr_wid "irreversible pressure loss widening case";
  annotation (Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), Icon(
      Text(
        extent=[-60, 60; -60, 44], 
        string="Dleft=%D1", 
        style(color=41, fillColor=41)), 
      Text(
        extent=[64, 40; 64, 24], 
        string="Dright=%D2", 
        style(color=41, fillColor=41)), 
      Text(
        extent=[0, 98; 0, 82], 
        string="zeta_narr=%zeta_narr", 
        style(color=41, fillColor=41)), 
      Text(
        extent=[-2, 80; -2, 64], 
        string="zeta_wid=%zeta_wid", 
        style(color=41, fillColor=41)), 
      Text(extent=[-100, -48; 100, -56], string="%name"), 
      Ellipse(extent=[-70, 40; -50, -40], style(fillPattern=0)), 
      Line(points=[-82, 0; -70, 0]), 
      Ellipse(extent=[58, 20; 68, -20], style(fillPattern=0)), 
      Line(points=[68, 0; 82, 0]), 
      Line(points=[-60, 40; -20, 40]), 
      Ellipse(extent=[-30, 40; -10, -40], style(fillPattern=0)), 
      Line(points=[-60, -40; -20, -40]), 
      Ellipse(extent=[4, 20; 14, -20], style(fillPattern=0)), 
      Line(points=[-20, -40; 10, -20; 64, -20]), 
      Line(points=[-20, 40; 10, 20; 62, 20])));
  Interfaces.Flange Fleft annotation (extent=[-100, -10; -80, 10], layer="icon"
    );
  Interfaces.Flange Fright annotation (extent=[80, -10; 100, 10], layer="icon")
    ;
equation 
  //flow velocities
  v1 = q/A1;
  v2 = q/A2;
  
  //pressure difference
  dp_rev = (rho/2)*(v2^2 - v1^2);
  dp_irr_narr = zeta_narr*(rho/2)*v1^2;
  dp_irr_wid = zeta_wid*(rho/2)*v2^2;
  dp = noEvent(if (q >= 0.0) then dp_rev + dp_irr_narr else dp_rev - dp_irr_wid
    );
end PipeChangeOfDiameter;
