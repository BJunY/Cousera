function [] = RBFKernalRegression(x, y, mu, sigma)

N = length(y);


plot(x, y, 'r*');
hold on;
rbf = @(mu, sigma, xi, yi, y)normpdf(xi - yi)/sum(normpdf(xi - y));
nx = linspace(-7, 7,50);
ny = zeros(size(nx));

for i = 1:N,
    for j = 1:length(nx),
        ny(j) = ny(j) + y(i)*rbf(mu, sigma, nx(j), x(i), x);
    end;
end;

plot(nx, ny, 'go');
plot(nx, ny);

        
    

