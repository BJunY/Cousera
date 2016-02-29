function [cost, out, gradient1, gradient2] = NNCostCompute(X, y, theta1, theta2, lam1, lam2)

m = length(y);
X = [ones(m, 1), X];

a1 = tanh(X*theta1');
out = [ones(m, 1),a1]*theta2';
cost = (out - y)'*(out - y)/(2*m)+ lam1*sum(sum(theta1.^2))/(2*m) + lam2*sum(sum(theta2.^2))/(2*m)
gradient1 = zeros(size(theta1));

gradient2 =  (out - y)'*[ones(m, 1),a1] + lam2*theta2/m;

for j = 1:length(theta1),
    for i = 1:size(X, 2),
        for k = 1:m,
            gradient1(j, i) = gradient1(j, i) + ((1 - (a1(k,j))^2) *...
            theta2(j)*(out(k) - y(k))*X(k,2))/m;
        end;
    end;
end;

gradient1 = gradient1 + lam1*theta1/m;


