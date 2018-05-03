function dietDetails = AnalyzeDiets(area,ClusInfo)
% function dietDetails = AnalyzeDiets(ClusInfo) extracts the center vectors for diet
% groups and the latitudes/longitudes of the areas belonging to the
% clusters
% inputs: area (structure of data with fields:) (created by ReadData.m)
%         name (name of area)
%         lat (latitude)
%         long (longitude)
%         [food groups] (individual fields for the food groups);
%         ClusInfo (structure of cluster information with fields:) (created
%         by ClusterDiets.m)
%         clusIds (matrix with ids of clusters for each point)
%         centerVecs (vector of center points for each cluster)
%         sumDist (vector of summed distances of points to their cluster
%         centers);
% output: dietDetails (structure with fields:)
%         typicalPoint (vector of points "typical" for a cluster)
%         yearlyClus (nYears x nAreas matrix of cluster ids)
%         likelyClusIds (vector of cluster id most often for an area,
%         nAreas in length)
%         (z).clusAreasLat (vector containing latitudes of areas of cluster
%         n)
%         (z).clusAreasLong (vector containing longitudes of areas of cluster
%         n)
%
% code author: sid hillwig
dietDetails.typicalPoint = ClusInfo.centerVecs;
yearlyClus = zeros(length(ClusInfo.clusIds(:,:,1)),length(ClusInfo.clusIds));
for k = (1:length(ClusInfo.clusIds))
    yearlyClus(:,k) = ClusInfo.clusIds(:,:,k)';
end
dietDetails.yearlyClus = yearlyClus;
dietDetails.likelyClusIds = mode(yearlyClus);
for n = (1:length(ClusInfo.centerVecs))
    likelyClus = dietDetails.likelyClusIds;
    inClusN = likelyClus == n;
    clusIn = [];
    for p = (1:length(inClusN))
        if inClusN(p)
            clusIn = [clusIn p];
        end
    end
    dietDetails(n).clusAreasLat = [area(clusIn).lat];
    dietDetails(n).clusAreasLong = [area(clusIn).long];
    areaNamesInClus = cell(length(clusIn),1);
    for ii = (1:length(clusIn))
        areaNamesInClus(ii) = {area(clusIn(ii)).name};
        if isempty(clusIn)
            areaNamesInClus(ii) = {'No areas in this cluster'};
        end
    end 
    dietDetails(n).clusNames = table(areaNamesInClus);
end
return