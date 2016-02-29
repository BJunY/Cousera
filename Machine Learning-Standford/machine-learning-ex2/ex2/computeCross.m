function [J,gradient] = computeCross(X, t, theta, lam)

X = [ones(length(t),1), X];
a = X * theta;
m = length(t);
s = sum(exp(a),2);
s = repmat(s,1,3);
y = (exp(a))./s;
disp(y);
gradient = zeros(size(theta));
J = -1*sum(sum(t.*log(y)))/m + 0.5*lam*(sum(sum(theta.^2)) - theta(1,:)...
    *(theta(1,:))')/m;
for n = 1:length(t),
    gradient(:,1) = gradient(:,1) + (y(n,1) - t(n,1))*(X(n,:))' ;
    gradient(:,2) = gradient(:,2) + (y(n,2) - t(n,2))*(X(n,:))';
    gradient(:,3) = gradient(:,3) + (y(n,3) - t(n,3))*(X(n,:))';
end;
gradient(2:3,1) = gradient(2:3,1) + lam*theta(2:3,1)/m;
gradient(2:3,2) = gradient(2:3,2) + lam*theta(2:3,2)/m;
gradient(2:3,3) = gradient(2:3,3) + lam*theta(2:3,3)/m;
