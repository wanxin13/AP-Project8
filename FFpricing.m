function result = FFpricing(data,factor)

% Copy Qi Fan

[T,N] = size(data);
K = size(factor,2);
result.beta = zeros(K+1,N);
result.t = zeros(K+1,N);
result.se = zeros(K+1,N);
result.R2 = zeros(2,N);
result.resid = zeros(T,N);

for i = 1:N
    ols = fitlm(factor,data(:,i));
    coeff = table2array(ols.Coefficients);
    result.beta(:,i) = coeff(:,1);
    result.se(:,i) = coeff(:,2);
    result.t(:,i) = coeff(:,3);
    result.R2(:,i) = [ols.Rsquared.Ordinary, ols.Rsquared.Adjusted]
    result.resid(:,i) = table2array(ols.Residuals(:,1));
end