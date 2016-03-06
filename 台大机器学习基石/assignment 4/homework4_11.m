function [E_train, E_val, E_out] = homework4_11(lambda)

data = load('D://ntumlone-hw4-hw4_train.dat');
[n_train, m_train] = size(data);
X_train_o = data(:, 1:m_train -1 );
X_train_all = [ones(n_train, 1), X_train_o];
y_train_all = data(:, m_train);

X_train = X_train_all(1:120, :);
y_train = y_train_all(1:120, :);


X_val = X_train_all(121:200, :);
y_val = y_train_all(121:200, :);

data = load('D://ntumlone-hw4-hw4_test.dat');
[n_test, m_test] = size(data);
X_test_o = data(:, 1:m_test -1 );
X_test = [ones(n_test, 1), X_test_o];
y_test = data(:, m_test);
%for i = 1:13
    %l%ambda = 10^(3 - i);
    w = pinv(X_train'*X_train + lambda*eye(3))*X_train'*y_train;
    E_train = (120 - sum(sign(X_train*w) == y_train))/120;
    E_val = (80 - sum(sign(X_val*w) == y_val))/80;
    E_out = (n_test - sum(sign(X_test*w) == y_test))/n_test;
%end;
%id_in = find(E_in == min(E_in));
%id_out = find(E_out == min(E_out));
%E_in(id_out)
%sprintf('E_in: %f', E_in(id_in));
%E_out(id_out)
%id_out = lambda(id_out);
end


