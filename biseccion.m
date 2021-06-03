function [X, cond, count, error] = biseccion(fn, x0, x1, tol, n_max)

if fn(x0)==0
    X=x_0;
    cond='Raiz encontrada';
    count = 0;
    error=0;
elseif fn(x1)==0
    X=x_1;
    cond='Raiz encontrada';
    count = 0;
    error=0;
elseif fn(x0)*fn(x1)>0
    count = 0;
    X='No Aplica';
    error='No Aplica';
    cond='No hay raiz en el intervalo';
else
    xm = (x0+x1)/2;
    count = 1;
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
        X=xm;
        cond='Raiz encontrada';
    elseif error<=tol
        X=[x0 x1];
        cond='Tolerancia superada';
    else
        X=[x0 x1];
        cond='Iteraciones Máximas';
    end
end    
end
