%% Projectile Motion Simulation with GIF Export
clear; clc; close all;

%% Parameters
v0 = [25; 25; 25; 25; 25];          % Initial velocities (m/s)
theta = [15; 30; 45; 60; 75];       % Launch angles (degrees)
g = 9.8;                             % Gravity (m/s^2)
dt = 0.05;                           % Time step (s)
numProj = length(v0);

% Convert angles to radians
theta_rad = deg2rad(theta);

% Initial velocity components
vx = v0 .* cos(theta_rad);
vy = v0 .* sin(theta_rad);

% Initialize positions
x = zeros(numProj,1);
y = zeros(numProj,1);
y0 = y;

% Store trajectories
X = x;
Y = y;

%% Create Figures folder if it doesn't exist
if ~exist('Figures', 'dir')
    mkdir('Figures');
end
gifFile = fullfile('Figures','projectile_animation.gif');

%% Set up figure and plots
figure;
colors = {'b','r','g','y','m'};
projPlots = gobjects(numProj,1);
trailPlots = gobjects(numProj,1);

hold on
for i = 1:numProj
    projPlots(i) = plot(0, y(i), 'o', 'MarkerSize',10, 'MarkerFaceColor', colors{i});
    trailPlots(i) = plot(X(i,:), Y(i,:), colors{i}, 'LineWidth',1.5);
end
hold off

xlim([0, 2*max(v0.^2 .* sin(2*max(theta_rad))/g) + 5])
ylim([0, max((v0.^2 .* (sin(max(theta_rad)).^2)) / (2*g)) + 10])
xlabel('x (m)')
ylabel('y (m)')
title('Projectile Motion')
grid on

%% Animation loop
t = 0;
while true
    t = t + dt;
    
    % Update positions for each projectile
    for i = 1:numProj
        ytemp = y0(i) + vy(i)*t - 0.5*g*t^2;
        y(i) = max(ytemp, 0);          % Ball cannot go below ground
        x(i) = vx(i) * t;
    end
    
    % Store trajectory
    X(:, end+1) = x;
    Y(:, end+1) = y;
    
    % Update plots
    for i = 1:numProj
        set(projPlots(i), 'XData', x(i), 'YData', y(i));
        set(trailPlots(i), 'XData', X(i,:), 'YData', Y(i,:));
    end
    
    drawnow;
    
    % Capture frame for GIF
    frame = getframe(gcf);
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256);
    if t==dt
        imwrite(A,map,gifFile,'gif','LoopCount',Inf,'DelayTime',dt);
    else
        imwrite(A,map,gifFile,'gif','WriteMode','append','DelayTime',dt);
    end
    
    % Stop when all projectiles have hit the ground
    if all(y==0) && t>0
        break
    end
end

disp(['Animation GIF saved at: ', gifFile]);
