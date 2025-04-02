function nielsen_spiral(n, multiplier)
    clf();
    f = gcf();
    f.background = color("black");
    a = gca();
    a.box = "off";
    a.axes_visible = ["off" "off" "off"];
    t = linspace(0, 2*%pi, n+1);
    t = t(1:$-1);  
    x = cos(t);
    y = sin(t);
    for i = 1:n
        start_x = x(i);
        start_y = y(i);
        end_idx = modulo(i * multiplier - 1, n) + 1;
        end_x = x(end_idx);
        end_y = y(end_idx);
        plot([start_x end_x], [start_y end_y], ...
             'color', [i/n 1-i/n 0.5], 'thickness', 1);
    end
    a.isoview = "on";
    title("Nielsen''s Spiral (n="+string(n)+", multiplier="+string(multiplier)+")", ...
          "color", "white");
end
n = 200;          
multiplier = 2;   
nielsen_spiral(n, multiplier);
