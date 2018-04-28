function centerVecs = UpdateClusterCenters(dMat,ixClus,nClus,isMedian)
% function centerVecs = UpdateClusterCenters(dMat,ixClus,nClus, isMedian) computes
% new cluster centers, based on most recent cluster assignments
% Inputs: dMat (data matrix, size nFeat x nMeas), ixClus (vector of cluster
%         # assigned to each example, length nMeas), nClus (total number of
%         clusters), isMedian (optional logical variable)
% Output: centerVecs (updated cluster center vectors, size nFeat x nClus)
%
% code author: sid hillwig, 4.15.2018
[r,~] = size(dMat);
centerVecs = zeros(r,nClus); % preallocation
for n = (1:nClus)
    centerVecs(:,n) = mean(dMat(:,ixClus==n),2); % computing mean over columns
end
return



