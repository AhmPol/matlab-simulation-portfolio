% Parameters
t = 0;              % time

% Balls setup (columns = balls)
y = [30; 30];         % heights
v = [0; 0];        % velocities
g = [9.8; 9.8];
dt = [0.05; 0.05];
r = [0.5; 0.6];
delay = [0; 0];     % start delay for each ball (ball 2 starts at t=1s)

% Plot setup
figure
balls(1) = plot(-1, y(1), 'o', 'MarkerSize', 20, 'MarkerFaceColor', 'b');
hold on
balls(2) = plot( 1, y(2), 'o', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
hold off
xlim([-2 2])
ylim([0 h+15])
xlabel('x')
ylabel('height')
title('Bouncing Balls with Delay')
grid on

% Simulation loop
while t < 10
    for i = 1:2
        if t > delay(i)   % only update after its delay
            v(i) = v(i) - g(i)*dt(i);
            y(i) = y(i) + v(i)*dt(i);

            if y(i) <= 0
                y(i) = 0;
                v(i) = -v(i)*r(i);
            end
        end
        set(balls(i), 'YData', y(i))  % update plot
    end
    
    t = t + dt;
    drawnow
end
