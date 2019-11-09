function [val_every,mom_every] = loadStockData5(path)

% AMP factors from Jan 1972 to Dec 2012

val_every = xlsread(path,5,'B5:B496');
mom_every = xlsread(path,5,'C5:C496');
