function centerVecs = InitializeCenters(dMat,nClus)
%function centerVecs = InitializeCenters(dMat,nClus)randomly picks nClus 
% vectors out of dMat as starting guess for centerVecs
% Inputs: dMat (data matrix, size nFeat x nMeas), nClus (number of clusters
%         to form)
% Outputs:  centerVecs (matrix of size nFeat x nClus)
%
% code author: sid hillwig, 4.15.2018
[~,c] = size(dMat);
randIn = randperm(c,nClus); % random indices
centerVecs = dMat(:,randIn);
return



