function [f, cond, valor_y] = vandermonde(datos, valor_x)
[m, ~] = size(datos);
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

valor_y = 0;
cond = '';
xs = datos(:,1);
minm = min(xs);
maxm = max(xs);

if valor_x<minm || valor_x>maxm
    cond = 'No se pudo realizar la interpolación ya que el x buscado no se encuentra en el intervalo de los datos.';
else
    cond = 'Se realizó la interpolación con éxito';
    valor_y = subs(f, valor_x);
end

end