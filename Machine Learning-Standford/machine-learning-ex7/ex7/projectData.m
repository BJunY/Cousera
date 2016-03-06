function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only 
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of 
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K 
%               eigenvectors in U (first K columns). 
%               For the i-th example X(i,:), the projection on to the k-th 
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k);
%
U_reduce = U(:, 1:K);
Z = X*U_reduce;



% =============================================================

end


ix-li1-14.ix.netcom.com - - [08/Aug/1995:14:46:37 -0400] "GET /images/MOSAIC-logosmall.gif HTTP/1.0 " 200 363
127.0.0.1 - - [01/Aug/1995:00:00:01 -0400] "GET /images/launch-logo.gif HTTP/1.0" 200 1839
ppp1-115.ganet.net - - [28/Jul/1995:13:30:13 -0400] "GET /news/sci.space.news/archive/sci-space-news-1-feb-1995-80.txt HTTP/1.0" 200 241853