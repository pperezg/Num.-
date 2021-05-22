function [funciones cond dato_y] = splines(datos, dato_x)
datos = sortrows(datos);
[m, n] = size(datos);
ys = datos(:,2);
xs = datos(:,1);
funciones = [];
syms x;
dato_y=0;

for i=1:m-1
    if i==1
        q = (ys(2)-ys(1))/(xs(2)-xs(1));
        b = ys(1)-q*xs(1);
        funciones = [q*x+b];
    else
        dif_ant = diff(funciones(i-1),x);
        A = [xs(i)^2 xs(i) 1; xs(i+1)^2 xs(i+1) 1; 2*xs(i) 1 0];
        b = [ys(i); ys(i+1); subs(dif_ant,i)];
        X = A\b;
        funciones = [funciones; poly2sym(X.')];
    end
end

minm = min(xs);
maxm = max(xs);
dato_y = 0;
cond = '';

if dato_x<minm | dato_x>maxm
    cond = 'No se pudo realizar la interpolación ya que el x buscado no se encuentra en el intervalo de los datos.';
else
    cond = 'Se realizó la interpolación con éxito';
    for j=1:m-1
        if  xs(j)<dato_x && dato_x<xs(j+1)
           fn = funciones(j);
           dato_y = subs(fn,dato_x);
        end
    end
end
    
end
