%Pure Pursuit Controller

%%add Image to the path
addpath(genpath('Images'));




%%define refrence points
refPose = REFPOSE;
xRef = refPose(:,1);
yRef = -refPose(:,2);

%%define refrence time for plotting
Ts =16;  %Simulation time
s = size(xRef);
tRef = (linspace(0,Ts,s(1)))';  % this time variable is used in the "2D Visualisation" block for plotting the refrence points

%% define parameters used in the models
L = 3; % BICYCLE MODEL
Ld = 5; % lookahead distance
X_o = refPose(1,1);  %initial vehicle position
Y_o = -refPose(1,2); %intitial vehicle position
psi_o = 0; %inital yaw angle

                                
                                