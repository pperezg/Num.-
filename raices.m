function [y,iter,err]=raices(fn,dfn,d2fn,x0,tol,n)
syms x
f=symfun(str2sym(fn),x);
df=symfun(str2sym(dfn),x);
d2f=symfun(str2sym(d2fn),x);
xa=x0;
fa=f(xa);
E=tol+1; 
cont=0;

while E>tol && cont<n
  xah=xa-fa*df(xa)/((df(xa))^2-fa*d2f(xa));
  fah=f(xah);
  E=abs(xah-xa);
  cont=cont+1;
  xa=xah;
  fa=fah;
end

%Entrega de resultados
y=eval(xah);
iter=cont;
err=E;
end 