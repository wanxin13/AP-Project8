function [Chi] = Chitest(r,V,n)

R = zeros(n-1,n);
for i = 1:n-1
        R(i,i) = 1;
        R(i,i+1) = -1;
end

Chi = (R*r)'*inv(R*V*R')*(R*r);