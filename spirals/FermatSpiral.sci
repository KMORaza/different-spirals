// r² = a²θ
//clear; clc; clf;
a = 1;               
theta_max = 6*%pi;    
n_points = 1000;      
theta_pos = linspace(0, theta_max, n_points);
theta_neg = linspace(0, -theta_max, n_points);
// r = ±a√θ
r_pos = a * sqrt(theta_pos);
r_neg = -a * sqrt(-theta_neg); 
x_pos = r_pos .* cos(theta_pos);
y_pos = r_pos .* sin(theta_pos);
x_neg = r_neg .* cos(theta_neg);
y_neg = r_neg .* sin(theta_neg);
plot(x_pos, y_pos, 'r-', 'LineWidth', 2);  
plot(x_neg, y_neg, 'b-', 'LineWidth', 2);  
title('Fermat''s Spiral (r² = a²θ)', 'fontsize', 4);
xlabel('x', 'fontsize', 3);
ylabel('y', 'fontsize', 3);
legend(['Positive branch (r = +a√θ)'; 'Negative branch (r = -a√θ)'], 1);
gca().isoview = "on";
gca().data_bounds = [-5, -5; 5, 5];  
gca().grid = [1, 1];              
plot(0, 0, 'ko', 'MarkerSize', 6, 'MarkerFaceColor', 'k');
xstring(3.5, 4, '$\mathbf{r^2 = a^2 \theta}$');
set(gce(), 'fontsize', 4, 'fill_mode', 'on');
