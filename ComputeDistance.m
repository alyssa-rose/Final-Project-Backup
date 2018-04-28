function dist = ComputeDistance(dMat, centerVec)
% function dist = ComputeDistance(dMat, centerVec)
% computes Euclidian distance from each data vector to the vector centerVec 
% Inputs:  dMat (data matrix, size nFeat x nMeas), centerVec (vector, size 
%          nFeat x 1)
% Output: dist (1 x nMeas vector of Euclidian distances)
%
% code author: sid hillwig, 4.15.2018
dist = sqrt(sum((dMat-centerVec).^2));
return
