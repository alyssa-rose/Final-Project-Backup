function Plot3DClusters(dMat,ClusInfo,figNum,label)
% function Plot3DClusters(ClusInfo,figNum) creates a 3D plot of clusters
% inputs: dMat (3D array of data); ClusInfo (struct of cluster info);
%         figNum (numeric to specify figure number);
%         label (struct of title and axes labels)
%
% code author: sid hillwig
figure(figNum)
Colors = parula(length(unique(ClusInfo.clusIds)));

for i = 1:length(unique(ClusInfo.clusIds))
    clusIn = find(ClusInfo.clusIds == i);
    [~,J,K] = ind2sub(size(ClusInfo.clusIds),clusIn);
    for j = (1:length(clusIn))
        scatter3(dMat(1,J(j),K(j)),dMat(2,J(j),K(j)),dMat(3,J(j),K(j)),4,Colors(i,:))
        hold on 
    end
end
hold off
title(sprintf('%s',label.title))
xlabel(sprintf('%s',label.x))
ylabel(sprintf('%s',label.y))
zlabel(sprintf('%s',label.z))
