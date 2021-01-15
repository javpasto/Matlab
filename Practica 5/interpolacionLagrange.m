%Polinomio de interpolación de Lagrange de una función por puntos dados
%mediante la fórmula de Newton

%Dd lista de diferencias divididas
%puntos lista puntos
%Pi es el productorio de los (x-x_i)
%x es el nuevo punto a interpolar
%fx el valor que toma la funcion en el

%La función solo interpola un punto apartir del resultado anterior
%La primera llamada debe de ser con dos argunetos: punto y valor
function [P,Dd, puntos, Pi] = interpolacion(x, fx, P, Dd, puntos, Pi)

	%Interpola un unico punto
	if nargin<3
		P = [fx];
		Dd = [fx];
		puntos = [x];
		Pi = [1  -x];
		return;
    end
    
	%Comprueba que hay la misma cantidad de diferencias finitas que de puntos
	if size(Dd)~=size(puntos)
		error('interpolacion: los datos no cuadran');
    end
    
	Dd = [fx  Dd];
	puntos = [x  puntos];
	n = size(Dd);
	n = n(2);
    
	for i=2:n
		%Dd(i-1) es la diferencia finita de x_ultimo a x_i-1
		%Dd(i) es la diferencia finita de x_penultimo a x_i
        %Con x_ultimo el nuevo punto y x_penultimo el anterior punto interpolado:
		Dd(i)=(Dd(i-1)-Dd(i))/(x-puntos(i));
    end
    
	P = [0  P] + Dd(n)*Pi;
	Pi = [Pi  0]-x*[0  Pi];
    
end