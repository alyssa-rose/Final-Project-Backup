function [yPredic, xPredic, yFit,coeff,condNum,rSq]=DataFit(x1,y1,isPlotted,xPredic)
%{
function [yPredic, xPredic, yFit,coeff,condNum,rSq]=DataFit(x1,y1,isPlotted)

creates a fit for the data using a correct order polynomial 
calling CorrectPoly and extrapolates the data by calling EctrapData

Alyssa Rose  Final Project  04-29-18
%}

%% checks if vectors meet requirements
if length(x1)~=length(y1) 
    yFit = NaN;
    coeff = NaN;
    condNum = NaN;
    rSq = NaN;
    return
end

% shifts the data for a better R squared number
f = find(y1,1,'first')
x = x1(f:end) - mean(x1(f:end));
y = y1(f:end) - mean(y1(f:end));

%% sets up A and solves using correct poly order
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

xPredic = xPredic - mean(x1(f:end))
[yPredic] = ExtrapData(coeff,xPredic,polyOrder)
% m=1
% while m < length(yPredic)+1
%     if yPredic(m)<0
%         yPredic(m) = 0
%     else
%         yPredic(m) = yPredic(m)
%     end
%     m=m+1;
% end
%%
xPredic = xPredic-mean(x);
yPredic = yPredic-mean(y);
if isPlotted ==1
    figure(1)
    hold on
    %,xPredic(:),yPredic,'mo'
    plot(x,y,'b-',xPredic(:),yPredic,'mo')
    title(sprintf('Poly order %i , R^2 = %1.4f', polyOrder,rSq))
    xlabel('Independent Variable')
    ylabel('Dependent Variable')
    hold off
end
end
