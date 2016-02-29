function [theta1, theta2] = NNrLogisticplot(X, y, theta1, theta2, iter_num, alpha, lam1, lam2)


x1 = linspace(-1,1.2,200);
x2 = linspace(-1,1.2,200);
z = zeros(length(x1), length(x2));

for k =1:iter_num,
    [cost, out, gradient1, gradient2] = NNCostLogisticCompute(X, y, theta1, theta2, lam1, lam2);    
  
    theta1 = theta1 - alpha*gradient1;
    theta2 = theta2 - alpha*gradient2;
    if mod(k,10000)==0,
         plotData(X, y);
         hold on;
        for i =1:length(x1),
            for j = 1:length(x2),
                a1 =  tanh([1 x1(i) x2(j)]*theta1');
               z(i,j) =  sigmoid([1 a1]*theta2');
            end;
        end;
    
%id = find(out - 0.5);
%plot(trx(id, 2), tr(id, 3));
        contour(x1, x2, z, [0.5,0.5]);
        hold off;
    end;
end;

true = theta1(3,2);
theta1(3,1) = theta1(3,1) + 0.0001;
[cost, out, gradient1, gradient2] = NNCostLogisticCompute(X, y, theta1, theta2, lam1, lam2);
e1 = cost;

theta1(3,1) = theta1(3,1) - 2*0.0001;
[cost, out, gradient1, gradient2] = NNCostLogisticCompute(X, y, theta1, theta2, lam1, lam2);
e2 = cost;

d = (e1 - e2)/2*0.0001;
disp(d);
theta1(3,1) = true;
