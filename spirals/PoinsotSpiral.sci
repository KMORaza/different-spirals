function plot_poinsot_spirals()
t = linspace(0, 10*%pi, 1000);
a = 1;
b = 0.1;
r1 = a * exp(b * t);
r2 = a * exp(-b * t);
x1 = r1 .* cos(t);
y1 = r1 .* sin(t);
x2 = r2 .* cos(t);
y2 = r2 .* sin(t);
clf();
plot(x1, y1, 'b-', 'LineWidth', 2);
plot(x2, y2, 'r-', 'LineWidth', 2);
title("Poinsot''s Spirals");
xlabel("X");
ylabel("Y");
legend(["Outer Spiral", "Inner Spiral"]);
xgrid();
set(gca(), "isoview", "on");
xlim([-10 10]);
ylim([-10 10]);
end
plot_poinsot_spirals();
