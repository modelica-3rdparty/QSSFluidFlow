model TankOpenInstrumented 
  "Open tank with level indicator and level alarms (high and low)." 
  extends Basic.Fluid;
  
  parameter SI.Diameter Dtank=2.0;
  parameter SI.Length Ltank=10.0;
  parameter SI.Length hmin=0.01*Ltank;
  parameter SI.Length hmax=0.99*Ltank;
  parameter SI.Length hstart=5.0;
  parameter SI.Area Atank=(pi/4)*Dtank^2;
  parameter SI.Diameter Dpipe=0.04;
  parameter SI.Area Apipe=(pi/4)*Dpipe^2;
  parameter SI.Pressure p_ambient=100000.0;
  parameter Real Kcon=0.05;
  
  SI.Length h(start=hstart);
  SI.Pressure p_bottom;
  SI.Pressure dp_outflow;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[2, 2], 
      component=[20, 20]), 
    Icon(
      Text(
        extent=[-80, 2; 80, -12], 
        string="hstart =  %hstart", 
        style(color=41)), 
      Line(points=[-60, 80; -60, -80; 60, -80; 60, 80], style(color=0, 
            thickness=2)), 
      Text(extent=[-96, 74; -64, 50], string="LAH"), 
      Text(extent=[62, 26; 84, 6], string="LI"), 
      Text(extent=[62, -50; 94, -74], string="LAL"), 
      Text(
        extent=[-82, 46; 78, 32], 
        string="Dtank=  %Dtank", 
        style(color=41)), 
      Text(
        extent=[-82, 60; 78, 46], 
        string="Ltank=  %Ltank", 
        style(color=41)), 
      Text(
        extent=[-92, -32; 92, -46], 
        string="%name", 
        style(color=73, thickness=2))), 
    Window(
      x=0.45, 
      y=0.01, 
      width=0.35, 
      height=0.49), 
    Documentation(info="<HTML>

<p>
Tank with constant cross section, open to atmosphere
with a flange at the top and a flange at the bottom.
</p>

</HTML>
"));
  Interfaces.Flange Ftop annotation (
    extent=[-10, 80; 10, 100], 
    rotation=-90, 
    layer="icon");
  Interfaces.Flange Fbottom annotation (
    extent=[-10, -100; 10, -80], 
    rotation=-90, 
    layer="icon");
  Modelica.Blocks.Interfaces.BooleanOutPort LAH annotation (extent=[-60, 28; -
        80, 48], layer="icon");
  Modelica.Blocks.Interfaces.OutPort Out annotation (extent=[60, -12; 80, 8], 
      layer="icon");
  Modelica.Blocks.Interfaces.BooleanOutPort LAL annotation (extent=[60, -50; 80
        , -30], layer="icon");
equation 
  //pressure at the bottom of the tank
  p_bottom = p_ambient + rho*g_n*h;
  
  //pressure at the flange in the gas space
  Ftop.p = p_ambient;
  
  //pressure at the flange in the liquid space
  dp_outflow = (1 + Kcon)*(rho/2)*(1/Apipe)*(-Fbottom.q)^2;
  Fbottom.p = noEvent(if (Fbottom.q > 0) then p_bottom else p_bottom - 
    dp_outflow);
  
  //mass balance
  Atank*der(h) = Ftop.q + Fbottom.q;
  
  //level indicator
  Out.signal[1] = h;
  
  //level alarms
  LAH.signal[1] = if (h > hmax) then true else false;
  LAL.signal[1] = if (h < hmin) then true else false;
end TankOpenInstrumented;
