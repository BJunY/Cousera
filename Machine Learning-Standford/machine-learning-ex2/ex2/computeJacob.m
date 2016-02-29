function [Jacob] = computeJacob(X, y,  theta1, theta2)

m = length(y);
X = [ones(m, 1), X];
Jacob = zeros(size(theta2,1), 1:size(X,2));
a1 = tanh(X*theta1');
ak = [ones(m, 1),a1]*theta2';
out = sigmoid(ak);

for k = 1:size(theta2,1),
    for i = 1:size(X,2),
        for j = 1:size(theta1,1),
            Jacob(k, i)  = Jacob(k, i) + (out - y)*(1 - tanh(a1(j))^2)*theta2(k, j)*theta1(j,i);
        end;
    end;
end;
        