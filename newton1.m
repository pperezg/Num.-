function [y iter err]=newton1(f,df,x0,tol,n)
    syms x
    fn=symfun(str2sym(f),x);
    fd=symfun(str2sym(df),x);
    xa=x0;
    fa=fn(xa);
    E=tol+1;
    cont=0;
    while E>tol && cont<n
        xah=xa-fa/(fd(xa));
        fah=fn(xah);
        E=abs(xah-xa);
        cont=cont+1;
        xa=xah;
        fa=fah;
    end
    y=eval(xah)
    iter=cont
    err=E
end
