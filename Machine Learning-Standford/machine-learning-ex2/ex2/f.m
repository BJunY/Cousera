function y = f(alpha, X, t)
m = length(alpha);
y = 0;

%data = load('D://hw2_lssvm_all.dat');
%X = data(:, 1:end - 1);
%t = data(:, end);


for i = 1:m
    for j = 1:m     
        y = y + t(i)*t(j)*alpha(i)*alpha(j)...
            *exp(sum((X(i,:) - X(j,:)).^2)/(2*1));
    end;
end;
y = (sum(alpha) - 0.5*y)/100000;