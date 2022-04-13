# Kinegami
Given a Denavit-Hartenberg (D-H) specification of a kinematic chain robot, the program generates a crease pattern that folds into a kinematically equivalent robot with compliant joints. The program takes in the D-H specification and assigns the corresponding joint to a location that is sufficiently far from other joints while keeping the same kinematic properties. Then an origami link inspired by Dubin's path method is created to connect every two consecutive joints. 

To construct the D-H specification, follow the variable definition ("Link length (a)", "Link twist (&alpha;)", "Joint offset (d)", and "Joint angle (&theta;)") and numbering system of the following kinematic chain mechanism schematic drawing (for more detail, please read "W. Khalil and E. Dombre, *Modeling, identification and control of robots*") to form a table.

<!-- ![DH](https://user-images.githubusercontent.com/50150425/161108095-26ed20c8-596d-4ba4-a642-271e6f2d4c32.png) -->
<!-- ![DHlight](https://user-images.githubusercontent.com/50150425/161122307-ad8ce29e-18ea-4b91-883e-ca186c5232fc.png) -->
<img src="https://user-images.githubusercontent.com/50150425/161122307-ad8ce29e-18ea-4b91-883e-ca186c5232fc.png" alt="DHlight" width="600"/>

Our Kinegami algorithm recruits a catalogue of parameterized modules. The folded state of the origami module, its spacial operator representation, and its crease pattern is shown here: (a) the origami prism tube, (b) the twist fitting, (c) the elbow fitting, (d) the prismatic joint, (e) the revolute joint, (f) partial close-up of an elbow fitting and (g) partial close-up of a revolute joint.

![OrigamiModuleNew](https://user-images.githubusercontent.com/50150425/161108362-0ee75174-3fda-47f5-8d4d-f7433aadc7c7.png)

In addition, it provides the additional contribution of automatically choosing the relevant modules (with design parameters that control their compliance) and composing them into a non-self-intersecting single sheet pattern, thus reducing the design problem into simply one of abstract specification.
The resulting pipeline does not require additional human input beyond the D-H specification. However, its algorithmic steps are sufficiently transparent to facilitate the integration of designers' alternative modules or more suitably optimized compositions when desired.

## User Guide
Kinegami runs on MATLAB (works on version MATLAB_R2021a).  
Run scripts `Kinegami_******.m` for existing examples and change parameters if desired. 
To create your kinematic chain robot, fill out the `Kinegami_Template.m` file in this order:
1. Design the regular polygon shape (the number of sides "nside" and circumradius "r") as the tubular origami base
2. Determine the number of joints for your robot; fill in the number of joints plus one (the fingertip) in variable "n."
3. Fill in the DH parameters specifications for variable "D" following the joint design.
4. Specify joints information, all variables that contain "??," including TYPE, maximum joint range, initial joint configurations, etc.
5. In addition, modify the user specifications for crease pattern generation, including DXF printing and segmentations.

For a more comprehensive understanding, reference supporting functions. The algorithm requires "fSolve" from the MatLab Optimization Toolbox. Please install the add-on Optimization Toolbox.

## Laser cutting instructions
The crease pattern generated by the algorithm can be output as a `.dxf` file. Its unit is in meters.
The blue lines indicate the mountain folds, the red indicates the valley folds, and the black lines show the border edges.
We then cut our specimen with the "PLS 4.75" laser cutting machine.
We perforated the paper for the blue and red lines by setting the machine parameters to be (power 10, speed 20, ppi 25).
For the black line, we cut the paper by setting the machine parameters to be (power 10, speed 20, ppi 750).
The paper we use is the 8 mils thick Durilla synthetics paper with polyester finish (CTI Paper, USA).

<!-- ## Updates:
7/5/2021:
Edited `JointAssignment.m` to include the correct value of rs for Prismatic Joints.
Edited `Kinegami.m` to support plotting for Proximal and Distal Frames. Added new function frameplot.m for frame plotting. Changed manner in which figures are closed in papercut files. -->

## Acknowledgement
This work was supported by the Army Research Office under the SLICE Multidisciplinary University Research Initiatives Program award under Grant \#W911NF1810327, and in part by the National Science Foundation under Grant \#1845339. In addition, we thank Sheely Wu for her contributions in the documentation.

## Credit
This application uses Open Source components. You can find the source code of their open source projects along with license information below. We acknowledge and are grateful to these developers for their contributions to open source.

Package: [dxflib](https://github.com/taquart/dxflib.git), 
[License](https://github.com/taquart/dxflib/blob/f653f3d9829ec92ab2414a8616e9e04d9fa43e44/dxflib/license.txt)  
Package: [Bounding-Spheres-And-Circles](https://github.com/AntonSemechko/Bounding-Spheres-And-Circles.git),
[License](https://github.com/AntonSemechko/Bounding-Spheres-And-Circles/blob/cc88aa596dcdb568dd198982527f4ad951ce40aa/LICENSE.md)

## License
This code is released using the Penn Software License. Please refer to `LICENSE.md` for details.
