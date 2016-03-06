function [err] = homework4_16(lambda)

data = load('D://ntumlone-hw4-hw4_train.dat');
[n_train, m_train] = size(data);
X_train_o = data(:, 1:m_train -1 );
X_train_all = [ones(n_train, 1), X_train_o];
y_train_all = data(:, m_train);

data = load('D://ntumlone-hw4-hw4_test.dat');
[n_test, m_test] = size(data);
X_test_o = data(:, 1:m_test -1 );
X_test = [ones(n_test, 1), X_test_o];
y_test = data(:, m_test);
%for i = 1:13
    %l%ambda = 10^(3 - i);
    id_train = zeros(160, 5)
    id_train(:,1) = (41:200)';
    id_train(:,2) = [(1:40)';(81:200)'];
    id_train(:,3) = [(1:80)';(121:200)'];
    id_train(:,4) = [(1:120)';(161:200)'];
    id_train(:,5) = (1:160)';
    for i = 1:5
        X_cv = X_train_all(1 + 40*(i-1):40 + 40*(i - 1), :);
        y_cv = y_train_all(1 + 40*(i-1):40 + 40*(i - 1), :);
        X_train = X_train_all(id_train(:,i), :);
        y_train = y_train_all(id_train(:,i), :);
        w = pinv(X_train'*X_train + lambda*eye(3))*X_train'*y_train;
    %E_train = (120 - sum(sign(X_train*w) == y_train))/120;
        E_cv(i) = (40 - sum(sign(X_cv*w) == y_cv))/40;
    end;
    err = mean(E_cv);
   % E_out = (n_test - sum(sign(X_test*w) == y_test))/n_test;
%end;
%id_in = find(E_in == min(E_in));
%id_out = find(E_out == min(E_out));
%E_in(id_out)
%sprintf('E_in: %f', E_in(id_in));
%E_out(id_out)
%id_out = lambda(id_out);
end


