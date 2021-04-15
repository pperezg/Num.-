function [X, cond, count, error]=secante(f,x0,x1,tol,n)

f0=f(x0);
f1=f(x1);
error=tol+1; 
count=0;

while error>tol && count<n && f1~=0
  X=x1-f1*(x1-x0)/(f1-f0);
  error=abs(X-x1);
  count=count+1; 
  x0=x1;
  f0=f1;
  x1=X;
  f1=f(X);
end
if error <= tol
    cond='Tolerancia superada';
elseif f1==0
    cond='Raiz encontrada';
    error=0;
else
    cond='Iteraciones Máximas';
end
end