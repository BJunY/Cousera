function [] = PGM(X, y)

id_0 = find(y == 0);
id_1 = find(y == 1);
N1 = length(id_1);
m = length(y);
D = size(X,2);
pai = N1/m;
N2 = m - N1;

M1 = zeros(N1,D);
M2 = zeros(N2,D);

S1 = zeros(2);
S2 = zeros(2);

for i = 1:N1,
    M1(i,:) = X(id_1(i),:);
end;

for i = 1:N2,
    M2(i,:) = X(id_0(i),:);
end;

mu1 = mean(M1);
mu2 = mean(M2);

for i = 1:N1,
    S1 = S1 + (M1(i,:) - mu1)'*(M1(i,:) - mu1);
end

for i = 1:N2,
    S2 = S2 + (M2(i,:) - mu2)'*(M2(i,:) - mu2);
end
sigma1 =  S1/N1;
sigma2 =  S2/N2;
share_sigma = (S1 + S2)/m;
[x1,y1] = meshgrid(30:100, 30:100, 100) ;
plotData(X, y);
hold on;
Z = pai*Gaussian2(x1, y1, mu1', sigma1) - (1-pai)*Gaussian2(x1, y1, mu2', sigma2);
contour(x1, y1, Z, 'ShowText', 'on');

Z = pai*(Gaussian2(x1, y1, mu1', share_sigma) + Gaussian2(x1, y1, mu2', share_sigma)) - Gaussian2(x1, y1, mu2', share_sigma);
contour(x1, y1, Z, 'ShowText', 'on');
hold off;
