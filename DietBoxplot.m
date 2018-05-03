function DietBoxplot(ClusInfo,areaDiet,clusChoice,dietMarker)
% function DietBoxplot(ClusInfo,areaDiet,clusChoice) creates a 1x3 boxplot
% in a figure for the data given by areaDiet and ClusInfo corresponding to
% clusChoice
% inputs: ClusInfo (struct of cluster info from ClusterDiets, either ClusInfoCPL
%         or ClusInfoBev); areaDiet (matrix of data, either areaCPL or
%         areaBev); clusChoice (numeric choice of which cluster to analyze,
%         1 through 7); dietMarker (string that marks which diet analyzed)
%
% code author: sid hillwig
groupedData = cell(1,length(unique(ClusInfo.clusIds)));
for i = (1:length(unique(ClusInfo.clusIds)))
    clusIn = find(ClusInfo.clusIds==i);
    [~,J,K] = ind2sub(size(ClusInfo.clusIds),clusIn);
    clusVals = zeros(3,length(clusIn));
    for t = (1:length(clusVals))
        clusVals(:,t) = areaDiet(:,J(t),K(t));
    end
    groupedData{i} = clusVals;
end
if strcmpi(dietMarker,'cpl')
    labels = {'Carbohydrates', 'Proteins', 'Lipids'};
elseif strcmpi(dietMarker,'bev')
    labels = {'Alcohol', 'Coffee', 'Tea'};
else
    fprintf('Invalid diet marker. Please enter ''cpl'' or ''bev''\n')
end
figure(4)
for n = (1:3) 
    subplot(1,3,n)
    boxplot(groupedData{clusChoice}(n,:),'Notch','on')
    title(sprintf('%s',labels{n}))
    if n == 1
        ylabel(sprintf('Cluster %i',clusChoice))
    end
end
fprintf('\n***Note: All quartile values are in terms of percentage of entire diet***\n')
if strcmpi(dietMarker,'cpl')
    Carbs = groupedData{clusChoice}(1,:);
    Carb25Q = quantile(Carbs,.25);
    Carb50Q = quantile(Carbs,.5);
    Carb75Q = quantile(Carbs,.75);
    fprintf('Carbohydrate quartiles for cluster %i: %0.3f (25th), %0.3f (50th), %0.3f (75th)\n',...
        clusChoice,Carb25Q,Carb50Q,Carb75Q)

    Prots = groupedData{clusChoice}(2,:);
    Prot25Q = quantile(Prots,.25);
    Prot50Q = quantile(Prots,.5);
    Prot75Q = quantile(Prots,.75);
    fprintf('Protein quartiles for cluster %i: %0.3f (25th), %0.3f (50th), %0.3f (75th)\n',...
        clusChoice,Prot25Q,Prot50Q,Prot75Q)

    Lips = groupedData{clusChoice}(3,:);
    Lip25Q = quantile(Lips,.25);
    Lip50Q = quantile(Lips,.5);
    Lip75Q = quantile(Lips,.7);
    fprintf('Lipid quartiles for cluster %i: %0.3f (25th), %0.3f (50th), %0.3f (75th)\n',...
        clusChoice,Lip25Q,Lip50Q,Lip75Q)
elseif strcmpi(dietMarker,'bev')
    Alc = groupedData{clusChoice}(1,:);
    Alc25Q = quantile(Alc,.25);
    Alc50Q = quantile(Alc,.5);
    Alc75Q = quantile(Alc,.7);
    fprintf('Alcohol quartiles for cluster %i: %0.3f (25th), %0.3f (50th), %0.3f (75th)\n',...
        clusChoice,Alc25Q,Alc50Q,Alc75Q)
    
    Cof = groupedData{clusChoice}(2,:);
    Cof25Q = quantile(Cof,.25);
    Cof50Q = quantile(Cof,.5);
    Cof75Q = quantile(Cof,.7);
    fprintf('Coffee quartiles for cluster %i: %0.3f (25th), %0.3f (50th), %0.3f (75th)\n',...
        clusChoice,Cof25Q,Cof50Q,Cof75Q)
    
    Tea = groupedData{clusChoice}(3,:);
    Tea25Q = quantile(Tea,.25);
    Tea50Q = quantile(Tea,.5);
    Tea75Q = quantile(Tea,.7);
    fprintf('Tea quartiles for cluster %i: %0.3f (25th), %0.3f (50th), %0.3f (75th)\n',...
        clusChoice,Tea25Q,Tea50Q,Tea75Q)
else
    fprintf('Invalid diet marker. Please enter ''cpl'' or ''bev''\n')
end
return