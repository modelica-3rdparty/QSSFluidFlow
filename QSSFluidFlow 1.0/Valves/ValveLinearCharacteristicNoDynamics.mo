model ValveLinearCharacteristicNoDynamics "Valve with linear characteristic." 
  extends Interfaces.TwoFlange;
  
  parameter Real kvs=15 "m3/h and bar";
  parameter Real kSI=(3600^2)*1e5 "to convert to m3/s and Pa";
  parameter SI.Position xmin=1e-4 
    "minimal valve opening (defines a small leakage of the valve)";
  
  Real kv;
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
        extent=[-84, -32; 80, -50], 
        string="kvs =  %kvs", 
        style(color=41)), 
      Text(extent=[-100, -86; 100, -100], string="%name"), 
      Line(points=[-58, -76; 60, -76], style(color=0)), 
      Line(points=[60, -76; 44, -68], style(color=0)), 
      Line(points=[60, -76; 46, -84], style(color=0)), 
      Text(extent=[-100, 54; 100, 40], string="Linear"), 
      Text(extent=[-100, 42; 100, 28], string="Static")), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
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
  
  //valve characteristic
  //prevent y to become zero, valve leakes always a little
  //in that the valve travel stops at xmin
  kv = noEvent(if (xa >= xmin) then kvs*xa else kvs*xmin);
  
  //constitutive equation of valve
  dp = noEvent(if (q > 0) then (1/kv^2)*kSI*q^2 else -(1/kv^2)*kSI*(-q)^2);
end ValveLinearCharacteristicNoDynamics;
