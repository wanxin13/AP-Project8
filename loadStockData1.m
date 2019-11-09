function [stock_valmom,class_valmom] = loadStockData1(path)

% val, mom for 4 markets and 4 asset classes from Jan 1972 to Nov 2015

stock_valmom = xlsread(path,1,'B6:I532');
class_valmom = xlsread(path,1,'J6:Q532');
