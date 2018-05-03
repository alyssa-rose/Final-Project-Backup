function [yPredic, xPredic, yFit,coeff,condNum,rSq]=DataFit2(x1,y1,isPlotted,xPredic)
%{
function [yPredic, xPredic, yFit,coeff,condNum,rSq]=DataFit(x1,y1,isPlotted)

creates a fit for the data using a correct order polynomial 
calling CorrectPoly and extrapolates the data by calling ExtrapData

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
f = find(y1,1,'first');
x = x1(f:end);
y = y1(f:end); 

%% sets up A and solves using correct poly order
%forces x,y to be columns
y = y(:);
x = x(:);
[polyOrder,yFit,rSq] = CorrectPoly(x,y);
%%
z = polyOrder + 1;
A = zeros(length(x), polyOrder+1);
A(:,(1:z)) = x.^(polyOrder:-1:0);
condNum = cond(A);
coeff = A\y;

[yPredic] = ExtrapData(coeff,xPredic,polyOrder);


if isPlotted ==1
    PredicGraph = figure(2)
    plot(x1,y1,'b-',xPredic(:),yPredic,'mo');
    title(sprintf('Poly order %i , R^2 = %1.4f', polyOrder,rSq));
    xlabel('Years');
    ylabel('Food (in tonnes)');
    savefig('PredicGraph')
end
end
