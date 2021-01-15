%Resolución mediante el método de eliminación gaussiana
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

[u, A, p] = eliminacionGaussiana(A, b);

disp('La matriz es: ');
for i = 1:n
    for j = 1:n
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
        u = elimGauss(A, b, p);
        disp('El resultado es:');
        disp(u);
end