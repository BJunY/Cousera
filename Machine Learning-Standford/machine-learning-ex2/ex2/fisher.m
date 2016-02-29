function [n1,n2] = fisher(X, y)

X_test = X(61:100,:);
X = X(1:60,:);
id_0 = find(y(1:60)==0);
id_1 = find(y(1:60)==1);
n1 = length(id_0);%number of yi=0
n2 = length(id_1);%number of yi=1
M1 = zeros(n1,2);
M2 = zeros(n2,2);

for i = 1:n1,
    M1(i,:) = X(id_0(i),:);
end;

for i = 1:n2,
    M2(i,:) = X(id_1(i),:);
end;

m1 = mean(M1,1);
m2 = mean(M2,1);

Sw1 = zeros(2);
Sw2 = zeros(2);


for i = 1:n1,
    Sw1 = Sw1 + (M1(i,:) - m1)'*(M1(i,:) - m1);
end

for i = 1:n2,
    Sw2 = Sw2 + (M2(i,:) - m2)'*(M2(i,:) - m2);
end

Sw = Sw1 + Sw2;

W = pinv(Sw)*(m2 - m1)';
boundry = W'*(m1 + m2)'*0.5;
m_M1 = W'*M1';
m_M2 = W'*M2';

plot(m_M1,10*ones(1,length(m_M1)),'r+');
hold on;
plot(m_M2,10*ones(1,length(m_M2)),'go');

plot([boundry boundry],[0 20],'y');
n1 = find(m_M1>boundry);
n2 = find(m_M2<boundry);

err = 0;
result = zeros(40,1);
m = W'*X_test';
for i = 1:length(m),
if m(i) > boundry,
    result(i) = 1;
end;
end;
    
for i =1:length(m),
    if result(i)~= y(60+i),
        err = err + 1;
    end;
end;
str = sprintf('error rate:%f', err/40);
disp(str);