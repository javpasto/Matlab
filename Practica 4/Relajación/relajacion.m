disp('Resolución de un sistema lineal mediante el método de relajación por puntos');
n = input('Dimensión de la matriz: ');
A = zeros(n, n);
for i = 1:n
    for j = 1:n
        X = ['Introduce el elemento A(', num2str(i), ',', num2str(j), '): '];
        A(i,j) = input(X);
    end
end

b = zeros(1, n);
for i = 1:n
    X = ['Introduce el elemento b(', num2str(i),'): '];
    b(i) = input(X);
end

w = input('Introduce el parámetro de relajación: ');
maxIter = input('Introduce el número máximo de iteraciones: ');
precision = input('Introduce la precisión para el test de parada: ');

u = metodoRelajacion(A, b, w, maxIter, precision);