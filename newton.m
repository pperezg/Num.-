function [X, cond, count, error]=newton(f,x0,tol,n)
    error=tol+1;
    
    syms x
    fn=symfun(str2sym(f),x);
    fd=diff(fn,x);
    fa=fn(x0);
    
    count=0;
    while error>tol && count<n && fa~=0
        X=eval(x0-fa/(fd(x0)));
        fnew=fn(X);
        error=abs(X-x0);
        count=count+1;
        x0=X;
        fa=fnew;
    end
    if error <= tol
        cond='Tolerancia superada';
    elseif fa==0
        cond='Raiz encontrada';
        error=0;
    else
        cond='Iteraciones Máximas';
    end
end