%Nos devuelve la solucion del sistema
function [s] = resolverSist(B, b)

    n = size(B, 1);
    s = 1:n;
    aux = 0;
    
    for i=1:n
        
        aux = 0;
        
        for j=1:i-1
            aux = aux + s(j)*B(i, j);
        end
        
        s(i) = (b(i) - aux)/B(i, i);
        
    end
    
    %La traspuesta
    for i=n:-1:1
        
        aux = 0;
        
        for j=n:-1:i+1
            aux = aux + s(j)*B(j, i);
        end
        
        s(i) = (s(i) - aux)/B(i, i);
        
    end
    
end