function [u,A] = factorizacionLU(A,b)
    n = size(A,1);
    
    %Factorizamos la matriz A
    if(nargout==2)
        for i=1:n
            A(i,i) = A(i,i) - A(i,1:i-1)*A(1:i-1,i);
            
            if(A(i,i)==0)
                disp("La matriz A no admite factorizacion LU");
            end
            
           for j=i+1:n
               A(i,j) = A(i,j) - A(i,1:i-1)*A(1:i-1,j);              
           end
           
           for j=i+1:n
              A(j,i) = (A(j,i) - A(j,1:i-1)*A(1:i-1,i))/A(i,i); 
           end
            
        end
        
    end
    
    w = sist_Lw(A,b);
    u = sist_Uu(A,w);

end

function w = sist_Lw(A,b)
    n = size(A, 1);
    for i = 1:n
        w(i) = b(i);
        for j = 1:i-1
            w(i) = w(i) - A(i, j) * w(j);
        end
    end
end

function u = sist_Uu(A,b)
    n = size(A, 1);
    % Ahora vamos al revés, desde n hasta 1
    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s = s + A(i, j) * u(j);
        end
        u(i) = (b(i) - s) / A(i, i);
    end
end