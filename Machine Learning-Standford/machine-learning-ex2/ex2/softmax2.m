function [theta] = softmax2(X, y, theta, lam, iter_num, alpha)


m = length(y);
oy = y
y = zeros(m,3);
figure;
for i = 1:m,
    if oy(i,1) == 1,
        y(i,:) = [1 0 0];  
        plot(X(i,1),X(i,2),'g+');
        hold on;
    elseif oy(i,1) == 2,
         y(i,:) = [0 1 0];  
        plot(X(i,1),X(i,2),'ro');
       hold on;
    else
         y(i,:) = [0 0 1];  
        plot(X(i,1),X(i,2),'y*');
       hold on;
    end
end

J = zeros(iter_num,1);
for i = 1:iter_num,
    [J(i),gradient] = computeCross(X, y, theta, lam)
    theta = theta - alpha*gradient;
end;


X = [ones(m,1) X];
plotDecisionBoundary(theta(:,1) - theta(:,2), X, oy);
plotDecisionBoundary(theta(:,2) - theta(:,3), X, oy);
plotDecisionBoundary(theta(:,3) - theta(:,1), X, oy);
hold off;