function [u,A,p] = eliminacionGaussiana(A,b,p)
    n = size(A,1);
    %Si se ejecuta por primera vez, hay que calcular el vector de punteros
    %de pivote
    if (nargin==2)
        p=[1:n];
        for i=1:n-1
            %v valor maximo de la columna, piv posicion
            [v,piv] = max(abs(A(p(i:n),i)));
            pivote = piv + i - 1;
            if (v==0)
                disp("La matriz A no es inversible");
                return;
            end
            
            %Intercambio
            p([i,pivote]) = p([pivote,i]);
        
            %Eliminamos
            x = A(p(i+1:n),i) / A(p(i), i);
            A(p(i+1:n), i:n) =  A(p(i+1:n), i:n) - A(p(i), i:n).*x;
            A(p(i+1:n),i) = x;
        end
        
        if (A(p(n),n)==0)
            disp("La matriz A no es inversible");
                return;
        end
    end
    
    w = sist_Lw(A,b,p);
    u = sist_Uu(A,w,p);
end

%Lw=Pb
function w = sist_Lw(A,b,p)
    n = size(A,1);
    for i=1:n
       w(i) = b(p(i));
       for j=1:i-1
           w(i) = w(i) - A(p(i),j)*w(j);
       end
    end
end

%Uu=w
function u = sist_Uu(A,w,p)
    n = size(A,1);
    for i=n:-1:1
        aux = 0;
        for j=i+1:n
            aux = aux + A(p(i),j)*u(j);
        end
        u(i) = (w(i) - aux)/A(p(i),i);
    end
end