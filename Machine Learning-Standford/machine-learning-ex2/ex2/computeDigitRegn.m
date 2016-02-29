function [cost,gradient] = computeDigitRegn(X, y,theta, lam)


gradient = zeros(size(theta));
s = 0;

m = length(X);
X = [ones(m, 1), X];

out = sigmoid(X*theta);


for n = 1:m,
    for k = 1:size(theta, 2),
        s = s - (y(n,k)*log(out(n,k)) + (1 - y(n, k))*(log(1 - out(n, k))))/m;
    end;
end;
cost = s + lam*sum(sum(theta.^2))/(2*m) -  lam*sum(theta(1,:).^2)/(2*m);


gradient = X'*(out - y)/m + lam*theta/m;

gradient(1,:) = gradient(1,:) - lam*theta(1,:)/m;


