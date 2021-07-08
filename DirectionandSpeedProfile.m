 

%% Vehicle Parameters
wheelbase = 2.8;         % Wheelbase of the vehicle (m)

%% General Model Parameters
Ts = 0.05;               % Simulation sample time (s) 

%% Create scenario and road specifications
[scenario,roadCenters,laneSpecification,speed] = createDrivingScenario;

% You can use Driving Scenario Designer to explore the scenario
% drivingScenarioDesigner('LateralControl')

%% Generate data for Simulink simulation  
[refPoses,x0,y0,theta0,curvatures,cumLengths, simStopTime] = createReferencePath(scenario);

directions   = ones(size(refPoses, 1), 1);
speedProfile = ones(size(refPoses, 1), 1)*Vx;

