//clf(); 
//clc(); 
n = 17; 
x = zeros(1, n+1);
y = zeros(1, n+1);
x(1) = 0;
y(1) = 0;
theta = 0;
for k = 1:n
    if k == 1 then
        theta = %pi/2;
        x(k+1) = 0;
        y(k+1) = 1;
    else
        theta = theta - atan(1/sqrt(k-1));
        x(k+1) = x(k) + cos(theta);
        y(k+1) = y(k) + sin(theta);
    end
end
plot(x, y, 'b-', 'LineWidth', 2);
for k = 1:n-1
    xpoly([x(k), x(k+1), x(k+2), x(k)], [y(k), y(k+1), y(k+2), y(k)]);
    gce().foreground = color("gray");
    gce().fill_mode = "off";
end
for k = 1:n
    plot([0 x(k+1)], [0 y(k+1)], 'r--', 'LineWidth', 1);
end
title('Spiral of Theodorus', 'fontsize', 4);
xlabel('X', 'fontsize', 3);
ylabel('Y', 'fontsize', 3);
xgrid(1);
a = gca();
a.isoview = "on";
a.data_bounds = [min(x)-1, min(y)-1; max(x)+1, max(y)+1];
a.font_size = 3;
for k = 1:n
    if k > 1 then
        angle = atan(1/sqrt(k-1))*180/%pi;
        xstring(x(k+1), y(k+1), msprintf('√%d', k));
        gce().font_foreground = color("blue");
    end
end
