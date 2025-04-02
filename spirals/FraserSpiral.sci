function fraser_spiral(n_circles, n_segments)
    clf();
    f = gcf();
    f.background = color("white");
    a = gca();
    a.box = "off";
    a.axes_visible = ["off" "off" "off"];
    r_max = 1.0;         
    twist_angle = %pi/6;  
    for r = linspace(0.1, r_max, n_circles)
        theta = linspace(0, 2*%pi, n_segments);
        x = r * cos(theta);
        y = r * sin(theta);
        for i = 1:length(theta)
            if modulo(i, 2) == 0
                x_seg = [x(i), x(i) + 0.05*r*cos(theta(i) + twist_angle)];
                y_seg = [y(i), y(i) + 0.05*r*sin(theta(i) + twist_angle)];
                plot(x_seg, y_seg, 'k-', 'thickness', 2);
            else
                x_seg = [x(i), x(i) + 0.05*r*cos(theta(i) + twist_angle)];
                y_seg = [y(i), y(i) + 0.05*r*sin(theta(i) + twist_angle)];
                plot(x_seg, y_seg, 'w-', 'thickness', 2);
            end
        end
    end
    for i = -1.2:0.1:1.2
        for j = -1.2:0.1:1.2
            if modulo(floor(i*10) + floor(j*10), 2) == 0
                x_square = [i i+0.1 i+0.1 i i];
                y_square = [j j j+0.1 j+0.1 j];
                plot(x_square, y_square, 'k-', 'thickness', 1);
                xpoly(x_square, y_square, 'lines', 0);
                set(gce(), "background", color("black"));
            end
        end
    end
    a.isoview = "on";
    title("Fraser''s Spiral Illusion", "color", "black");
end
n_circles = 10;   
n_segments = 100; 
fraser_spiral(n_circles, n_segments);
