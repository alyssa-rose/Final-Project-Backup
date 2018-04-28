function ClusInfo = KmeansCore(dMat,Par)
% function ClusInfo = KmeansCore(dMat,Par) main K-means (in extra credit, 
% also K-medians!) clustering routine
% Inputs: dMat (data matrix, size nFeat x nMeas), Par (parameter structure,
%       with fields:
%       Par.nClus:  number of clusters
%       Par.maxIter:  max iterations to run algorithm
%       Par.isMedian:  update method: mean or median)
%
% Output:
%   ClusInfo (output structure, with fields: 
%       ClusInfo.clusIds: vector of cluster assignments, length nSamp
%       ClusInfo.centerVecs: matrix of cluster center vectors, 
%           size nFeat x nClus
%       ClusInfo.sumDist:  summed total distance to assigned clusters,
%       length # iterations)
% 
% code author: sid hillwig, 4.15.2018
% initializing cluster centers
centerVecs = InitializeCenters(dMat,Par.nClus);

% improving cluster centers for categorizing...
cnt = 1;
isConverged = 0; % assume false
while isConverged == 0
    centerVecsOld = centerVecs;
    % computing dist
    distVec = [];
    for k = (1:Par.nClus)
        distVec = [distVec; ComputeDistance(dMat,centerVecs(:,k))];
    end
    % reassigning cluster centers
    ixClusIDs = ReassignClusters(distVec);
    % summing new distances
    sumDist(cnt) = [GetSummedDistances(distVec,ixClusIDs)];
    % updating cluster centers
    centerVecs = UpdateClusterCenters(dMat,ixClusIDs,Par.nClus);
    % checking convergence
    isConverged = CheckConvergence(centerVecs,centerVecsOld,cnt,Par.maxIter);
    cnt = cnt + 1; % increasing count
end
% copying results to output structure
ClusInfo.clusIds = ixClusIDs;
ClusInfo.centerVecs = centerVecs;
ClusInfo.sumDist = sumDist;
return
