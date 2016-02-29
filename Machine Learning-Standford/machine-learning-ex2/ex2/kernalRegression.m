function [] = kernalRegression(x, y, lambda, sigma)
m = length(x)
K = zeros(m, m)

figure;
plot(x, y, 'r*');
hold on;
for i = 1:m,
    for j = 1:m,
        K(i,j) = exp(- (x(i) - y(j)).^2/(2*sigma^2));
    end;
end;

ny = zeros(m, 1);


nx = linspace(-7, 7,500);
k = size(m, 1);
ny = zeros(size(nx));

for i = 1:length(nx),
    for j = 1:m,
        k(j) = exp(- (x(j) - nx(i)).^2/(2*sigma^2));
    end;
    ny(i) = k*pinv(K + lambda*eye(m))*y;
end;
plot(nx, ny, 'go');
plot(nx, ny);
hold off;