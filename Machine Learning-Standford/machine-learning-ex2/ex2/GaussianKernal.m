function [k] = GaussianKernal(x, y, sigma)
k = exp(- (x - y).^2/(2*sigma^2))
