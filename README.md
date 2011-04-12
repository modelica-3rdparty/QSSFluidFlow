# QSSFluidFlow

Modelica library for quasi-steady-state fluid flows. It has components to store, transfer and control the flow of liquids. The library consideres flow to be quasi-steady-state, i.e., no momentum balance is formulated. The fluid properties are defined as constants (density, kinematic viscosity).

## Library description

This package contains the library `QSSFluidFlow` (Quasi-Steady-State FluidFlow) with packages for components to store, transfer and control the flow of liquids:
* The library consideres flow to be quasi-steady-state, i.e., no momentum balance is formulated.
* The fluid properties are defined as constants (density, kinematic viscosity).

For documentation, see the paper "[Modelica Library for Hybrid Simulation of Mass Flow in Process Plants](http://www.modelica.org/Conference2002/papers/p30_Fabricius.pdf)" available on the Modelica webpage, proceedings of the 2nd International Modelica Conference, March 18-19, 2002, which took place at the  "Deutsches Zentrum fur Luft- und Raumfahrt" in Oberpfaffenhofen, Germany.

Please note, several model components are of a somewhat experimental
character, they are identified as such in the html-documentation of the
respective components or are placed in seperate sub-folders of the
library.  They may serve as a basis for further developments and tests.

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

## Current release

Download [QSSFluidFlow v1.0 (2002-04-12)](../../archive/v1.0.zip)

#### Release notes

* [Version v1.0 (2002-04-12)](../../archive/v1.0.zip)
 * tested with Dymola 4.1c

## License

Copyright &copy; 2002, with the author.

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](http://www.modelica.org/licenses/ModelicaLicense2).
For license conditions (including the disclaimer of warranty) visit [http://www.modelica.org/licenses/ModelicaLicense2](http://www.modelica.org/licenses/ModelicaLicense2).


## Development and contribution
Original Author:

    Stefan Fabricius
    Swiss Federal Institute of Technology (ETH)
    Laboratory for Safety Analysis
    Weinbergstrasse 11
    8001 Zurich
    Switzerland
    fabricius@lsa.iet.mavt.ethz.ch

You may report any issues with using the [Issues](../../issues) button.

Contributions in shape of [Pull Requests](../../pulls) are always welcome.
