function [stock_valmom,class_valmom,tsmom,tsmom_cm,tsmom_eq,tsmom_fi,tsmom_fx,rmrf,smb,hml,rf,umd,strev,ltrev] = loadStockData4(path)

% val, mom for 4 markets and 4 asset classes from Jan 1972 to Nov 2015

stock_valmom = xlsread(path,1,'B162:I532');
class_valmom = xlsread(path,1,'J162:Q532');

tsmom = xlsread(path,2,'B4:B374');
tsmom_cm = xlsread(path,2,'B4:B374');
tsmom_eq = xlsread(path,2,'B4:B374');
tsmom_fi = xlsread(path,2,'B4:B374');
tsmom_fx = xlsread(path,2,'B4:B374');

rmrf = xlsread(path,3,'B704:B1074');
smb = xlsread(path,3,'C704:C1074');
hml = xlsread(path,3,'D704:D1074');
rf = xlsread(path,3,'E704:E1074');
umd = xlsread(path,3,'F704:F1074');
strev = xlsread(path,3,'G704:G1074');
ltrev = xlsread(path,3,'H704:H1074');