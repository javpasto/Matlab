function [u, termina] = jacobi(A, b, i, p, u)
	n = size(A);
    n = n(1);
	if nargin<5
		u = zeros(n, 1);
	end
	termina = 0;
	precision_relativa = p*norm(b);
	for i=1:i
		aux = b-A*u;
		u = u + aux./diag(A);
		termina = norm(aux) <= precision_relativa;
	end
end