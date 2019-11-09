% main.m
% This script when run should compute all values and make all plots
% required by the project.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

%% Exercise 1
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
% a
stock_valmom_mean = nanmean(stock_valmom)';
stock_valmom_std = nanstd(stock_valmom)';
stock_valmom_tstat = zeros(8,1);
for i = 1:8
    stock_valmom_tstat(i,1) = stock_valmom_mean(i)*sqrt(length(stock_valmom(:,i))-sum(isnan(stock_valmom(:,i))))/stock_valmom_std(i);
end
stock_valmom_SR = stock_valmom_mean./stock_valmom_std;
stock_valmom_skew = skewness(stock_valmom)';
stock_valmom_kurt = kurtosis(stock_valmom)';
CI_upper_normal = zeros(8,1);
CI_lower_normal = zeros(8,1);
CI_upper_general = zeros(8,1);
CI_lower_general = zeros(8,1);
% confidence interval of Sharpe Ratio
for i = 1:8
    [CI_upper_normal(i,1),CI_lower_normal(i,1),CI_upper_general(i,1),CI_lower_general(i,1)] = getSRCI(stock_valmom_mean(i), stock_valmom_std(i), stock_valmom_skew(i), stock_valmom_kurt(i), length(stock_valmom(:,i))-sum(isnan(stock_valmom(:,i))));
end
Nu = zeros(8,1);
Spe = zeros(8,1);
for i = 1:8
    for t = 1:527
        if stock_valmom(t,i) >= stock_valmom_mean(i,1)+3*stock_valmom_std(i,1) || stock_valmom(t,i) <= stock_valmom_mean(i,1)-3*stock_valmom_std(i,1)
            Nu(i,1) = Nu(i,1) +1;
        end
    end
    Spe(i,1) = Nu(i,1)/(length(stock_valmom(:,i))-sum(isnan(stock_valmom(:,i))));
end

class_valmom_mean = nanmean(class_valmom)';
class_valmom_std = nanstd(class_valmom)';
class_valmom_tstat = zeros(8,1);
for i = 1:8
    class_valmom_tstat(i,1) = class_valmom_mean(i)*sqrt(length(class_valmom(:,i))-sum(isnan(class_valmom(:,i))))/class_valmom_std(i);
end
class_valmom_SR = class_valmom_mean./class_valmom_std;
class_valmom_skew = skewness(class_valmom)';
class_valmom_kurt = kurtosis(class_valmom)';
CI_upper_normal_2 = zeros(8,1);
CI_lower_normal_2 = zeros(8,1);
CI_upper_general_2 = zeros(8,1);
CI_lower_general_2 = zeros(8,1);
% confidence interval of Sharpe Ratio
for i = 1:8
    [CI_upper_normal_2(i,1),CI_lower_normal_2(i,1),CI_upper_general_2(i,1),CI_lower_general_2(i,1)] = getSRCI(class_valmom_mean(i), class_valmom_std(i), class_valmom_skew(i), class_valmom_kurt(i), length(class_valmom(:,i))-sum(isnan(class_valmom(:,i))));
end
Nu_2 = zeros(8,1);
Spe_2 = zeros(8,1);
for i = 1:8
    for t = 1:527
        if class_valmom(t,i) >= class_valmom_mean(i,1)+3*class_valmom_std(i,1) || class_valmom(t,i) <= class_valmom_mean(i,1)-3*class_valmom_std(i,1)
            Nu_2(i,1) = Nu_2(i,1) +1;
        end
    end
    Spe_2(i,1) = Nu_2(i,1)/(length(class_valmom(:,i))-sum(isnan(class_valmom(:,i))));
end
% b
val_mean = zeros(8,1);
for i = 1:4
    val_mean(i,1) = stock_valmom_mean(2*i,1);
end
for i = 5:8
    val_mean(i,1) = class_valmom_mean(2*i-8,1);
end
val_Cov = zeros(8,8);
for i = 1:4
    val_Cov(i,i) = stock_valmom_std(2*i,1)^2;
end
for i = 5:8
    val_Cov(i,i) = class_valmom_std(2*i-8,1)^2;
end
[val__Chi] = T*Chitest([val_mean],val_Cov,8);

mom_mean = zeros(8,1);
for i = 1:4
    mom_mean(i,1) = stock_valmom_mean(2*i-1,1);
end
for i = 5:8
    mom_mean(i,1) = class_valmom_mean(2*i-8-1,1);
