function [cost, out, gradient1, gradient2] = NNCostLogisticCompute(X, y, theta1, theta2, lam1, lam2)

m = length(y);
X = [ones(m, 1), X];

a1 = tanh(X*theta1');
ak = [ones(m, 1),a1]*theta2';
out = sigmoid(ak);

cost = - trace([y 1-y]*[log(out) log(1 - out)]')+ ...
    lam2*sum(sum(theta2.^2)) + lam1*sum(sum(theta1.^2))
gradient1 = zeros(size(theta1));


gradient2 =  (out - y)'*[ones(m, 1),a1] + lam2*theta2;

for j = 1:length(theta1),
    for i = 1:size(X, 2),
        for k = 1:m,
            gradient1(j, i) = gradient1(j, i) + ((1 - (a1(k,j))^2) *...
            theta2(j)*(out(k) - y(k))*X(k,2));
        end;
    end;
end;

gradient1 = gradient1 + lam1*theta1;


