function [yPredic] = ExtrapData(coeff, xPredic,polyOrder)
%{
[yPredic] = ExtrapData(coeff, xPredic,polyOrder)
Extrapolates data given a poly order and year range for extrapolation

Alyssa Rose  Final Project  04-29-18
%}
[m,n] = size(coeff);
if n~=1
    coeff = coeff'
end
xPredic = xPredic(:);
B = zeros(length(xPredic), polyOrder+1);
B(:,(1:(polyOrder+1))) = xPredic.^(polyOrder:-1:0);

yPredic = B * coeff;
return
