function [err_result] = check(X, y, theta)
err = 0;

for i = 1:length(y),
    if (X(i,:)*theta>0 && y(i)==0)||(X(i,:)*theta<0 && y(i)==1),
        err = err +1;
    end;
end;
err_result = err;