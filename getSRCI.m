function [CI_upper_normal,CI_lower_normal,CI_upper_general,CI_lower_general] = getSRCI(mean, std, skew, kurt, T)

mu = mean/std;
CI_upper_normal = mu + 1.96*sqrt((1+ mean^2/(2*std^2))/(T-1));
CI_lower_normal = mu - 1.96*sqrt((1+ mean^2/(2*std^2))/(T-1));

CI_upper_general = mu + 1.96*sqrt((1+(kurt-1)*mu^2/4- mu*skew)/(T-1));
CI_lower_general = mu - 1.96*sqrt((1+(kurt-1)*mu^2/4- mu*skew)/(T-1));