end
mom_Cov = zeros(8,8);
for i = 1:4
    mom_Cov(i,i) = stock_valmom_std(2*i-1,1)^2;
end
for i = 5:8
    mom_Cov(i,i) = class_valmom_std(2*i-8-1,1)^2;
end
[mom__Chi] = T*Chitest([mom_mean],mom_Cov,8);

val_mean_eq = zeros(4,1);
for i = 1:4
    val_mean_eq(i,1) = stock_valmom_mean(2*i,1);
end
val_Cov_eq = zeros(4,4);
for i = 1:4
    val_Cov_eq(i,i) = stock_valmom_std(2*i,1)^2;
end
[val__Chi_eq] = T*Chitest([val_mean_eq],val_Cov_eq,4);

mom_mean_eq = zeros(4,1);
for i = 1:4
    mom_mean_eq(i,1) = stock_valmom_mean(2*i-1,1);
end
mom_Cov_eq = zeros(4,4);
for i = 1:4
    mom_Cov_eq(i,i) = stock_valmom_std(2*i-1,1)^2;
end
[mom__Chi_eq] = T*Chitest([mom_mean_eq],mom_Cov_eq,4);
%% c
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
trough_stock = zeros(8,1);
index_trough_stock = zeros(8,1);
peak_stock = zeros(8,1);
for i = 1:8
    [trough_stock(i,1),index_trough_stock(i,1)] = mink(stock_valmom(:,i),1);
    [peak_stock(i,1)] = maxk(stock_valmom(1:index_trough_stock(i,1),i),1);
end

%% d
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');

stock_valmom_std = nanstd(stock_valmom)';
class_valmom_std = nanstd(class_valmom)';
stock_class_Cov = zeros(1,16);
s = 0;
for i = 1:2:7
    s = s + 1/stock_valmom_std(i,1);
end
for i = 9:2:15
    s = s + 1/class_valmom_std(i-8,1);
end
w = zeros(16,1);
for i = 1:2:7
    w(i,1) = (1/stock_valmom_std(i,1)) / s;
end
for i = 9:2:15
    w(i,1) = (1/class_valmom_std(i-8,1))/s;
end
s2 = 0;
for i = 2:2:8
    s2 = s2 + 1/stock_valmom_std(i,1);
end
for i = 10:2:16
    s2 = s2 + 1/class_valmom_std(i-8,1);
end
w2 = zeros(16,1);
for i = 2:2:8
    w2(i,1) = (1/stock_valmom_std(i,1)) / s2;
end
for i = 10:2:16
    w2(i,1) = (1/class_valmom_std(i-8,1))/s2;
