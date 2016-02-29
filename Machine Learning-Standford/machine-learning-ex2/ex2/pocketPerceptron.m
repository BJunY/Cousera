function [final_theta] = pocketPerceptron(X, y, theta, iter_num)
X_O = X;
X = [ones(length(X),1) X];

cur_theta = zeros(size(theta));
y1 = zeros(2,1);
x = [30,100]';
pre_err = 100;    
for i = 1:iter_num,%iterate number = 5
    
    j = randi(100, 1, 1);
    if cur_theta'*(X(j,:))'>=0 && y(j)==0,
            cur_theta = cur_theta - (X(j,:))';
            
    elseif cur_theta'*(X(j,:))'<=0 && y(j)==1,
            cur_theta = cur_theta + (X(j,:))';                              
    end;
    
    cur_err = check(X, y, cur_theta);
    
     if cur_err < least_err,
         theta = cur_theta;
         pre_err = cur_err;
     end;
    disp(cur_err);
end;

  plotData(X_O, y);
     hold on;
     axis([30 100 30 100]);
     str = sprintf('%d', i);
     title(str);
     
     y1 = -(theta(1:2,:))'*[ones(2,1), x]'/theta(3);
     plot(x, y1');
     hold off;
final_theta = theta;

        
            

