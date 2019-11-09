function [valmom5050_1] = getvalmom5050(stock_valmom,class_valmom,T)

valmom5050 = zeros(T,16);
for i = 1:2:7
    valmom5050(:,i) = (1/2)*stock_valmom(:,i) + (1/2)*stock_valmom(:,i+1);
end
for i = 9:2:15
    valmom5050(:,i) = (1/2)*class_valmom(:,i-8) + (1/2)*class_valmom(:,i-7);
end
valmom5050_1 = zeros(T,8);
for i = 1:8
    valmom5050_1(:,i) = valmom5050(:,2*i-1);
end