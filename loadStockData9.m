function [rmrf,smb,strev,ltrev,BAB, Qual, Carry,val_every,mom_every] = loadStockData9(path)

% val, mom for 4 markets and 4 asset classes from Jan 1990 to Dec 2012


rmrf = xlsread(path,3,'B764:B1039');
smb = xlsread(path,3,'C764:C1039');
strev = xlsread(path,3,'G764:G1039');
ltrev = xlsread(path,3,'H764:H1039');

BAB = xlsread(path,4,'B767:B1042');
Qual = xlsread(path,4,'C767:C1042');
Carry = xlsread(path,4,'D767:D1042');

val_every = xlsread(path,5,'B221:B496');
mom_every = xlsread(path,5,'C221:C496');