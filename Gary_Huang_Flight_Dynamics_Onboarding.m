%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Flight Dynamics Onboarding
% Author: Gary Huang

% Rocket/Environment Parameters
clc
clear
thrust = 2000; % [N]
mass = 40; % [kg]
burn_time = 5; % [s]
outer_diameter = 0.1; % [m]
drag_coefficient = 0.75; % []

theta = pi / 4; % launch angle

air_density = 1.225; % [kg/m^3]
g = 9.8; % [m/s^2]

% Initial state
x = 0;
y = 0;
v_x = 0;
v_y = 0;

t = 0; % [s]
dt = 0.1; % [s]

% Arrays
x_array = [x];
y_array = [y];
v_x_array = [v_x];
v_y_array = [v_y];
t_array = [t];

while t < burn_time
    thrust_x = thrust * cos(theta);
    thrust_y = thrust * sin(theta);
    % Update velocity
    v_x = v_x + (thrust_x / mass) * dt;
    v_y = v_y + (thrust_y / mass) * dt;
    % Calculate drag force
    drag_force = 0.5 * air_density * (v_x^2 + v_y^2) * outer_diameter * drag_coefficient;
    v_x = v_x - (drag_force / mass) * v_x / sqrt(v_x^2 + v_y^2) * dt;
    v_y = v_y - (drag_force / mass) * v_y / sqrt(v_x^2 + v_y^2) * dt;
    % Gravity
    v_y = v_y - g * dt;
    % Update position
    x = x + v_x * dt;
    y = y + v_y * dt;
    % Update time
    t = t + dt;
    x_array = [x_array, x];
    y_array = [y_array, y];
    v_x_array = [v_x_array, v_x];
    v_y_array = [v_y_array, v_y];
    t_array = [t_array, t];
    
end

while y > 0
    drag_force = 0.5 * air_density * (v_x^2 + v_y^2) * outer_diameter * drag_coefficient;
    v_x = v_x - (drag_force / mass) * v_x / sqrt(v_x^2 + v_y^2) * dt;
    v_y = v_y - (drag_force / mass) * v_y / sqrt(v_x^2 + v_y^2) * dt;
    % Gravity
    v_y = v_y - g * dt;
    % Update position
    x = x + v_x * dt;
    y = y + v_y * dt;
    % Update time
    t = t + dt;
    x_array = [x_array, x];
    y_array = [y_array, y];
    v_x_array = [v_x_array, v_x];
    v_y_array = [v_y_array, v_y];
    t_array = [t_array, t];
end 

velocity_array = sqrt(v_x_array.^2 + v_y_array.^2);
theta_array = atan(v_y_array ./ v_x_array);
theta_array(1) = 0.6258;
apogee = max(y_array);

x_column = x_array(:);
y_column = y_array(:);
position = [x_column, y_column];

% Plotting
figure(1)
clf;
plot(x_array, y_array)
xlabel("x position")
ylabel("y position")
title("Position graph")

figure(2)
clf;
plot(t_array, velocity_array)
xlabel("Time")
ylabel("Velocity")
title("Velocity graph")

