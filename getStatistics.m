function [r,sigma,v] = getStatistics(stockdata)

r = nanmean(stockdata);
sigma = nanstd(stockdata);
%v = nancov(stockdata);
v = cov(stockdata,'partialrows');