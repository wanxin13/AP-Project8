function [w] = getweights(stock_valmom_std,class_valmom_std)

w = zeros(16,16);
for k = 1:2:15
    s(k,1) = 0;
        for i = 1:8
            if i ~= k && i ~= k+1
                s(k,1) = s(k,1) + 1/stock_valmom_std(i,1);
            end
        end
        for i = 9:16
            if i~= k  && i ~= k+1
                s(k,1) = s(k,1) + 1/class_valmom_std(i-8,1);
            end
        end
        for i = 1:8
            if i ~= k && i ~= k+1
                w(i,k) = (1/stock_valmom_std(i,1)) / s(k,1);
            end
        end
        for i = 9:16
            if i ~= k && i ~= k+1
                w(i,k) = (1/class_valmom_std(i-8,1))/s(k,1);
            end
        end
end
for k = 2:2:16
    s(k,1) = 0;
        for i = 1:8
            if i ~= k && i ~= k-1
                s(k,1) = s(k,1) + 1/stock_valmom_std(i,1);
            end
        end
        for i = 9:16
            if i~= k  && i ~= k-1
                s(k,1) = s(k,1) + 1/class_valmom_std(i-8,1);
            end
        end
        for i = 1:8
            if i ~= k && i ~= k-1
                w(i,k) = (1/stock_valmom_std(i,1)) / s(k,1);
            end
        end
        for i = 9:16
            if i ~= k && i ~= k-1
                w(i,k) = (1/class_valmom_std(i-8,1))/s(k,1);
            end
        end
end