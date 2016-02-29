function [theta] = trainDigitReg(theta, lam, alpha, iter_num)
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

 for i =1:iter_num,
     [cost,gradient] = computeDigitRegn(X, y, theta, lam);
      theta = theta - alpha*gradient;
 end;
 %predict
 
 test = data.test;
  m = length(test);
 test = double(data.test);
test = [ones(m, 1), test];

out = sigmoid(test*theta);
[ma, id] = max(out,[],2);
testid = data.testid;
accuracy = sum(id == testid) /m;
str = sprintf('the Accuracy Rate is %4f%%',accuracy*100);
disp(str);
