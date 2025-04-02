// r² = a²/θ)
// clear; clc; clf;

a = 2;              
theta_min = 0.1;    
theta_max = 20*%pi; 
n_points = 2000;    
theta = exp(linspace(log(theta_min), log(theta_max), n_points));
r_pos = a ./ sqrt(theta);   
r_neg = -a ./ sqrt(theta); 
x_pos = r_pos .* cos(theta);
y_pos = r_pos .* sin(theta);
x_neg = r_neg .* cos(theta);
y_neg = r_neg .* sin(theta);
f = scf(0);
f.background = color("white");
f.figure_name = "Lituus Spiral (r²θ = a²)";
plot(x_pos, y_pos, 'color', [0 0.4 0.8], 'LineWidth', 3);  
plot(x_neg, y_neg, 'color', [0.8 0.2 0.2], 'LineWidth', 3); 
title("$\Large\textbf{Lituus Spiral}\ (r^2\theta = a^2)$", "fontsize", 5);
xlabel("x", "fontsize", 4);
ylabel("y", "fontsize", 4);
ax = gca();
ax.isoview = "on";
ax.grid = [1, 1];
ax.grid_style = [7,7];
ax.font_size = 3;
ax.data_bounds = [-5,-5;5,5];  
plot(0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
xstring(2.5, 3.8, "$\Large r^2 = \frac{a^2}{\theta}$");
e = gce();
e.font_size = 5;
e.fill_mode = "on";

for angle = [%pi/2, %pi, 3*%pi/2, 2*%pi]
    r_mark = a/sqrt(angle);
    plot(r_mark*cos(angle), r_mark*sin(angle), 'ko', 'MarkerSize', 5);
    xstring(r_mark*cos(angle)*1.1, r_mark*sin(angle)*1.1, ...
            sprintf("θ=%.0fπ/%.0f", angle/%pi*((angle/%pi)>1)+1, (angle/%pi<=1)*2+1));
end
