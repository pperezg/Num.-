function [x0 x1 count] = reglaFalsa(f, x0, x1, tol, n_max)
syms x
fn = symfun(str2sym(f),x);

if fn(x0)==0
    count = 0;
    disp("X0 es raiz.")
elseif fn(x1)==0
    count = 0;
    disp("X0 es raiz.") 
elseif fn(x0)*fn(x1)>0
    count = 0;
    disp("No hay raiz.")
else
    xm = ((fn(x1)*x0)-(fn(x0)*x1))/(fn(x1)-fn(x0));
    count = 0;
    error = tol+1;
    while count<n_max && error>tol && fn(xm)~= 0
        if fn(x0)*fn(xm)<0
            x1 = xm;
        else
            x0 = xm;
        end
        p0 = xm;
        xm = ((fn(x1)*x0)-(fn(x0)*x1))/(fn(x1)-fn(x0));
        error = abs(xm-p0);
        count=count+1;
    end
    if fn(xm)==0
        xm1=eval(xm);
        disp(xm1 + " es raiz.")
    elseif error<=tol
        xm1=eval(xm);
        disp(xm1 + " se acerca a raiz.")
    else
        disp("Se llegó a la cantidad máxima de iteraciones.")
    end
end    
end

% Para obtener los resultados se debe ingresarse
% [a b count] = reglaFalsa("funcion", izq_intervalo, der_intervalo, tolerancia, n_max)