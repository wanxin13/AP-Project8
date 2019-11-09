function []=plot1o(a,b,c,R,Sigma)

r = 0.0005:0.001:0.8;
sigma = sqrt((a-2*r.*b+c*(r.^2))/(a*c-b^2));

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot( sigma, r, '-');
hold on
b = plot( Sigma,R,'o');


box off; grid on;
ylabel('Expected Return')
xlabel('Standard Deviation of Portfolio');
title(strcat('Efficient Frontier'));
legend('Efficient Frontier','Factor Portfolios');
%close(f);