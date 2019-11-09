function []=plot1k(actual_mean,expected_mean)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
a = plot(1:16,actual_mean, 'ro');
hold on
b = plot(1:16,expected_mean,'bo');


box off; grid on;
ylabel('Monthly Return')
xlabel('Portfolios');
title(strcat('Return Difference'));
legend('Average Return','Predicted Expected Return');
%close(f);