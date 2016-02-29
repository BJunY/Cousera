function [theta] = LRLS(X, y, theta, iter_num)

fai = mapFeature(X(:,1), X(:,2));

N = length(X);
R = zeros(length(X));
gradient = zeros(N, 1);

for j = 1:iter_num,
    yt = sigmoid(fai*theta);
    for i = 1:N,
        R(i, i) = yt(i)*(1 - yt(i));
    end;
    H = fai'*R*fai;
   
    gradient = fai'*(yt - y);
    
    theta = theta - pinv(H)*gradient;
end;

 x1 = linspace(-1, 1.5, 50);
 y1 = linspace(-1, 1.5, 50);
plotData(X, y);
hold on;
m = length(x1);
z = zeros(size(x1));

for i = 1:m,
    for j = 1:m,
        z(i,j) = mapFeature(x1(i), y1(j))*theta;
    end;
end;

z = z';
contour(x1, y1, z, [0 0],'LineWidth', 2);
hold off;