end
val_every = (w' * [stock_valmom';class_valmom'])';
mom_every = (w2' * [stock_valmom';class_valmom'])';

result_val_every = geta(val_every,1);
result_mom_every = geta(mom_every,1);

%% e
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
[valmom5050_1] = getvalmom5050(stock_valmom,class_valmom,T);
result_valmom5050 = geta(valmom5050_1,8);
% f
s = 0;
for i = 1:8
    s = s + 1/result_valmom5050.stock_valmom_std(i,1);
end
w = zeros(8,1);
for i = 1:8
    w(i,1) = (1/result_valmom5050.stock_valmom_std(i,1)) / s;
end
valmom_every = (w' * valmom5050_1')';
result_valmom_every = geta(valmom_every,1);

%% h
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
[Omega_TP,R,Sigma,a,b,c] = getefficientfrontier([stock_valmom class_valmom],16);
plot1g(a,b,c,R,Sigma,result_valmom5050.stock_valmom_mean,result_valmom5050.stock_valmom_std);
% i
[Omega_TP_even] = getoutofsampleefficientfrontier([stock_valmom class_valmom],16);
[Omega_TP_odd] = getoutofsampleefficientfrontier([stock_valmom(2:end,:) class_valmom(2:end,:)],16);

r_TP(1,1) = [stock_valmom(1,:) class_valmom(1,:)]*Omega_TP_odd;
for i = 3:2:T
    r_TP(i,1) = [stock_valmom(i,:) class_valmom(i,:)]*Omega_TP_odd;
    r_TP(i-1,1) = [stock_valmom(i-1,:) class_valmom(i-1,:)]*Omega_TP_even;
end
mu_TP = nanmean(r_TP);
sigma_TP = nanstd(r_TP);
plot1i(a,b,c,mu_TP, sigma_TP); 

%% j
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
Correlation = corrcoef([stock_valmom class_valmom],'rows','pairwise');

%% k
T = 527;
[stock_valmom,class_valmom] = loadStockData1('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');

stock_valmom_std = nanstd(stock_valmom)';
class_valmom_std = nanstd(class_valmom)';

[w] = getweights(stock_valmom_std,class_valmom_std);
r_other = [stock_valmom class_valmom]*w;
for i = 1:8    
    result(i,1) = FFpricing(stock_valmom(:,i),r_other(:,i));
end
for i = 9:16
    result(i,1) = FFpricing(class_valmom(:,i-8),r_other(:,i));
end
actual_mean = nanmean([stock_valmom class_valmom])';
other_mean = nanmean(r_other)';
for i = 1:16
    expected_mean(i,1) = result(i,1).beta'*[1;other_mean(i,1)];
end
plot1k(actual_mean,expected_mean);
%% l1, run d first
T = 492;
[stock_valmom,class_valmom] = loadStockData6('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
[rmrf,smb,hml,rf,umd,strev,ltrev] = loadStockData7('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
[val_every,mom_every] = loadStockData5('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
valmom = [stock_valmom class_valmom];
for i = 1:16
    result_1(i,1) = FFpricing(valmom(:,i),rmrf);
end
for i = 1:16
    result_2(i,1) = FFpricing(valmom(:,i),[rmrf smb hml umd]);
end
for i = 1:16
    result_3(i,1) = FFpricing(valmom(:,i),[rmrf val_every mom_every]);
end
    
[W_normal_1,p_1] = getGRS([stock_valmom class_valmom],16,[rmrf],rf,T,1);
[W_normal_2,p_2] = getGRS([stock_valmom class_valmom],16,[rmrf smb hml umd],rf,T,4);
[W_normal_3,p_3] = getGRS([stock_valmom class_valmom],16,[rmrf val_every mom_every],rf,T,3);
%% l2, run d first 
T = 336;
[stock_valmom_2,class_valmom_2,tsmom,tsmom_cm,tsmom_eq,tsmom_fi,tsmom_fx,rmrf,smb,hml,rf,umd,strev,ltrev,val_every_2,mom_every_2] = loadStockData3('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
% val_every_2 = val_every(157:end,1);
% mom_every_2 = mom_every(157:end,1);
valmom_2 = [stock_valmom_2 class_valmom_2];
for i = 1:16
    result_4(i,1) = FFpricing(valmom_2(:,i),[rmrf val_every_2 mom_every_2 tsmom]);
end
for i = 1:16
    result_5(i,1) = FFpricing(valmom_2(:,i),[rmrf val_every_2 mom_every_2 tsmom ltrev strev]);
end
[W_normal_4,p_4] = getGRS(valmom_2,16,[rmrf val_every_2 mom_every_2 tsmom],rf,T,4);
[W_normal_5,p_5] = getGRS(valmom_2,16,[rmrf val_every_2 mom_every_2 tsmom ltrev strev],rf,T,6);

%% m
T = 371;
[stock_valmom_2,class_valmom_2,tsmom,tsmom_cm,tsmom_eq,tsmom_fi,tsmom_fx,rmrf,smb,hml,rf,umd,strev,ltrev] = loadStockData3('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
% tsmom_eq on mom_eq
result(1,1) = FFpricing(tsmom_eq,class_valmom_2(:,2));
% tsmom_fx on mom_fx
result(2,1) = FFpricing(tsmom_fx,class_valmom_2(:,4));
% tsmom_fi on mom_fi
result(3,1) = FFpricing(tsmom_fi,class_valmom_2(:,6));
% tsmom_cm on mom_cm
result(4,1) = FFpricing(tsmom_cm,class_valmom_2(:,8));
% mom_eq on tsmom_eq
result(5,1) = FFpricing(class_valmom_2(:,2),tsmom_eq);
% mom_fx on tsmom_fx
result(6,1) = FFpricing(class_valmom_2(:,4),tsmom_fx);
% mom_eq on tsmom_fi
result(7,1) = FFpricing(class_valmom_2(:,6),tsmom_fi);
% mom_eq on tsmom_cm
result(8,1) = FFpricing(class_valmom_2(:,8),tsmom_cm);

%% n
% Jan 94 to Dec 12
T = 228;
[HFRI,DJCS,tsmom,rmrf,smb,hml,rf,umd,strev,ltrev,BAB, Qual, Carry,val_every,mom_every] = loadStockData8('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
hedge = [HFRI DJCS];
for i = 1:20
    result_1(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1)]);
end
for i = 1:20
    result_2(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1) rmrf(1:end-1,1)]);
end
for i = 1:20
    result_3(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1) rmrf(1:end-1,1) smb hml umd]);
end
for i = 1:20
    result_4(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1) rmrf(1:end-1,1) val_every mom_every]);   
