clear; clc; close all;
% Parameters
m = 1;
k = 20;
c = 1;

x0 = 0.1;
v0 = 0;
y0 = [x0, v0];

tspan = [0 10];

% ODE Function
springMassODE = @(t,y) [y(2);
                        -(c/m)*y(2) - (k/m)*y(1)];

% Solve IDE
[t, Y] = ode45(springMassODE, tspan, y0);

x = Y(:,1);
v = Y(:,2);

figure;
subplot(2,1,1);
plot (t,x,'LineWidth', 2);
xlabel('Time (s)'); 
ylabel('Displacement (m)');
title('Sping-Mass Damper Displacement');

subplot(2,1,2);
plot(t,v, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Sping-Mass Damper Velocity');

figure
for i = 1:length(t)
    clf;
    plot([-0.02,0], [0 -x(i)], 'k', 'LineWidth', 4);
    hold on;
    plot(0, -x(i), 'ro', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
    ylim([-0.2 0.2]);
    xlim([-0.1 0.1]);
    title(sprintf('Time = %.2f s', t(i)));
    pause(0.02)
end
