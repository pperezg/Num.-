function [x_now, cond, count, error] = puntoFijo(f, g, x0, tol, n_max)


count = 1;
x_now = g(x0);
error = abs(x_now-x0);
while error>tol && count<n_max && f(x_now)~=0
    count = count + 1;
    x0 = x_now;  
    x_now = g(x0);
    error = abs(x_now-x0);
end
    if error <= tol
        cond='Tolerancia superada';
    elseif f(x_now)==0
        cond='Raiz encontrada';
        error=0;
    else
        cond='Iteraciones Máximas';
    end
end

% Para obtener los resultados se debe ingresar
% [x iteraciones error] = puntoFijo("f", "g", x0, tolerancia, n_max)