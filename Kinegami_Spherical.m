% Kinegami Test V1 (Spherical Wrist)
% Last Edited 1/1/2022 by Lucien Peach

clear
close all
clc

% User Options - Change Prior to Running (if necessary)

% Determines whether JointPlacement.m ('placement'), JointAssignment.m
% ('assignment'), or SelfAssign.m ('selfassign') will be used for the joint
% localization
jointselect = 'placement';

% Determines whether the user wishes their elbow fittings to have visible
% tucks ('on' - recommended) or appear with only the lower outlines ('off')
elbow_tuck = 'on';

% Determines whether the user wishes to print 3 iterations of the print
% pattern ('triple' - recommended) or 2 ('double')
triple = 'triple';

% Specify the angle modification utilized ([0, 0, 0, 0] recommended)
theta_mod = [0, 0, 0, 0];

% Specify the orientation of the fingertip: 'x', 'y', or 'z'
fingertip = 'z';

% Specify whether DXF generation and save file should occur ('on'/'off')
DXF = 'on';

% Specify whether elbow splitting should occur past pi/2 ('on'/'off')
split = 'on';

% Specify whether or not pre-segmentation (for printing) is enabled
% ('on'/'off')
segmentation = 'on';

% Specify whether intermediary plots should be run ('on'/'off'). 'off' is
% recommended for faster computational time, 'on' is recommended for more
% in-depth analysis.
plotoption = 'off';

% Specify DH Parameters, if needed
D = [0, 0, 0.1, 0; ...
    0, pi/2, 0, pi/2; ...
    0, pi/2, 0, pi/2; ...
    0, pi/2, 0.1, 0];

% Specify number of sides (polygon)
nsides = 4;

% Specify radius [m]
r = 0.02;

% Specify number of sides of polygon
n = 4;

JointStruct(4) = struct();

for i = 1:4
    JointStruct(i).qm = pi;
    JointStruct(i).q0 = 0;
    JointStruct(i).type = 'R';
    JointStruct(i).nz = 1;
end

JointStruct(2).q0 = pi/2;
JointStruct(3).q0 = pi/2;
JointStruct(4).type = 'F';

N = size(JointStruct, 2) - 1;

% If the selfassign tag is applied, provide Oc for each joint
if strcmp(selfassign, 'true') == 1
    
    TransformStruct(N+1) = struct();
    
    TransformStruct(1).Oc = [1, 0, 0, 0; ...
        0, 1, 0, 0; ...
        0, 0, 1, -0.159];
    
    TransformStruct(2).Oc = [0, -1, 0, 0; ...
        0, 0, -1, 0.2377; ...
        1, 0, 0, 0.1];
    
    TransformStruct(3).Oc = [0, 0, 1, -0.139; ...
        -1, 0, 0, 0; ...
        0, -1, 0, 0.1];    
    
    TransformStruct(4).Oc = [0, 0, 1, 0; ...
        0, -1, 0, 0; ...
        1, 0, 0, 0.2];
    
else
    
    % Otherwise, do nothing besides initialization
    TransformStruct(N+1) = struct();

end

[infostruct, TransformStruct, DataNet] = Kinegami(D, r, n, JointStruct, ...
    elbow_tuck, triple, theta_mod, fingertip, TransformStruct, ...
    DXF, split, segmentation, plotoption, jointselect);
