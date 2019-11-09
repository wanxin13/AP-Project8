function [stock_valmom,class_valmom,tsmom,tsmom_cm,tsmom_eq,tsmom_fi,tsmom_fx,rmrf,smb,hml,rf,umd,strev,ltrev,val_every,mom_every] = loadStockData3(path)

% val, mom for 4 markets and 4 asset classes from Jan 1985 to Dec 2012

stock_valmom = xlsread(path,1,'B162:I497');
class_valmom = xlsread(path,1,'J162:Q497');

tsmom = xlsread(path,2,'B4:B339');
tsmom_cm = xlsread(path,2,'B4:B339');
tsmom_eq = xlsread(path,2,'B4:B339');
tsmom_fi = xlsread(path,2,'B4:B339');
tsmom_fx = xlsread(path,2,'B4:B339');

rmrf = xlsread(path,3,'B704:B1039');
smb = xlsread(path,3,'C704:C1039');
hml = xlsread(path,3,'D704:D1039');
rf = xlsread(path,3,'E704:E1039');
umd = xlsread(path,3,'F704:F1039');
strev = xlsread(path,3,'G704:G1039');
ltrev = xlsread(path,3,'H704:H1039');

val_every = xlsread(path,5,'B161:B496');
mom_every = xlsread(path,5,'C161:C496');