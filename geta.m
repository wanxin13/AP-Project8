function result = geta(stock_valmom,n)

result.stock_valmom_mean = nanmean(stock_valmom)';
result.stock_valmom_std = nanstd(stock_valmom)';
result.stock_valmom_tstat = zeros(n,1);
for i = 1:n
    result.stock_valmom_tstat(i,1) = result.stock_valmom_mean(i)*sqrt(length(stock_valmom(:,i))-sum(isnan(stock_valmom(:,i))))/result.stock_valmom_std(i);
end
result.stock_valmom_SR = result.stock_valmom_mean./result.stock_valmom_std;
result.stock_valmom_skew = skewness(stock_valmom)';
result.stock_valmom_kurt = kurtosis(stock_valmom)';
result.CI_upper_normal = zeros(n,1);
result.CI_lower_normal = zeros(n,1);
result.CI_upper_general = zeros(n,1);
result.CI_lower_general = zeros(n,1);
% confidence interval of Sharpe Ratio
for i = 1:n
    [result.CI_upper_normal(i,1),result.CI_lower_normal(i,1),result.CI_upper_general(i,1),result.CI_lower_general(i,1)] = getSRCI(result.stock_valmom_mean(i), result.stock_valmom_std(i), result.stock_valmom_skew(i), result.stock_valmom_kurt(i), length(stock_valmom(:,i))-sum(isnan(stock_valmom(:,i))));
end
result.Nu = zeros(n,1);
result.Spe = zeros(n,1);
for i = 1:n
    for t = 1:527
        if stock_valmom(t,i) >= result.stock_valmom_mean(i,1)+3*result.stock_valmom_std(i,1) || stock_valmom(t,i) <= result.stock_valmom_mean(i,1)-3*result.stock_valmom_std(i,1)
            result.Nu(i,1) = result.Nu(i,1) +1;
        end
    end
    result.Spe(i,1) = result.Nu(i,1)/(length(stock_valmom(:,i))-sum(isnan(stock_valmom(:,i))));
end

