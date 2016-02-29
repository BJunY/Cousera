function [ least_err, final_theta] = pocket_perceptron(X, y, theta, iter_num)
X_O = X;
X = [ones(length(X),1) X];
y1 = zeros(2,1);
x = [30,100]';
least_err = 100;
optimal_theta = zeros(size(theta));

for i = 1:iter_num,%iterate number = 5
    
    for j = 1:length(y),
        disp(length(y));
        disp(j);
        if theta'*(X(j,:))'>=0 && y(j)==0,
            theta = theta - (X(j,:))';
            
        elseif theta'*(X(j,:))'<=0 && y(j)==1,
            theta = theta + (X(j,:))';
                               
        end;
        
    end;
    cur_err = check(X, y, theta);
    if cur_err < least_err,
        optimal_theta = theta;
        least_err = cur_err;
    end
    
   
end;
theta = optimal_theta;
  plotData(X_O, y);
     hold on;
     axis([30 100 30 100])
     str = sprintf('%d', i);
     title(str);
     
     y1 = -(theta(1:2,:))'*[ones(2,1), x]'/theta(3);
     plot(x, y1');
     hold off;
final_theta = theta;

        
            

