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

disp('La matriz es: ');
for i = 1:n
    for j = 1:n
        fprintf('%d ', A(i,j));
    end
    fprintf('\n');
end

X = 'Introduce las iteraciones maximas: ';
i = input(X);

X = 'Introduce la precisión: ';
p = input(X);

[u, termina] = metodoJacobi(A, b, i, p);

if (termina) 
    disp('El resultado es: ');
    for i = 1:n
        disp(u(i,i));
    end
end
if (~termina)
    disp('No se ha llegado a la precisión requerida.');
end
    