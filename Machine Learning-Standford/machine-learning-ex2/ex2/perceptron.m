function [final_theta] = perceptron(X, y, theta)
X_O = X;
X = [ones(length(X),1) X];
y1 = zeros(2,1);
x = [30,100]';
i = 1;       
while true,%iterate number = 5
    
    for j = 1:length(y),
        if theta'*(X(j,:))'>=0 && y(j)==0,
            theta = theta - (X(j,:))';
        
        
        elseif theta'*(X(j,:))'<=0 && y(j)==1,
            theta = theta + (X(j,:))';
        end;
    end;
    disp(i);
    i = i + 1;
    if check(X, y, theta)==0,
        break;
    end;
       
end
 plotData(X_O, y);
        hold on;
        axis([30 100 30 100])
        str = sprintf('%d', i);
        title(str);
        y1 = -(theta(1:2,:))'*[ones(2,1), x]'/theta(3);
        plot(x, y1');
        hold off;
final_theta = theta;
        
            

