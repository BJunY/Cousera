function [z] = Generate_Gaussian_Data(mu, sigma, num,  dim ,plot2)

R = chol(sigma);
z = repmat(mu,num,1) + randn(num,dim)*R;
if plot2 && dim == 2,
    plot(z(:,1), z(:,2), '*');
end;