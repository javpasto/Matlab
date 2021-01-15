%Programar el método de la factorización LU de forma que se puedan resolver
% varios sistemas con la misma matriz. 
%Comparar con el comando lu de Matlab.

% Au=b con A simétrica definida positiva, se puede factorizar como A=BB^T
% con B matriz triangular inferior.


% Nos devuelve la matriz B factorizada
function [B] = factorizacionCholesky(A)
   
    n = size(A, 1);
    B = zeros(n, n);
    aux=0;
    
    for i=1:n
       
        aux=0;
        
        %Sumamos los valores anteriores a nuestro B(i, i)
        for j=1:i-1
            
            aux = aux + B(i, j)*B(i, j);
            
        end
        
        % Comprobamos en la diagonal
        if (A(i, i) - aux <= 0)
                disp("La matriz A no admite factorización Cholesky")
        end
            
        B(i, i) = sqrt(A(i, i) - aux);
        
        for j=i+1:n
            
            aux = 0;
            
            for k=1:i-1
                
                aux = aux - B(i, k)*B(j, k);
                
            end
            
            B(j, i) = (A(j, i) + aux) / B(i, i);
            
        end
    end
    
end