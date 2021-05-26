function [X, cond, count, Tj, Cj,r] = gauss_seidel(A,b,x_0,n_max, tol)

[m, n] = size(A);
Tj=zeros(size(A));
Cj=zeros(size(b));
r=0;
if m>n
    X = x_0;
    count = 0;
    cond='Sistema no compatible';
elseif m<n
    X = x_0;
    count = 0;
    cond='El sistema tiene infinitas soluciones';
else
    
    count = 0;
    
    U = -triu(A,1);
    L = -tril(A,-1);
    aux_d = diag(A).';
    D = diag(aux_d);
    
    if det(D-L)==0
        X = x_0;
        cond='La matriz D-L no es invertible';
    else
        Tj = inv(D-L)*(U);
        Cj = inv(D-L)*b;
        xn = x_0;
        Err=1000;
        while count<n_max && Err>tol
            xi = Tj*xn + Cj;
            Err=norm(xn-xi);
            xn=xi;
            count = count + 1;            
        end
        if Err <= tol
            cond = 'Se obtuvo una respuesta para el sistema de ecuaciones.';
        else
            cond = 'Iteraciones Máximas Alcanzadas';
        end
        X = xn;
        r=max(abs(eig(Tj)));
    end
end
end