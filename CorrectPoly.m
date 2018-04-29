function [polyOrder,yFit,rSq] = CorrectPoly(x,y)
%{
function [polyOrder,yFit,rSq] = CorrectPoly(x,y)
uses basic idea of DataFit to determine the correct poly order
to use for a data fit

Alyssa Rose  Final Project 04-29-18
%}

rSq = zeros(1,5);
yAvg = mean(y);
ssTot = sum((y - yAvg).^2);
for k = 1:5
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
