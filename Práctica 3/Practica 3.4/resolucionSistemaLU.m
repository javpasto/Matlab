%Resolución mediante el método de factorización LU
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

[u, A] = factLU(A, b);

disp('La matriz L es: ');
for i = 1:n
    for j = 1:i-1
        fprintf('%d ', A(i,j));
    end
    fprintf('1 ');
    for j = i+1:n
        fprintf('0 ');
    end
    fprintf('\n');
end

disp('La matriz U es: ');
for i = 1:n
    for j = 1:i-1
        fprintf('0 ');
    end
    for j = i:n
        fprintf('%d ', A(i,j));
    end
    fprintf('\n');
end

disp('El resultado es:');
disp(u);

while (true)    
        op = input('¿Resolver sistema con otro vector b? (0 sí, 1 no): ');   
        if (op == 1)
            break;            
        end
        for i=1:n
            X = ['Introduce el elemento b(', num2str(i),'): '];
            b(i) = input(X);
        end
        u = factLU(A, b);
        disp('El resultado es:');
        disp(u);
end