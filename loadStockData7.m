function [rmrf,smb,hml,rf,umd,strev,ltrev] = loadStockData7(path)

% 6 factors from Jan 1972 to Dec 2012

rmrf = xlsread(path,3,'B548:B1039');
smb = xlsread(path,3,'C548:C1039');
hml = xlsread(path,3,'D548:D1039');
rf = xlsread(path,3,'E548:E1039');
umd = xlsread(path,3,'F548:F1039');
strev = xlsread(path,3,'G548:G1039');
ltrev = xlsread(path,3,'H548:H1039');