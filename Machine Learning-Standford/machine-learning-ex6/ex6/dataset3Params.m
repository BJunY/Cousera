function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C_list = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_list = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

C_num = length(C_list);
sigma_num = length(sigma_list);

error_list = zeros(C_num, sigma_num);
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
for C_id = 1:C_num
    for sigma_id = 1:sigma_num
        model = svmTrain(X, y, C_list(C_id), ...
            @(x1, x2) gaussianKernel(x1, x2, sigma_list(sigma_id)));  
        predictions = svmPredict(model, Xval);
        error_list(C_id, sigma_id) = mean(double(predictions ~= yval));
    end;
end;

[C_optimal, sigma_optimal] = find(error_list == min(min(error_list)));
C = C_list(C_optimal);
sigma = sigma_list(sigma_optimal);





% =========================================================================

end
