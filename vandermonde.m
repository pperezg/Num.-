function [X f] = vandermonde(datos)
[m, n] = size(datos);
b = datos(:,2);
A = zeros(m);
for i=1:m
    x = datos(i,1);
    for j=m-1:-1:0
        A(i,m-j)= x^j;
    end
end
X = A\b; % coeficientes
f = poly2sym(X.'); % funcion
end
