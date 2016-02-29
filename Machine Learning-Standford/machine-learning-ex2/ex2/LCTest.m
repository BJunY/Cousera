function [theta] = LCTest(X, y)

figure; hold on;
m = length(y);
%plot the original data
for i = 1:m,
    if y(i) == 1,
        plot(X(i,1),X(i,2),'k+');
        hold on;
    else
        plot(X(i,1),X(i,2),'ro');
        hold on;
    end
end

xlabel('Exam 1 score');
ylabel('Exam 2 score');
axis([30 100 30 100]);
%legend(a, 'Admitted',b,'Not admitted')

%use least square for classification
X_1 = [ones(length(X), 1), X];
theta = pinv(X_1'*X_1)*X_1'*y;
x = linspace(0, 100);
y = linspace(0, 100);
[x_n, y_n] = meshgrid(x, y);
%contour(x_n, y_n, theta(1) + theta(2)*x_n + theta(3)*y_n, 2);
STR = sprintf('%f+%f*x+%f*y',theta(1), theta(2), theta(3));
fh = @(x,y) 0.0148*x + 0.0139*y-1.2975;

ezplot(fh,[-100,100]);
hold off;
