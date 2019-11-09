function [HFRI,DJCS,tsmom,rmrf,smb,hml,rf,umd,strev,ltrev,BAB, Qual, Carry,val_every,mom_every] = loadStockData8(path)

% val, mom for 4 markets and 4 asset classes from Jan 1994 to Dec 2012

HFRI = xlsread(path,6,'B51:K278');
DJCS = xlsread(path,6,'M51:V278');

tsmom = xlsread(path,2,'B112:B339');

rmrf = xlsread(path,3,'B811:B1039');
smb = xlsread(path,3,'C812:C1039');
hml = xlsread(path,3,'D812:D1039');
rf = xlsread(path,3,'E812:E1039');
umd = xlsread(path,3,'F812:F1039');
strev = xlsread(path,3,'G812:G1039');
ltrev = xlsread(path,3,'H812:H1039');

BAB = xlsread(path,4,'B815:B1042');
Qual = xlsread(path,4,'C815:C1042');
Carry = xlsread(path,4,'D815:D1042');

val_every = xlsread(path,5,'B269:B496');
mom_every = xlsread(path,5,'C269:C496');