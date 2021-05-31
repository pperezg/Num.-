function [X, cond, count, L, U] = LU_S(A,b,x_0,n_max)
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
    cond='El sistema esta bien condicionado';
    count = 0;
    L=eye(n);
    U=zeros(n);
    M=A;
    for i=1:n-1
        if count==n_max
             break
        end
        for j=i+1:n
            
            if M(j,i)~=0
                L(j,i)=M(j,i)/M(i,i);
            	M(j,i:n)=M(j,i:n)-(M(j,i)/M(i,i))*M(i,i:n);
                
            end
        end
        U(i,i:n)=M(i,i:n);
        U(i+1,i+1:n)=M(i+1,i+1:n);
        count=count+1;
    end
    U(n,n)=M(n,n);
    l=zeros(n,1);
    J=[L b];
    for i=1:n
        b=J(i,n+1);
        c=0;
        for j=1:i
            c=c+J(i,j)*l(j);
        end
        l(i)=(b-c);
    end
    y=zeros(n,1);
    Y=[U l];
    for i=n:-1:1
        a=Y(i,i);
        b=Y(i,n+1);
        c=0;
        for j=i+1:n
            c=c+Y(i,j)*y(j);
        end
        y(i)=(b-c)/a;
    end
    X=y;
end
end