end
for i = 1:20
    result_5(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1) rmrf(1:end-1,1) val_every mom_every tsmom]);
end
for i = 1:20
    result_6(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1) rmrf(1:end-1,1) val_every mom_every tsmom ltrev strev]);
end
for i = 1:20
    result_7(i,1) = FFpricing(hedge(:,i),[rmrf(2:end,1) rmrf(1:end-1,1) val_every mom_every tsmom ltrev strev BAB Qual Carry]);
end
%%
for i = 1:20
    alpha_2(i,:) = result_2(i).beta;
    alpha12(i,1) = alpha_2(i,1);
    t_2(i,:) = result_2(i).t;
    alpha12(i,2) = t_2(i,1);
    R2_2(i,:) = result_2(i).R2;
    alpha12(i,3) = R2_2(i,1);
end
alpha12 = alpha12';    
for i = 1:20
    alpha_3(i,:) = result_3(i).beta;
    alpha13(i,1) = alpha_3(i,1);
    t_3(i,:) = result_3(i).t;
    alpha13(i,2) = t_3(i,1);
    R2_3(i,:) = result_3(i).R2;
    alpha13(i,3) = R2_3(i,1);
end
alpha13 = alpha13'; 
for i = 1:20
    alpha_4(i,:) = result_4(i).beta;
    alpha14(i,1) = alpha_4(i,1);
    t_4(i,:) = result_4(i).t;
    alpha14(i,2) = t_4(i,1);
    R2_4(i,:) = result_4(i).R2;
    alpha14(i,3) = R2_4(i,1);
end
alpha14 = alpha14';
for i = 1:20
    alpha_5(i,:) = result_5(i).beta;
    alpha15(i,1) = alpha_5(i,1);
    t_5(i,:) = result_5(i).t;
    alpha15(i,2) = t_5(i,1);
    R2_5(i,:) = result_5(i).R2;
    alpha15(i,3) = R2_5(i,1);
end
alpha15 = alpha15'; 
for i = 1:20
    alpha_6(i,:) = result_6(i).beta;
    alpha16(i,1) = alpha_6(i,1);
    t_6(i,:) = result_6(i).t;
    alpha16(i,2) = t_6(i,1);
    R2_6(i,:) = result_6(i).R2;
    alpha16(i,3) = R2_6(i,1);
end
alpha16 = alpha16';
for i = 1:20
    alpha_7(i,:) = result_7(i).beta;
    alpha17(i,1) = alpha_7(i,1);
    t_7(i,:) = result_7(i).t;
    alpha17(i,2) = t_7(i,1);
    R2_7(i,:) = result_7(i).R2;
    alpha17(i,3) = R2_7(i,1);
end
alpha17 = alpha17'; 
%% o 
% Jan 1990 to Dec 2012
T = 276;
[rmrf,smb,strev,ltrev,BAB, Qual, Carry,val_every,mom_every] = loadStockData9('C:\Users\wc145\Desktop\ECON676\PS8\Problem_Set8.xls');
[Omega_TP,SR_TP,R,Sigma,a,b,c] = Ogetefficientfrontier([rmrf smb val_every mom_every BAB Qual Carry strev ltrev],9);
plot1o(a,b,c,R,Sigma);
% p
factor = [rmrf smb val_every mom_every BAB Qual Carry strev ltrev];
[Omega_TP_even] = getoutofsampleefficientfrontier(factor(1:end-1,:),9);
[Omega_TP_odd] = getoutofsampleefficientfrontier(factor(2:end,:),9);

r_TP(1,1) = factor(1,:)*Omega_TP_odd;
for i = 3:2:T
    r_TP(i,1) = factor(i,:)*Omega_TP_odd;
    r_TP(i-1,1) = factor(i-1,:)*Omega_TP_even;
end
mu_TP = nanmean(r_TP);
sigma_TP = nanstd(r_TP);
SR_TP_p = mu_TP/sigma_TP;
plot1i(a,b,c,mu_TP, sigma_TP);
















