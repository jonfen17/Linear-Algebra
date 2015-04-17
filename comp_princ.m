%--------------------------------------------------------------------------
% Carlos Dioney Blanco González         131370
% Course - Advanced Linear Algebra   Spring 2015
%
% This program makes an approximation of the matrix A as sum of r matrixes 
% E of rank 1, where  r < rank( A ). Each E is obtained from the SVD 
% decomposition as it follows:
%
%   E_i = S(i,i)*U(:,i)*V(:,i)' ... (1)     S diagonal U,V unitary
%
% Input:
% A - Original matrix
% r - Number of rank 1 matrixes to build the approach
% Output: 
% B - Sum of r matrixes of rank 1 obtained from (1)
% 
%--------------------------------------------------------------------------
function [ B ] = Principal_Components( A, r )

B       = [];
[U,S,V] = svd(A);

for i = 1:r
    B = B + S(i,i)*U(:,i)*V(:,i)';
end

end
