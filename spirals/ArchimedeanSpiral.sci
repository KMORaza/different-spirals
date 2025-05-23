//clear; clc; clf;
a = 0;     
b = 0.5;  
theta_max = 10*%pi;  
theta = linspace(0, theta_max, 1000);
r = a + b*theta;
x = r .* cos(theta);
y = r .* sin(theta);
plot(x, y, 'b-', 'LineWidth', 2);
title('Archimedean Spiral (r = a + bθ)', 'fontsize', 3);
xlabel('x-axis', 'fontsize', 3);
ylabel('y-axis', 'fontsize', 3);
a=gca();
a.isoview = "on";  
a.data_bounds = [min(x), min(y); max(x), max(y)]; 
grid on;
