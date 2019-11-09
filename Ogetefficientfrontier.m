function [Omega_TP,SR_TP,R,Sigma,a,b,c] = Ogetefficientfrontier(stockdata,n)

[R, Sigma, V] = getStatistics(stockdata);
One = ones(n,1);
R_e = R';

Omega_MVP = inv(V)*One / (One'*inv(V)*One);
r_MVP = stockdata*Omega_MVP;
R_MVP = nanmean(r_MVP);
Sigma_MVP = nanstd(r_MVP);

Omega_TP = inv(V)*R_e / (One'*inv(V)*R_e);
r_TP = stockdata*Omega_TP;
R_TP = nanmean(r_TP);
Sigma_TP = nanstd(r_TP);
SR_TP = R_TP/Sigma_TP;

% Create foundamental metrix
a = R*inv(V)*R';
b = One'*inv(V)*R';
c = One'*inv(V)*One;