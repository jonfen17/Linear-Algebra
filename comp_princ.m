%--------------------------------------------------------------------------
% Carlos Dioney Blanco González         131370
% Curso: Álgebra Lineal Avanzada  Primavera 2015
%
% Este programa realiza una descomposición de la matriz A como suma de r
% ( r <= rank( A ) ) matrices E de rango 1. Cada E se obtiene a partir de 
% la svd  como E_i = S(i,i)*U(:,i)*V(:,i)'  S diagonal U,V unitarias
%
% Input:
% A - Matriz original
% r - número de matrices de rango 1 para construir la descomposición
% Output: 
% B - suma de r matrices de rango 1
% 
%--------------------------------------------------------------------------
function [ B ] = comp_princ( A, r )

B       = [];
[U,S,V] = svd(A);

for i = 1:r
    B = B + S(i,i)*U(:,i)*V(:,i)';
end

end