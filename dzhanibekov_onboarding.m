%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dzhanibekov Onboarding
% Author: Gary Huang

clc
clear

% Parameters
I_x = 0.02; % x-axis inertia [kg * m^2]
I_y = 0.003; % y-axis inertia [kg * m^2]
I_z = 0.027; % z_axis inertia [kg * m^2]
I = [I_x, I_y, I_z];

% Initial conditions
w_0 = [pi, 0.05, 0.05]; % angular velocity [rad / s]
q_0 = [1, 0, 0, 0]; % quaternion

X_0 = [w_0, q_0]; % Initial state vector
input = [w_0, q_0];
[t, X] = ode45(@(time, input)state_vector_derivative(time, input, I), [0, 20], X_0);