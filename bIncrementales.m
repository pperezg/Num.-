function [x_prev x_now count] = bIncrementales(f, x0, step, n_max)

syms x
fn = symfun(str2sym(f),x);

x_prev = x0;
f_prev = fn(x_prev);
x_now = x_prev + step;
f_now = fn(x_now);
count = 0;

while f_prev*f_now>0 && count<n_max
    count = count+1;
    x_prev = x_now;
    f_prev = f_now;
    x_now = x_now+step;
    f_now = fn(x_now);
end
end 

% Para obtener los resultados se debe ingresarse
% [a b count] = bIncrementales("funcion", valor inicial, paso, itracn_max)