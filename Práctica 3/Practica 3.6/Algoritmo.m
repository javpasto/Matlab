%Escribir una función que implemente el algoritmo para la resolución de
%sistemas tridiagonales descrito en el ejercicio 7 de la Hoja 3 de
%problemas.

function [x] = resolucion(A, d)
    
    n = size(A, 1);
    m = 1:n;
    g = 1;n;
    x = 1:n;
    
    m(1) = A(1, 1);
    g(1) = d(1)/m(1);
    
    for i=2:n
       m(i) = A(i, i) - (A(i - 1, i)/m(i - 1))*A(i, i - 1);
       g(i) = (d(i) - g(i - 1)*A(i, i - 1))/m(i);
    end
    
    x(n) = g(n);
    
    for i=n-1:-1:1
        x(i) = g(i) - (A(i - 1, i)/m(i))*x(i + 1);
    end

end