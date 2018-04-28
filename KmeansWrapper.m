function [GoodClusInfo,BadClusInfo] = KmeansWrapper(dMat,Par,nRepeats)
% function [GoodClusInfo,BadClusInfo] = KmeansWrapper(dMat,Par,nRepeats)
% wrapper code to run KmeansCore repeatedly and find best and worst
% results, as measured by the final summed distance for each run
% Inputs:  
%   dMat, Par: same as KmeansCore (see help there)
%   nRepeats:  number of times to repeat kmeans 
% Outputs:
%   GoodClusInfo:  output of KmeansCore that has the minimum 
%      summed distance between each vector and its assigned center
%   BadClusInfo:  output of KmeansCore that has the maximum 
%      summed distance between each vector and its assigned center
% 
% code author: sid hillwig, 4.15.2018

% loop nRepeats times, call KmeansCore, store results in cell array,
% and build up vector holding last value in sumDist vector each time
sumDistFinal = zeros(1,nRepeats);
ClusInfoCell = cell(nRepeats,3); % nRepeats by 3-field cell
for n = (1:nRepeats)
    ClusInfo = KmeansCore(dMat,Par);
    ClusInfoCell(n,:) = struct2cell(ClusInfo);
    sumDistFinal(n) = ClusInfo.sumDist(end);
end
fields = {'clusIds','centerVecs','sumDist'};
% find best k-means output, copy result to output
[~,minIn] = min(sumDistFinal);
GoodClusInfo = cell2struct(ClusInfoCell(minIn,:),fields,2);
% find worst k-means output, copy result to output
[~,maxIn]= max(sumDistFinal);
BadClusInfo = cell2struct(ClusInfoCell(maxIn,:),fields,2);
return