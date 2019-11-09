function [Omega_TP_even] = getoutofsampleefficientfrontier(stockdata,n)

[R, Sigma,V] = getStatistics(stockdata(1:2:end,:));
One = ones(n,1);
R_e = R';


Omega_TP_even = inv(V)*R_e / (One'*inv(V)*R_e);




