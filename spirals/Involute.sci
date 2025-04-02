//clear;
//clc;
function [x, y] = involute(R, theta)
    x = R * (cos(theta) + theta .* sin(theta));
    y = R * (sin(theta) - theta .* cos(theta));
endfunction
R = 1;
theta_max = 6*%pi;
n_points = 1000;
theta = linspace(0, theta_max, n_points);
[x, y] = involute(R, theta);
scf();
plot(x, y, 'b-', 'LineWidth', 2);
t = linspace(0, 2*%pi, 100);
x_circle = R * cos(t);
y_circle = R * sin(t);
plot(x_circle, y_circle, 'r--', 'LineWidth', 1);
xtitle('Involute of a Circle', 'x', 'y');
legend(['Involute'; 'Base Circle']);
xgrid();
axis equal;
