function [theta1, theta2] = NNrplot(X, y, theta1, theta2, iter_num, alpha, lam1, lam2)

plot(X, y, 'g*');
hold on;

for i =1:iter_num,
    [cost, out, gradient1, gradient2] = NNCostCompute(X, y, theta1, theta2, lam1, lam2);    
    theta1 = theta1 - alpha*gradient1;
    theta2 = theta2 - alpha*gradient2;
end;



[cost, out, gradient1, gradient2] = NNCostCompute(X, y, theta1, theta2, lam1, lam2);
plot(X(:,1), out, 'r');

true = theta1(3,2);
theta1(3,1) = theta1(3,1) + 0.0001;
[cost, out, gradient1, gradient2] = NNCostCompute(X, y, theta1, theta2, lam1, lam2);
e1 = cost;

theta1(3,1) = theta1(3,1) - 2*0.0001;
[cost, out, gradient1, gradient2] = NNCostCompute(X, y, theta1, theta2, lam1, lam2);
e2 = cost;

d = (e1 - e2)/2*0.0001;
disp(d);
theta1(3,1) = true;
