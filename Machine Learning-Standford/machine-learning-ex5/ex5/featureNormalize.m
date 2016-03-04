function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

mu = mean(X);
m = length(X);
X_norm = bsxfun(@minus, X, mu);
%mu1 = repmat(mu,m,1);
%X_norm = X - mu1;
sigma = std(X_norm);
X_norm = bsxfun(@rdivide, X_norm, sigma);
%sigma1 = repmat(sigma,m,1);
%X_norm = X_norm./sigma1;

% ============================================================

end
