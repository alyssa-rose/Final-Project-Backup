% script ClusterDiets [does]
%
% code author: sid hillwig
Par.nClus = 7;
Par.maxIter = 100;
%% Carbohydrate, Protein, Lipid Clustering
areaCPL = cell2mat(struct2cell(CreateGroups(area,'cpl'))); % creates groups for carbs, proteins, lipids
ClusInfoCPL = KmeansCore(areaCPL,Par);
figure(1)
%gscatter(areaCPL(1,:,:),areaCPL(2,:,:),areaCPL(3,:,:),ClusInfoCPL)
Colors = parula(7) ; 
for i = 1:7 
    logMat = find(ClusInfoCPL.clusIds == i) ; 
    scatter3(areaCPL(logMat,1), areaCPL(logMat, 2), areaCPL(logMat,3), 2, Colors(i,:),'.') 
    hold on 
end
xlabel('Carbohydrates')
ylabel('Protein')
zlabel('Lipids')
%% Beverage Clustering
areaBev = cell2mat(struct2cell(CreateGroups(area,'bev'))); % creates groups for beverages
ClusInfoBev = KmeansCore(areaBev,Par);