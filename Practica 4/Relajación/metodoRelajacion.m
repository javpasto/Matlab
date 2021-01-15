function u = metodoRelajacion(A, b, w, maxIter, precision)
    b = b(:);
    cont = 1;
    n = size(A, 1);
    r = zeros(1, n);
    d = zeros(1, n);
    u = b;
    factor = precision*norm(b);
    if (any(diag(A)) == 0)
        disp('Alg�n elemento de la diagonal es nulo.');
        return;
    end
    while (cont < maxIter)
        for i = 1:n
            r(i) = b(i) - A(i, 1:i-1)*u(1:i-1) - A(i, i:n)*u(i:n);
            d(i) = w * (r(i)/A(i,i));
            u(i) = u(i) + d(i);
        end
        puntos(cont) = norm(r)/norm(b);
        if (factor > norm(r))
            X = ['Se ha alcanzado la condici�n de parada en la iteraci�n ', num2str(cont), ' La soluci�n es: '];
            disp(X);
            disp(u);
            break;
        end
        cont = cont + 1;
    end
    if (cont == maxIter)
        disp('Se ha alcanzado el m�ximo n�mero de iteraciones posibles.');
        disp(u);
    end
    plot(puntos);
end