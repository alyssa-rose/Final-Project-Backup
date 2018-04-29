% script ClusterDiets [does]
%
% code author: sid hillwig
Par.nClus = 7;
Par.maxIter = 100;
%% Carbohydrate, Protein, Lipid Clustering
areaCPL = cell2mat(struct2cell(CreateGroups(area,'cpl'))); % creates groups for carbs, proteins, lipids
[ClusInfoCPL,~] = KmeansWrapper(areaCPL,Par,20);

labelCPL = struct('title','Carb-Protein-Lipid Diet Analysis','x','Carbohydrates'...
    ,'y','Proteins','z','Lipids');
Plot3DClusters(areaCPL,ClusInfoCPL,2,labelCPL)

%% Beverage Clustering
areaBev = cell2mat(struct2cell(CreateGroups(area,'bev'))); % creates groups for beverages
[ClusInfoBev,~] = KmeansWrapper(areaBev,Par,20);

labelBev = struct('title','Beverage Diet Analysis','x','Alcohol'...
    ,'y','Coffee','z','Tea');
Plot3DClusters(areaBev,ClusInfoBev,3,labelBev)