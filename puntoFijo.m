function [x_now count error] = puntoFijo(f, g, x0, tol, n_max)
syms x
fn = symfun(str2sym(f),x);
gn = symfun(str2sym(g),x);

x_prev = x0;
error = tol+1;
count = 0;

while error>tol && count<n_max
    x_now = eval(gn(x_prev));
    error = abs(x_now-x_prev);
    count = count + 1;
    x_prev = x_now;  
end
end

% Para obtener los resultados se debe ingresar
% [x iteraciones error] = puntoFijo("f", "g", x0, tolerancia, n_max)