function [yPredic, xPredic, yFit,coeff,condNum,rSq]=DataFit(x1,y1,isPlotted)
%{
Creates a fit for polynomial functions using given x,y and desired
poly order values and outputs a fitted graph, coeff matrix, condition
number and the R^2 value for the fit
%}

%% checks if vectors meet requirements
if length(x1)~=length(y1) 
    yFit = NaN;
    coeff = NaN;
    condNum = NaN;
    rSq = NaN;
    return
end

x = x1 - mean(x1);
y = y1 - mean(y1);

%% sets up A and solves for coeff
%forces x,y to be columns
y = y(:)
x = x(:)

[polyOrder,yFit,rSq] = CorrectPoly(x,y)
%%
z = polyOrder + 1;
A = zeros(length(x), polyOrder+1);
A(:,(1:z)) = x.^(polyOrder:-1:0);
condNum = cond(A);
coeff = A\y;

%finds yFit
yFit = A*coeff;
xPredic = str2num(input('input year range: ','s'))
xPredic = xPredic - mean(x1)
[yPredic] = ExtrapData(coeff,xPredic,polyOrder)

xNew = [x;xPredic(:)]
yNew = [y;yPredic]

%%
if isPlotted ==1
    figure(1)
    hold on
    plot(xNew,yNew,'mo')
    title(sprintf('Poly order %i , R^2 = %1.4f', polyOrder,rSq))
    xlabel('Independent Variable')
    ylabel('Dependent Variable')
    hold off
end
end
