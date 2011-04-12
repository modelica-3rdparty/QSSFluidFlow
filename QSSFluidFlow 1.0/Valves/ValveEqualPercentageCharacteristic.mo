model ValveEqualPercentageCharacteristic 
  "Valve with equal percentage characteristic and exponential first order lag dynamics"
   
  
  extends Interfaces.TwoFlange;
  
  parameter Real kvs=15 "m3/h and bar";
  parameter Real Rv=50 "Rangeability constant of the valve";
  parameter Real kSI=(3600^2)*1e5 "to convert to m3/s and Pa";
  parameter SI.Time tau=1 "time constant of the valve positionner";
  parameter SI.Position xstart=0.5 "starting position of valve servo";
  parameter SI.Position xmin=1e-4 
    "minimal valve opening (defines a small leakage of the valve)";
  
  Real kv;
  SI.Position x(start=xstart) "valve travel";
  SI.Position xd "demanded valve travel";
  SI.Position xa "allowed valve travel";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Polygon(points=[-20, 60; -14, 74; 0, 80; 14, 72; 20, 60; -20, 60], style(
            color=0, fillColor=67)), 
      Line(points=[0, 60; 0, 0], style(color=0)), 
      Polygon(points=[-60, 40; -60, -40; 0, 0; -60, 40], style(color=0, 
            fillColor=67)), 
      Line(points=[-82, 0; -60, 0], style(color=0)), 
      Polygon(points=[60, 40; 60, -40; 0, 0; 60, 40], style(color=0, fillColor=
              67)), 
      Line(points=[60, 0; 82, 0], style(color=0)), 
      Text(
        extent=[-84, -22; 80, -40], 
        string="kvs =  %kvs", 
        style(color=41)), 
      Text(extent=[-100, -86; 100, -100], string="%name"), 
      Text(
        extent=[-82, -38; 82, -56], 
        string="tau =  %tau", 
        style(color=41)), 
      Line(points=[-58, -76; 60, -76], style(color=0)), 
      Line(points=[60, -76; 44, -68], style(color=0)), 
      Line(points=[60, -76; 46, -84], style(color=0)), 
      Text(
        extent=[-82, -54; 82, -72], 
        string="xstart = %xstart", 
        style(color=41)), 
      Text(
        extent=[-80, 38; 82, 20], 
        string="Rv =  %Rv", 
        style(color=41)), 
      Text(extent=[-100, 56; 100, 42], string="Equal percentage")), 
    Window(
      x=0.15, 
      y=0.01, 
      width=0.65, 
      height=0.49));
  Interfaces.Flange Fleft annotation (extent=[-100, -10; -80, 10], layer="icon"
    );
  Interfaces.Flange Fright annotation (extent=[80, -10; 100, 10], layer="icon")
    ;
  Modelica.Blocks.Interfaces.InPort Control annotation (
    extent=[-10, 80; 10, 100], 
    rotation=-90, 
    layer="icon");
equation 
  xd = Control.signal[1];
  xa = if xd <= 1.0 then xd else 1.0;
  
  //valve positionner dynamics
  der(x) = (1/tau)*(xa - x);
  
  //valve characteristic
  //prevent y to become zero, valve leakes always a little
  //in that the valve travel stops at xmin
  kv = noEvent(if (x >= xmin) then kvs*Rv^(x - 1) else kvs*Rv^(xmin - 1));
  
  //constitutive equation of valve
  dp = noEvent(if (q > 0) then (1/kv^2)*kSI*q^2 else -(1/kv^2)*kSI*(-q)^2);
end ValveEqualPercentageCharacteristic;
