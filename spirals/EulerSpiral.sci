// x = C(t), y = S(t)
//clear; clc; clf;
t_max = 5;         
n_points = 1000;   
t = linspace(-t_max, t_max, n_points); 

function y = fresnelC(t)
    y = zeros(t);
    for i = 1:length(t)
        y(i) = integrate('cos(%pi*u^2/2)', 'u', 0, t(i));
    end
endfunction

function y = fresnelS(t)
    y = zeros(t);
    for i = 1:length(t)
        y(i) = integrate('sin(%pi*u^2/2)', 'u', 0, t(i));
    end
endfunction

x = fresnelC(t);
y = fresnelS(t);
plot(x, y, 'b-', 'LineWidth', 2);
title('Euler Spiral (Cornu Spiral)', 'fontsize', 4);
xlabel('C(t) = $\int_0^t \cos(\pi u^2/2) du$', 'fontsize', 3);
ylabel('S(t) = $\int_0^t \sin(\pi u^2/2) du$', 'fontsize', 3);
a = gca();
a.isoview = "on"; 
a.grid = [1, 1];  
a.data_bounds = [min(x)-0.1, min(y)-0.1; max(x)+0.1, max(y)+0.1];
plot(fresnelC(0), fresnelS(0), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
xstring(fresnelC(t_max/2), fresnelS(t_max/2), 't → +∞');
xstring(fresnelC(-t_max/2), fresnelS(-t_max/2), 't → -∞');
asymptote_x = [0.5, -0.5];
asymptote_y = [0.5, -0.5];
plot(asymptote_x, asymptote_y, 'kx', 'MarkerSize', 10);
