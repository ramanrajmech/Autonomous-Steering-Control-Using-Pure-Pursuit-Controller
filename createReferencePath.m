function [refPose, x0, y0, theta0, curvatures, cumLengths, simStopTime] = ...
    createReferencePath(scenario)
%   Create driver path

% v0      % Initial speed of the ego car           (m/s)
% x0      % Initial x position of ego car          (m)
% y0      % Initial y position of ego car          (m)
% theta0  % Initial yaw angle of ego car           (degrees)

% Extract ego pose information
restart(scenario);

curvatures = [];
refPose  = [];
simTime    = [];

while advance(scenario)
    egoVehicle = scenario.Actors(1);
    lb         = laneBoundaries(egoVehicle);
    curvatures = [curvatures; mean([lb.Curvature])]; %#ok<*AGROW>
    refPose   = [refPose; [egoVehicle.Position(1:2), egoVehicle.Yaw]];
    simTime    = [simTime; scenario.SimulationTime];
end

x0     = refPose(1, 1);
y0     = refPose(1, 2);
theta0 = refPose(1, 3);

simStopTime = simTime(end);
cumLengths  = simTime * egoVehicle.Velocity(1);