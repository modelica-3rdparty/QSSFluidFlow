package QSSFluidFlow "Library for modeling of quasi-steady-state fluid flow with constant fluid density."
extends Modelica.Constants;

annotation (
  Coordsys(
    extent=[0, 0; 606, 585], 
    grid=[2, 2], 
    component=[20, 20]), 
  Window(
    x=0.17, 
    y=0.17, 
    width=0.48, 
    height=0.62, 
    library=1, 
    autolayout=1), 
  Documentation(info="<HTML>

<p>
This package contains the library <i><b>QSSFluidFlow</b></i> (Quasi-Steady-State 
FluidFlow) with packages for components to store, transfer and control the flow of liquids:

<p>
The library consideres flow to be quasi-steady-state, i.e., no momentum balance is formulated.  
The fluid properties are defined as constants (density, kinematic viscosity).
</p>

<p>
For documentation, see the paper 
<b><a href=\"http://www.modelica.org/Conference2002/papers/p30_Fabricius.pdf\">
Modelica Library for Hybrid Simulation of Mass Flow in Process Plants</a></b>
available on the Modelica webpage, proceedings of the 2nd International 
Modelica Conference, March 18-19, 2002, which took place at the 
\"Deutsches Zentrum fur Luft- und Raumfahrt\" in Oberpfaffenhofen, Germany.
The document is also available in this library's folder
<b><a href=\"../p30_Fabricius.pdf\">
Modelica Library for Hybrid Simulation of Mass Flow in Process Plants</a></b>.
</p>

<p>
The slide presentation of the library at the 2nd International Modelica Conference
is also available electronically 
<b><a href=\"../FluidFlow_2nd_Int_Modelica_Conference_Munich_Presentation.pdf\">
Presentation:  FluidFlow Library</a></b>.
</p>

<p>
Please note, several model components are of a somewhat experimental
character, they are identified as such in the html-documentation of the
respective components or are placed in seperate sub-folders of the
library.  They may serve as a basis for further developments and tests.
</p>

<p>
The libraries focus is rather on system behavior, not the very details
of individual components.  Questions like, how behaves a certain arrangement
of serveral tanks, pipe segments, sensors, actuators and controllers
or how long does it take to discharge the contents of a vessel via its lower flange and a
pipe of 10 m lenght and 40 mm diameter, are of greater interest here than
very detailed particularities of say flow regime in pipes.  This does not
limit the possibility of adding more detailed component models though.  During
my own education to become a mechanical engineer, I would have been most happy to
have a language as Modelica and respective computer tools available to experiment 
in fluid dynamics classes with systems composed of tanks, pipes, valves or other
armatures in flow channels.  The learing effect of building and simulating
such models can be great and complement application of e.g., Bernoulli in an
analytical fashion with pen and paper.
</p>

<dl>
<dt><b>Author:</b>
<dd><a href=\"http://www.lsa.ethz.ch/lsa/faculty/docstu/fabricius/index.html
\">Stefan Fabricius</a><br>
    Swiss Federal Institute of Technology (ETH)<br>
    Laboratory for Safety Analysis<br>
    Weinbergstrasse 11<br>
    8001 Zurich<br>
    Switzerland<br>
    email: <A HREF=\"mailto:fabricius@lsa.iet.mavt.ethz.ch\">fabricius@lsa.iet.mavt.ethz.ch</A><br>
</dl>
<br>

<p><b>Release History and Notes:</b></p>
<ul>
<li><i>April 12th, 2002</i>, Version 1.0 (tested with Dymola 4.1c)<br> </li>
</ul>
<br>

<p><b>Copyright (C) 2002, with the author.</b></p>



<p>
The <i><b>FluidFlow</b></i> library is <b>free</b> software;  it can be redistributed and/or modified
under the terms of the <a href=\"../ModelicaLicense.html\">Modelica license</a>, see the license conditions in the documentation
to Modelica.
</p>

<p>
The library comes with absolutely no warranty.  It has been carefully tested, yet, the absence
of faults or bugs cannot be guaranteed.
</p>

<p>
Comments or bug reports are most welcome.
</p>


</HTML>
"));
end QSSFluidFlow;
