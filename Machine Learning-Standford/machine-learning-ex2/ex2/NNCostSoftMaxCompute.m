function [cost, out, gradient1, gradient2] = NNCostSoftMaxCompute(X, y, theta1, theta2, lam1, lam2)

m = length(y);
X = [ones(m, 1), X];
X = double(X);

a1 = tanh(X*theta1');
ak = exp([ones(m, 1),a1]*theta2');
suma = sum(ak,2);
suma = repmat(suma,1,10);

out = ak./suma;
disp(size(out));
s = 0;

for n = 1:m,
    for k = 1:size(theta2,1),
        s = s - y(n,k)*log(out(n, k));
    end;
end;
        
cost = s/m + lam2*sum(sum(theta2.^2))/(2*m) + lam1*sum(sum(theta1.^2))/(2*m);

gradient1 = zeros(size(theta1));
gradient2 =  (out - y)'*[ones(m, 1),a1]/m + lam2*theta2/m;
for j = 1:size(theta1,1),
    for i = 1:size(X, 2),
        for k = 1:m,
            gradient1(j, i) = gradient1(j, i) + ((1 - (a1(k,j))^2) *...
            (out(k,:) - y(k,:))*theta2(:,j)*X(k,2))/m;
        end;
    end;
end;

gradient1 = gradient1 + lam1*theta1/m;


