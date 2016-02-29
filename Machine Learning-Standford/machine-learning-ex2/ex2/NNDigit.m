function [theta1,theta2] = NNDigit(theta1, theta2,  lam1, lam2)
data = load('mnist_all.mat');
ydata = load('mnist_y.mat');
X = data.X;
%X1 = data.train1;
X = double(X);
y = ydata.y;
%y1 = ydata.y1;
%y = [y0;y1];
%options = optimset('GradObj', 'on');
% Optimize
%[theta, J, exit_flag] = ...
	%fminunc(@(t)(computeDigitRegn(t, X, y, lam)), zeros(785,10), options);

% for i =1:iter_num,
    % [cost, out, gradient1, gradient2] = NNCostSoftMaxCompute(X, y, theta1, theta2, lam1, lam2);
     % theta1 = theta1 - alpha*gradient1;
      %theta2 = theta2 - alpha*gradient2;
% end;

 options = optimset('GradObj', 'on', 'MaxIter', 50);
 [theta1] = ...
        fmincg (@(t)(NNCostSoftMaxCompute(X, y, t, theta2, lam1, lam2)), ...
        zeros(100,785), options);
     [theta2] = ...
        fmincg (@(t)(NNCostSoftMaxCompute(X, y, theta1, t, lam1, lam2)), ...
         zeros(10,101), options);
    
 %predict
  test = data.test;
  m = length(test);
 test = double(data.test);
test = [ones(m, 1), test];

 a1 = tanh(X*theta1');
ak = exp([ones(m, 1),a1]*theta2');
suma = sum(ak,2);
out = ak/suma;
[ma, id] = max(out,[],2);
testid = data.testid;
accuracy = sum(id == testid) /m;
str = sprintf('the Accuracy Rate is %4f%%',accuracy*100);
disp(str);
