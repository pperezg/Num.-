function [X, cond, count, error]=raices(fn,x0,tol,n)
syms x
f=symfun(str2sym(fn),x);
df=diff(f,x);
d2f=diff(df,x);
fa=f(x0);
error=tol+1; 
count=0;

while error>tol && count<n && fa~=0
  X=eval(x0-fa*df(x0)/((df(x0))^2-fa*d2f(x0)));
  error=abs(X-x0);
  count=count+1;
  x0=X;
  fa=f(X);
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