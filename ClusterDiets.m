% script ClusterDiets creates matrices for diet groups Carb-Protein-Lipid
% (CPL) and beverages (Bev), performs clustering functions on them, and
% plots the clusters in 3D
%
% code author: sid hillwig
Par.nClus = 7;
Par.maxIter = 100;
%% Carbohydrate, Protein, Lipid Clustering
areaCPL = cell2mat(struct2cell(CreateGroups(area,'cpl'))); % creates groups for carbs, proteins, lipids
[ClusInfoCPL,~] = KmeansWrapper(areaCPL,Par,5);

labelCPL = struct('title','Carb-Protein-Lipid Diet Analysis','x','Carbohydrates'...
    ,'y','Proteins','z','Lipids');
Plot3DClusters(areaCPL,ClusInfoCPL,2,labelCPL)

%% Beverage Clustering
areaBev = CreateGroups(area,'bev');
bev = areaBev.alcohol; % all the same length, choice of beverage arbitrary
invalid = zeros(1,length(bev)); 
for k = (1:length(area)) % looping through all areas
    if areaBev(k).alcohol == invalid | areaBev(k).coffee == invalid | areaBev(k).tea == invalid % checking if row is all zeros
        areaBev(k).alcohol = [];
        areaBev(k).coffee = [];
        areaBev(k).tea = [];
    end
end
areaBev = cell2mat(struct2cell(areaBev)); % creates groups for beverages
[ClusInfoBev,~] = KmeansWrapper(areaBev,Par,5);

labelBev = struct('title','Beverage Diet Analysis','x','Alcohol'...
    ,'y','Coffee','z','Tea');
Plot3DClusters(areaBev,ClusInfoBev,3,labelBev)