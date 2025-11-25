x = 0:0.01:2*pi;

y1 = sin(2*x);
y2 = sin(x);
y3 = cos(2*x);
y4 = cos(x);

plot(x, y1, 'r', 'LineWidth', 2);  % red solid
hold on
plot(x, y2, 'b--', 'LineWidth', 2);  % blue dashed
plot(x, y3, 'y', 'LineWidth', 2);   % yellow solid
plot(x, y4, 'g--', 'LineWidth', 2); % green dashed
hold off


xlabel('x(radians)');
ylabel ('y')
title('Sine and Cosine Waves');

grid on

