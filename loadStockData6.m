function [stock_valmom,class_valmom] = loadStockData6(path)

% val, mom for 4 markets and 4 asset classes from Jan 1972 to Dec 2012

stock_valmom = xlsread(path,1,'B6:I497');
class_valmom = xlsread(path,1,'J6:Q497');