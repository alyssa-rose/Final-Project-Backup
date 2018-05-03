function Plot3DClusters(dMat,ClusInfo,figNum,label)
% function Plot3DClusters(dMat,ClusInfo,figNum,label) creates a 3D plot of clusters
% inputs: dMat (3D array of data); ClusInfo (struct of cluster info);
%         figNum (numeric to specify figure number);
%         label (struct of title and axes labels)
%
% code author: sid hillwig
figure(figNum)
Colors = parula(length(unique(ClusInfo.clusIds)));
% Credit: Elad Kivelevitch (MathWorks File Exchange,"PlotClusters(Data,I?DX,Centers,Colors)")
% (Code edited for this project by code author above)
for i = 1:length(unique(ClusInfo.clusIds))
    clusIn = find(ClusInfo.clusIds == i);
    [~,J,K] = ind2sub(size(ClusInfo.clusIds),clusIn); % getting correct dimensional indices
    for j = (1:length(clusIn)) % iteratively plotting points -- this takes a long time
        scatter3(dMat(1,J(j),K(j)),dMat(2,J(j),K(j)),dMat(3,J(j),K(j)),4,Colors(i,:))
        hold on % (Points must be plotted iteratively because number of cluster members not equal
    end
end
hold off
title(sprintf('%s',label.title))
xlabel(sprintf('%s',label.x))
ylabel(sprintf('%s',label.y))
zlabel(sprintf('%s',label.z))
