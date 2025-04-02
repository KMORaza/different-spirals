function fraser_spiral(n_circles, n_points, twist_factor)
    f = figure();
    set(f, "background", 8);
    r_max = 0.45;          
    r_step = r_max / n_circles;  
    theta = linspace(0, 2*%pi, n_points);
    for i = 1:n_circles
        r = r_step * i;
        twist = twist_factor * (r/r_max) * theta;
        x = r * cos(theta + twist);
        y = r * sin(theta + twist);
        if modulo(i, 2) == 0
            plot(x, y, 'k-', 'LineWidth', 2);  
        else
            plot(x, y, 'r-', 'LineWidth', 2);  
        end
    end
    a = gca();
    a.isoview = "on";  
    a.box = "off";    
    a.axes_visible = "off";
    xlim([-0.5 0.5]);
    ylim([-0.5 0.5]);
    title("Fraser''s Spiral Illusion");
end
fraser_spiral(20, 200, 20);
