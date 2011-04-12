model TankOpen "Open tank with level indicator." 
  extends Basic.Fluid;
  
  parameter SI.Diameter Dtank=2.0;
  parameter SI.Length Ltank=10.0;
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
    Diagram, 
    Window(
      x=0.12, 
      y=0.03, 
      width=0.63, 
      height=0.9), 
    Icon(
      Text(
        extent=[-80, 16; 80, 2], 
        string="hstart =  %hstart", 
        style(color=41)), 
      Line(points=[-60, 80; -60, -80; 60, -80; 60, 80], style(color=0, 
            thickness=2)), 
      Text(
        extent=[-92, -32; 92, -46], 
        string="%name", 
        style(color=73, thickness=2)), 
      Text(
        extent=[-82, 44; 78, 30], 
        string="Dtank=  %Dtank", 
        style(color=41)), 
      Text(
        extent=[-82, 60; 78, 46], 
        string="Ltank=  %Ltank", 
        style(color=41)), 
      Text(extent=[62, 26; 84, 6], string="LI")), 
    Documentation(info="<HTML>

<p>
Tank with constant cross section, open to atmosphere
with a flange at the top and a flange at the bottom.
</p>

</HTML>
"));
  Interfaces.Flange Ftop annotation (extent=[-10, 80; 10, 100], rotation=-90);
  Interfaces.Flange Fbottom annotation (extent=[-10, -100; 10, -80], rotation=-
        90);
  Modelica.Blocks.Interfaces.OutPort Out annotation (extent=[60, -12; 80, 8], 
      layer="icon");
equation 
  //pressure at the flange in the gas space
  Ftop.p = p_ambient;
  
  //pressure at the bottom of the tank
  p_bottom = p_ambient + rho*g_n*h;
  
  //pressure at the flange in the liquid space
  dp_outflow = (1 + Kcon)*(rho/2)*(1/Apipe)*(-Fbottom.q)^2;
  Fbottom.p = noEvent(if (Fbottom.q > 0) then p_bottom else p_bottom - 
    dp_outflow);
  
  //mass balance
  Atank*der(h) = Ftop.q + Fbottom.q;
  
  //level indicator
  Out.signal[1] = h;
end TankOpen;
