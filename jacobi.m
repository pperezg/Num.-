function [X, cond, count] = jacobi(A,b,x_0,n_max)

[m, n] = size(A);

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
    
    if det(D)==0
        X = x_0;
        cond='La matriz D no es invertible';
    else
        Tj = inv(D)*(L+U);
        Cj = inv(D)*b;
        xn = x_0;
        
        while count<n_max
            xn = Tj*xn + Cj;
            count = count + 1;            
        end
        cond = 'Se obtuvo una respuesta para el sistema de ecuaciones.';
        X = xn;
    end
end
end