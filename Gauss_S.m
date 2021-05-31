function [X, cond, count, op] = Gauss_S(A,b,x_0,n_max)

[m, n] = size(A);
op={''};
if m>n
    X = x_0;
    count = 0;
    cond='Sistema no compatible';
elseif m<n
    X = x_0;
    count = 0;
    cond='El sistema tiene infinitas soluciones';
else
    count=0;
    M=[A b];
    for i=1:n-1
        if count==n_max
            break
        end
        for j=i+1:n
              count=count+1;
              if M(j,i)~=0
                  mul=(M(j,i)/M(i,i));
                  M(j,i:n+1)=M(j,i:n+1)-mul*M(i,i:n+1);
                  if sign(-1*mul) == 1
                      op{count,1} = sprintf('F%g=F%g+%gF%g',j,j,-1*mul,i);
                  else
                       op{count,1} = sprintf('F%g=F%g%gF%g',j,j,-1*mul,i);
                  end
              else
                  continue
              end
              op{count,2} = M;
              
        end
    end
    x=zeros(n,1);
    for i=n:-1:1
        a=M(i,i);
        b=M(i,n+1);
        c=0;
        for j=i+1:n
            c=c+M(i,j)*x(j);
        end
        x(i)=(b-c)/a;
    end
    X=x;
    cond = 'Se obtuvo una respuesta para el sistema de ecuaciones.';
end
end


