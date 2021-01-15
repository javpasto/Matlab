disp('Resoluci�n de un sistema lineal mediante el m�todo de relajaci�n por puntos');
n = input('Dimensi�n de la matriz: ');
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

w = input('Introduce el par�metro de relajaci�n: ');
maxIter = input('Introduce el n�mero m�ximo de iteraciones: ');
precision = input('Introduce la precisi�n para el test de parada: ');

u = metodoRelajacion(A, b, w, maxIter, precision);