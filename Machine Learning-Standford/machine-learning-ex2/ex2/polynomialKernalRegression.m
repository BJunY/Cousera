function [] = polynomialKernalRegression(x, y, pow, d, lambda)

f = @(x, y, pow, d)(x'*y + d).^pow;%multinominal kernal
m = length(x)
K = zeros(m, m)

figure;
plot(x, y, 'r*');
hold on;
for i = 1:m,
    for j = 1:m,
       K(i,j) = f(x(i), x(j), pow, d);
    end;
end;

ny = zeros(m, 1);


nx = linspace(-7, 7,500);
k = size(m, 1);
ny = zeros(size(nx));

for i = 1:length(nx),
    for j = 1:m,
        k(j) = f(x(j), nx(i), pow, d);
    end;
    ny(i) = k*pinv(K + lambda*eye(m))*y;
end;
plot(nx, ny, 'go');
plot(nx, ny);
hold off;
