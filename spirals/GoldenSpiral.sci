// clf(); 
phi = (1 + sqrt(5))/2; 
b = log(phi)/(%pi/2);  
theta = linspace(0, 6*%pi, 1000); 
r = exp(b*theta);      
x = r .* cos(theta);   
y = r .* sin(theta);
plot(x, y, 'r-', 'LineWidth', 2);
title("Golden Spiral", "fontsize", 3);
axis equal;
grid on;
xlabel("X");
ylabel("Y");
hold on;
a = 1; 
rectangles = [1, 0, 0, 1;  % Rotation matrices for each quarter turn
              0, -1, 1, 0;
              -1, 0, 0, -1;
              0, 1, -1, 0];

for k = 1:12  
    if modulo(k,2) == 1
        w = a;
        h = a*phi;
    else
        w = a*phi;
        h = a;
    end
    rect_x = [0, w, w, 0, 0];
    rect_y = [0, 0, h, h, 0];
    M = rectangles(modulo(k-1,4)+1,:);
    M = matrix(M, 2, 2);
    rotated = M * [rect_x; rect_y];
    plot(rotated(1,:), rotated(2,:), 'b-', 'LineWidth', 1);
    a = a*phi;
end

a = 1;
for k = 1:12
    theta_arc = linspace((k-1)*%pi/2, k*%pi/2, 50);
    r_arc = a * phi^(theta_arc/(%pi/2));
    quadrant = modulo(k-1,4);
    if quadrant == 0
        x_arc = r_arc .* cos(theta_arc);
        y_arc = r_arc .* sin(theta_arc);
    elseif quadrant == 1
        x_arc = -r_arc .* sin(theta_arc);
        y_arc = r_arc .* cos(theta_arc);
    elseif quadrant == 2
        x_arc = -r_arc .* cos(theta_arc);
        y_arc = -r_arc .* sin(theta_arc);
    else
        x_arc = r_arc .* sin(theta_arc);
        y_arc = -r_arc .* cos(theta_arc);
    end
    plot(x_arc, y_arc, 'g-', 'LineWidth', 1.5);
    a = a * phi;
end

hold off;
legend(['Golden Spiral'; 'Golden Rectangles'; 'Construction Arcs']);
