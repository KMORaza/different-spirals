// r = a/θ
// clear; clc; clf;
a = 5;           
theta_min = 0.1;    
theta_max = 10*%pi; 
n_points = 1000;    
theta = linspace(theta_min, theta_max, n_points);
r = a ./ theta;  
x = r .* cos(theta);
y = r .* sin(theta);
plot(x, y, 'b-', 'LineWidth', 2);
title('Hyperbolic Spiral (Reciprocal Spiral)', 'fontsize', 4);
xlabel('x-axis', 'fontsize', 3);
ylabel('y-axis', 'fontsize', 3);
a = gca();
a.isoview = "on";  
a.grid = [1, 1];  
plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');  
xstring(x(100), y(100), sprintf('r = %.1f/θ', a), 0);  
t = linspace(0, 2*%pi, 100);
for radius = [1 2 3]
    plot(radius*cos(t), radius*sin(t), 'k:', 'LineWidth', 0.5);
end
