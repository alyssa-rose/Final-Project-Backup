function sumDist = GetSummedDistances(dist,clusIds)
% function sumDist = GetSummedDistances(dist,clusIds) sums up the distance 
% from every data vector to its assigned cluster center.
% Inputs: dist (nClus x nMeas matrix of distances to cluster centers),
%         clusIds (cluster number assigned to each example (length nMeas))
% Output: sumDist (scalar (1x1) holding summed distances from each
%         measurement to its corresponding cluster center)
%
% code author: sid hillwig, 4.15.2018
sumDist = 0;
for j = (1:length(clusIds))
    sumDist = sumDist + dist(clusIds(j),j); % summing distances between points and their IDs
end
return
