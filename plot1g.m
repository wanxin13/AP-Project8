function []=plot1g(a,b,c,R,Sigma,r1,sigma1)

r = 0.0005:0.0005:0.02;
sigma = sqrt((a-2*r.*b+c*(r.^2))/(a*c-b^2));

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma, r, '-');
hold on
b = plot( Sigma,R,'o');
hold on
c = plot( sigma1,r1,'bo');

box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Efficient Frontier'));
legend('Efficient Frontier','Value and Momentum Portfolios','50-50 Value-Mom Portfolios');
%close(f);