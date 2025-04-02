// clear; clf;
n = 20;
phi = (1 + sqrt(5))/2;
fib = zeros(1,n);
fib(1) = 1;
fib(2) = 1;
for k=3:n
    fib(k) = fib(k-1) + fib(k-2);
end
theta = 2*%pi*(0:n-1)/phi; 
r = fib;               
x = r .* cos(theta);
y = r .* sin(theta);
plot(x, y, '-o');
a = gca();
a.isoview = "on";
a.data_bounds = [min(x)-1, min(y)-1; max(x)+1, max(y)+1];
title("Fibonacci Spiral", "fontsize", 3);
xlabel("x");
ylabel("y");
for k=1:n-1
    xrect(0, 0, fib(k), fib(k));
    if modulo(k,4) == 1 then
        rotate(a.children(1), [0;0], -90*(k-1)/360*2*%pi);
    elseif modulo(k,4) == 2 then
        rotate(a.children(1), [0;0], -180*(k-2)/360*2*%pi);
    elseif modulo(k,4) == 3 then
        rotate(a.children(1), [0;0], -270*(k-3)/360*2*%pi);
    end
end
