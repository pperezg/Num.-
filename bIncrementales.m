function [X, cond, count] = bIncrementales(f, x_0, step, n_max)

a=max(length(num2str(step)),length(num2str(x_0)))+1;
if f(x_0)==0
    X=x_0;
    cond='Raiz encontrada en x_0';
else
 	x = x_0 + step;
    count = 0;  
    while f(x_0)*f(x)>0 && count<n_max
        count = count+1;
        x_0 = x;
        x = x_0 + step;
    end
    x_0=round(x_0,a);
    x=round(x,a);
    if f(x)==0
        X=x;
        cond='Raiz encontrada';
    elseif f(x)*f(x_0)<0
        X=[x_0 x];
        cond='Intervalo Encontrado';
    else
        X=[x_0 x];
        cond='Iteraciones Máximas';
    end
end