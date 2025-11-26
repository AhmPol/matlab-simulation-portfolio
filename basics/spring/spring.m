%% Spring-Mass-Damper Simulation with Animation and GIF
clear; clc; close all;

%% Parameters
m = 1;        % Mass (kg)
k = 20;       % Spring constant (N/m)
c = 1;        % Damping coefficient (Ns/m)

x0 = 0.1;     % Initial displacement (m)
v0 = 0;       % Initial velocity (m/s)
y0 = [x0, v0];

tspan = [0 10];  % Time span (s)

%% ODE Function
springMassODE = @(t,y) [y(2); -(c/m)*y(2) - (k/m)*y(1)];

%% Solve ODE
[t, Y] = ode45(springMassODE, tspan, y0);

x = Y(:,1);   % Displacement
v = Y(:,2);   % Velocity

%% Plot Displacement and Velocity
figure;
subplot(2,1,1);
plot(t, x, 'LineWidth', 2);
xlabel('Time (s)'); 
ylabel('Displacement (m)');
title('Spring-Mass-Damper Displacement');

subplot(2,1,2);
plot(t, v, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Spring-Mass-Damper Velocity');

%% Create Folder for Figures / GIF
if ~exist('Figures', 'dir')
    mkdir('Figures');
end

%% Animation with GIF Export
filename = fullfile('Figures','spring_animation.gif'); % GIF file path

figure;
for i = 1:length(t)
    clf;
    % Draw spring line
    plot([-0.02,0], [0 -x(i)], 'k', 'LineWidth', 4);
    hold on;
    % Draw mass as a red circle
    plot(0, -x(i), 'ro', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
    ylim([-0.2 0.2]);
    xlim([-0.1 0.1]);
    title(sprintf('Time = %.2f s', t(i)));
    xlabel('X');
    ylabel('Displacement');
    grid on;
    
    drawnow;
    
    % Capture frame for GIF
    frame = getframe(gcf);
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256);
    if i == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.02);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.02);
    end
end

disp('Animation GIF saved in Figures/spring_animation.gif');
