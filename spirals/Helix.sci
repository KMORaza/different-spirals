//clf();
//clc();
radius = 2;
pitch = 1;
n_turns = 3;
n_points = 100;
total_points = n_turns * n_points;
theta = linspace(0, 2*%pi*n_turns, total_points);
z = linspace(0, pitch*n_turns, total_points);
x = radius * cos(theta);
y = radius * sin(theta);
f = scf(100001);
f.visible = "on";
f.figure_name = "3D Helix Animation";
a = gca();
a.rotation_angles = [45, 45];
a.box = "on";
a.grid = [1 1 1];
a.labels_font_size = 2;
a.title.text = "3D Helix";
a.x_label.text = "X-axis";
a.y_label.text = "Y-axis";
a.z_label.text = "Z-axis";
x_margin = radius + 0.5;
y_margin = radius + 0.5;
z_margin = pitch*n_turns + 0.5;
a.data_bounds = [-x_margin, -y_margin, 0; x_margin, y_margin, z_margin];
realtimeinit(0.1);
for i = 1:total_points
    clf();
    f = scf(100001);
    a = gca();
    a.rotation_angles = [45, 45];
    a.box = "on";
    a.grid = [1 1 1];
    a.labels_font_size = 2;
    a.title.text = "3D Helix";
    a.x_label.text = "X-axis";
    a.y_label.text = "Y-axis";
    a.z_label.text = "Z-axis";
    a.data_bounds = [-x_margin, -y_margin, 0; x_margin, y_margin, z_margin];
    param3d(x(1:i), y(1:i), z(1:i));
    realtime(i);
end
if length(x) ~= length(z) then
    disp("Error: x and z vectors have different lengths");
else
    plot3d(x, y, list(z, zeros(1,length(z))));
end
disp("Scilab version: "+getversion());
