function [y,iter,err]=secante(fn,x0,x1,tol,n)
syms x
f=symfun(str2sym(fn),x);
f0=f(x0);
f1=f(x1);
E=tol+1; 
cont=0;

while E>tol && cont<n
  xa=x1-f1*(x1-x0)/(f1-f0);
  fa=f(xa);
  E=abs(xa-x1);
  cont=cont+1; 
  x0=x1;
  f0=f1;
  x1=xa;
  f1=fa;
end

%Entrega de resultados
y=eval(xa);
iter=cont;
err=E;
end