function [yPredic] = ExtrapData(coeff, xPredic,polyOrder)

[m,n] = size(coeff)
if n~=1
    coeff = coeff'
end
xPredic = xPredic(:)
B = zeros(length(xPredic), polyOrder+1);
B(:,(1:(polyOrder+1))) = xPredic.^(polyOrder:-1:0);

yPredic = B * coeff
return