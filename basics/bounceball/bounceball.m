%% Bouncing Balls Simulation with GIF Export
clear; clc; close all;

%% Parameters
numBalls = 2;
t = 0;
tMax = 10;
dt = 0.05;

y = [30; 30];          % Initial heights
v = [0; 0];            % Initial velocities
g = 9.8;               % Gravity
r = [0.5; 0.6];        % Coefficient of restitution
delay = [0; 1];        % Start delay for each ball (seconds)
xPos = [-1, 1];        % X positions for plotting

%% Create Figures folder if it doesn't exist
if ~exist('Figures', 'dir')
    mkdir('Figures');
end
gifFile = fullfile('Figures','bounceball_animation.gif');

%% Set up figure
figure;
balls = gobjects(numBalls,1);
colors = {'b','r'};
hold on
for i = 1:numBalls
    balls(i) = plot(xPos(i), y(i), 'o', 'MarkerSize', 20, 'MarkerFaceColor', colors{i});
end
hold off
xlim([-2 2]);
ylim([0 max(y)+15]);
xlabel('x');
ylabel('Height (m)');
title('Bouncing Balls with Delay');
grid on

%% Animation loop with GIF export
while t < tMax
    for i = 1:numBalls
        if t >= delay(i)
            % Update velocity and position
            v(i) = v(i) - g*dt;
            y(i) = y(i) + v(i)*dt;

            % Bounce
            if y(i) <= 0
                y(i) = 0;
                v(i) = -v(i)*r(i);
            end
        end
        set(balls(i), 'YData', y(i)); % Update plot
    end

    drawnow;

    % Capture frame for GIF
    frame = getframe(gcf);
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256);
    if t == 0
        imwrite(A,map,gifFile,'gif','LoopCount',Inf,'DelayTime',dt);
    else
        imwrite(A,map,gifFile,'gif','WriteMode','append','DelayTime',dt);
    end

    t = t + dt;
end

disp(['Animation GIF saved at: ', gifFile]);
