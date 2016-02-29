function [z] = Gaussian2( x, y, mu, sigma)

z = zeros(size(x));

%temp = zeros(size(x));

m = length(x);
for i = 1:m,
    for j = 1:m,
        v = [x(i,j);y(i,j)] - mu;
        z(i,j) =  1/(2*pi*(det(sigma)^0.5)) * exp(-0.5*v'*pinv(sigma)*v);
    end;
end;