function [x0 x1 count] = biseccion(f, x0, x1, tol, n_max)
syms x
fn = symfun(str2sym(f),x);

if fn(x0)==0
    count = 0;
    disp("X0 es raiz.")
elseif fn(x1)==1
    count = 0;
    disp("X0 es raiz.") 
elseif fn(x0)*fn(x1)>0
    count = 0;
    disp("No hay raiz.")
else
    xm = (x0+x1)/2;
    count = 0;
    error = tol+1;
    while count<n_max && error>tol && fn(xm)~= 0
        if fn(x0)*fn(xm)<0
            x1 = xm;
        else
            x0 = xm;
        end
        xm = (x0+x1)/2;
        error = abs(x1-x0);
        count=count+1;
    end
    if fn(xm)==0
        disp(xm + " es raiz.")
    elseif error<=tol
        disp(xm + "se aproxima a raiz.")
    else
        disp("Se llegó a la cantidad máxima de iteraciones.")
    end
end    
end

% Para obtener los resultados se debe ingresarse
% [a b count] = biseccion("funcion", izq_intervalo, der_intervalo, tolerancia, n_max)