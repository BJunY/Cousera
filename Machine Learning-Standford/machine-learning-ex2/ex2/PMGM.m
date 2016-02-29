function [] = PMGM(X, y)

id_2 = find(y == 2);
id_1 = find(y == 1);
id_3 = find(y == 3);
N1 = length(id_1);
m = length(y);
N2 = length(id_2);
N3 = length(id_3);
D = size(X,2);
pai1 = N1/m;
pai2 = N2/m;
pai3 = 1 - pai1 -pai2;


M1 = zeros(N1,D);
M2 = zeros(N2,D);
M3 = zeros(N3, D);

S1 = zeros(2);
S2 = zeros(2);
S3 = zeros(2);

for i = 1:N1,
    M1(i,:) = X(id_1(i),:);
end;

for i = 1:N2,
    M2(i,:) = X(id_2(i),:);
end;


for i = 1:N3,
    M3(i,:) = X(id_3(i),:);
end;

mu1 = mean(M1);
mu2 = mean(M2);
mu3 = mean(M3);

for i = 1:N1,
    S1 = S1 + (M1(i,:) - mu1)'*(M1(i,:) - mu1);
end

for i = 1:N2,
    S2 = S2 + (M2(i,:) - mu2)'*(M2(i,:) - mu2);
end

for i = 1:N3,
    S3 = S3 + (M3(i,:) - mu3)'*(M3(i,:) - mu3);
end

sigma1 =  S1/N1;
sigma2 =  S2/N2;
sigma3 =  S3/N3;
disp(sigma3);
%share_sigma = (S1 + S2)/m;

    % important to transpose z before calling contour

for i = 1:m,
    if y(i) == 1,  
        plot(X(i,1),X(i,2),'g+');
        hold on;
    elseif y(i) == 2,
        plot(X(i,1),X(i,2),'ro');
       hold on;
    else
        plot(X(i,1),X(i,2),'y*');
       hold on;
    end
end
hold on;

 u = linspace(0, 10, 200);
 v = linspace(0, 10, 200);
 i1=1;i2=1;i3 =1;
u3 = zeros(1,50);u2 = zeros(1,50);u1 = zeros(1,50);
v3 = zeros(1,50);v2 = zeros(1,50);v1 = zeros(1,50);
disp(size(u));
  for i = 1:length(u)
        for j = 1:length(v)
            p(1) = pai1*Gaussian2(u(i), v(j), mu1', sigma1);
            p(2) = pai2*Gaussian2(u(i), v(j), mu2', sigma2);
            p(3) = pai3*Gaussian2(u(i), v(j), mu3', sigma3);
            d(1) = find(p == min(p));
            id = d;
            if id == 3,
                if min([i1, i2, i3])==50,
                    break;
                end;
                u3(i3) = u(i);
                v3(i3) = v(i);
                i3 = i3 + 1;
            
            elseif id == 2,
                  if min([i1, i2, i3])==50,
                    break;
                   end;
                u2(i2) = u(i);
                v2(i2) = v(i);
                i2 = i2 + 1;
            
            else 
                if min([i1, i2, i3])==50,
                    break;
                end;
                u1(i1) = u(i);
                v1(i1) = v(i);
                i1 = i1 + 1;
            end;
           
            
        end;
                
  end
         
     disp(size(u3));
    [U3, V3] = meshgrid(u3, v3);
   
    [U2, V2] = meshgrid(u2, v2);
    [U1, V1] = meshgrid(u1, v1);
Z = pai1*Gaussian2(U3, V3, mu1', sigma1) - pai2*Gaussian2(U3, V3, mu2', sigma2);
disp(u3);
contour(U3, V3, Z, [0 0]);

Z = pai2*Gaussian2(U1, V1, mu2', sigma2) - pai3*Gaussian2(U1, V1, mu3', sigma3) ;
contour(U1, V1, Z, [0 0]);

Z = pai3*Gaussian2(U2, V2, mu3', sigma3) - pai1*Gaussian2(U2, V2, mu1', sigma1);
contour(U2, V2, Z, [0 0]);
hold off;
