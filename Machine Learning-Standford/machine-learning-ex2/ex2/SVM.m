function [] = SVM(X_train, t_train, X_test, t_test)
m = length(t_train);
d = size(X_train, 2);
w = zeros(d, 1);
gaussian = @(x1, x2)exp(sum((x1 - x2).^2)/(2*1));

%data = load('D://hw2_lssvm_all.dat');

%options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
[x,favl,exitflag]  =...
    fmincon(@(x)f(x, X_train, t_train), rand(m,1), [], [],  t_train', 0, ...
    zeros(m, 1));

pos_id = find(t_train == 1);
neg_id = find(t_train == -1);
for i = 1:m,
    w = w + x(i)*t_train(i)*(X_train(i,:))';
end;

b = -(max(X_train(pos_id, :)*w) + min(X_train(neg_id, :)*w))*0.5;
disp(b);
%sigma = X'*X/m;
%[U, S, V] = svd(sigma);
%U_rec = U(:, 1:2);
%disp(size(U_rec));
%disp(size(X));
%X_rec = X*U_rec;

%x1 = linspace(-13, 12, 100);
%x2 = linspace(-13, 12, 100);
result = zeros(200,1);
for i = 1:300,
    for j = 1:200,
    result(j) = result(j) + x(i)*t_train(i)*gaussian(X_train(i,:), X_test(j,:));
    end;
end;
result = result + b;
disp(result);
%plot(X_rec(pos_id,1), X_rec(pos_id,2), 'r+');
%hold on;
%plot(X_rec(neg_id,1), X_rec(neg_id,2), 'go');
%contour(x1, x2, result,  [0,0],'ShowText', 'on');
pos = find(result>=0);
neg = find(result<=0);
result(pos,:) = 1;
result(neg, :) = -1;
error = sum(t_test~=result);
disp(result);
disp(error);
fprintf('accuracy rate:%d', (200 - error)/2);   
    
    
    
    
    
    
    