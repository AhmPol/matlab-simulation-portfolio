% Parameters
v0 = [25; 25; 25; 25; 25];
theta = [15; 30; 45; 60; 75];
g = 9.8;
dt = 0.05;
y = [0; 0; 0; 0; 0];
x = [0; 0; 0; 0; 0];

% Convert angles into radian
theta_rad = deg2rad(theta);

% Initial Velocity
vx = v0 .* cos(theta_rad);
vy = v0 .* sin(theta_rad);

% Array to store trajectory
X = x;
Y = y;

%Time loop
t = 0;
y0 = y;

% Set Up Figure
figure 
proj1 = plot(0, x(1), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b');
hold on 
proj2 = plot(0, x(2), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
trail1 = plot(X(1,:), Y(1,:), 'b', 'LineWidth', 1.5); % line for trajectory
trail2 = plot(X(2,:), Y(2,:), 'r', 'LineWidth', 1.5); % line for trajectory
proj3 = plot(0, x(3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
trail3 = plot(X(3,:), Y(3,:), 'g', 'LineWidth', 1.5); % line for trajectory
proj4 = plot(0, x(4), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'y');
trail4 = plot(X(4,:), Y(4,:), 'y', 'LineWidth', 1.5); % line for trajectory
proj5 = plot(0, x(5), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'm');
trail5 = plot(X(5,:), Y(5,:), 'm', 'LineWidth', 1.5); % line for trajectory
xlim ([0, 2*max(v0.^2 .* sin(2*max(theta_rad))/g) + 5])
ylim ([0, max(y0 + (v0.^2 .* (sin(max(theta_rad)).^2)) / (2*g)) + 10])
xlabel ('x (m)')
ylabel ('y(m)')
title ('Project Motion')
grid on

while true
    t = t + dt;
    
    for i = 1:5
        % Update positions
        x(i) = vx(i) * t;
        ytemp = y0(i) + vy(i)*t - 0.5*g*t^2;
        y(i) = max(ytemp, 0);
    end

    % Store trajectory
    X(:, end+1) = x;
    Y(:, end+1) = y;

    %Update plots
    set(proj1, 'XData', x(1), 'YData', y(1))
    set(proj2, 'XData', x(2), 'YData', y(2))
    set(proj3, 'XData', x(3), 'YData', y(3))
    set(proj4, 'XData', x(4), 'YData', y(4))
    set(proj5, 'XData', x(5), 'YData', y(5))
    set(trail1, 'XData', X(1,:), 'YData', Y(1,:))
    set(trail2, 'XData', X(2,:), 'YData', Y(2,:))
    set(trail3, 'XData', X(3,:), 'YData', Y(3,:))
    set(trail4, 'XData', X(4,:), 'YData', Y(4,:))
    set(trail5, 'XData', X(5,:), 'YData', Y(5,:))

    drawnow
    
    % Break only after both projectiles are at ground
    if all(y == 0) && t > 0
        break
    end
end
