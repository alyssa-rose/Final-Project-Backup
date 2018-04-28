function ixClusIDs = ReassignClusters(dist)
% function ixClusIDs = ReassignClusters(dist) assigns each cluster to closest center
% Input: dist (matrix of distances to cluster centers, size nClus x nMeas)
% Output ixClusIDs (vector of assigned cluster indices, length nMeas)
%
% code author: sid hillwig, 4.15.2018
[~,ixClusIDs] = min(dist);
return


