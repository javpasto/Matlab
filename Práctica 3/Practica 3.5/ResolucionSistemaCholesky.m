%Resolución mediante el método de factorización Cholesky
n = input('Dimensión de la matriz: ');
A = zeros(n, n);
for i=1:n
    for j=1:n
        X = ['Introduce el elemento A(', num2str(i), ',', num2str(j), '): '];
        A(i,j) = input(X);
    end
end

b = zeros(1, n);
for i = 1:n
    X = ['Introduce el elemento b(', num2str(i),'): '];
    b(i) = input(X);
end

B = factorizacionCholesky(A);

disp('La matriz B es: ');
for i = 1:n
    for j = 1:n
        fprintf('%d ', B(i,j));
    end
    fprintf('\n');
end

disp('La matriz B traspuesta es: ');
for i = 1:n
    for j = 1:n
        fprintf('%d ', B(j,i));
    end

    fprintf('\n');
end

disp('El resultado es:');
s = resolverSist(B, b);
disp(s);

while (true)    
        op = input('¿Resolver sistema con otro vector b? (0 sí, 1 no): ');   
        if (op == 1)
            break;            
        end
        for i=1:n
            X = ['Introduce el elemento b(', num2str(i),'): '];
            b(i) = input(X);
        end
        s = resolverSist(B, b);
        disp('El resultado es:');
        disp(s);
end

