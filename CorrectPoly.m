function [polyOrder,yFit,rSq] = CorrectPoly(x,y)
rSq = zeros(1,7);
yAvg = mean(y);
ssTot = sum((y - yAvg).^2);
for k = 1:7
    z = k + 1;
    A = zeros(length(x),z);
    A(:,(1:z)) = x.^(k:-1:0);
    condNum = cond(A);
    coeff1 = A\y;
    yFit(:,k) = A*coeff1;
    ssRes = sum((y - yFit(:,k)).^2);
    rSq(k) = [1-(ssRes./ssTot)];
end
[m,I] = max(rSq);
rSq = m
polyOrder = I
yFit = yFit(:,I)
return