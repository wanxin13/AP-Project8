function [rmrf,smb,hml,rf,umd,strev,ltrev] = loadStockData2(path)

% 6 factors from Jan 1972 to Nov 2015

rmrf = xlsread(path,3,'B548:B1074');
smb = xlsread(path,3,'C548:C1074');
hml = xlsread(path,3,'D548:D1074');
rf = xlsread(path,3,'E548:E1074');
umd = xlsread(path,3,'F548:F1074');
strev = xlsread(path,3,'G548:G1074');
ltrev = xlsread(path,3,'H548:H1074');