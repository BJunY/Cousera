function [] = LSMC(X, y)

m = length(y);
y = [y zeros(m,2)];
figure;
for i = 1:m,
    if y(i,1) == 1,
        y(i,:) = [1 0 0];  
        plot(X(i,1),X(i,2),'g+');
        hold on;
    elseif y(i,1) == 2,
         y(i,:) = [0 1 0];  
        plot(X(i,1),X(i,2),'ro');
       hold on;
    else
         y(i,:) = [0 0 1];  
        plot(X(i,1),X(i,2),'y*');
       hold on;
    end
end

X = [ones(m, 1) X];
theta = pinv(X'*X)*X'*y;
w1 = theta(:,1) - theta(:,2);
w2 = theta(:,2) - theta(:,3);
w3 = theta(:,3) - theta(:,1);
point = pinv((theta(:,2:3))')*(theta(:,1))';
x = [0 15];

plotDecisionBoundary(theta(:,1) - theta(:,2), X, y);
plotDecisionBoundary(theta(:,2) - theta(:,3), X, y);
plotDecisionBoundary(theta(:,3) - theta(:,1), X, y);
hold off;