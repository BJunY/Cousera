function [theta] = softmax1(X, y, initial_theta, lam)
options = optimset('GradObj', 'on','MaxIter', 1500); 


m = length(y);
oy = y
y = zeros(m,3);
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

[theta, J, exit_flag] = fminunc(@(t)(computeCross(X, y, t, lam)), initial_theta, options);
disp(J);

X = [ones(m,1) X];
plotDecisionBoundary(theta(:,1) - theta(:,2), X, oy);
plotDecisionBoundary(theta(:,2) - theta(:,3), X, oy);
plotDecisionBoundary(theta(:,3) - theta(:,1), X, oy);
hold off;