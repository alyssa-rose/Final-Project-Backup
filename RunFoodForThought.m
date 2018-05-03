% script RunDietForThought is the main script that executes the final
% project between Alyssa Rose and Sid Hillwig for Sid's portion of Understanding
% the World's Habits.
% date: 05/03/2018
% 
% code author: sid hillwig

%% Read in data
clear all
fprintf('Please be patient while program initalizes...\n')
ReadData
%% Cluster Diets & Analyze (This takes about 2 minutes!!)
ClusterDiets
dietDetailsCPL = AnalyzeDiets(area,ClusInfoCPL);
dietDetailsBev = AnalyzeDiets(area,ClusInfoBev);
pause(5)
%%
fprintf('Thank you for waiting!\n\n')
dietChoice = input('Which diet do you want to analyze?\nCPL (Carb-Protein-Lipid)\nBev (Beverages)\n[User]: ','s');
clusChoice = input('\nWhich cluster do you want to analyze? (1 through 7)\n[User]: ');
if strcmpi(dietChoice,'CPL')
    DietBoxplot(ClusInfoCPL,areaCPL,clusChoice,'cpl')
    dietDetails = dietDetailsCPL;
elseif strcmpi(dietChoice,'Bev')
    DietBoxplot(ClusInfoBev,areaBev,clusChoice,'bev')
    dietDetails = dietDetailsBev;
else
    fprintf('Invalid response. Please choose ''CPL'' or ''Bev''\n')
end
fprintf('\n\tTable of names in cluster %i\n\n',clusChoice)
disp(dietDetails(clusChoice).clusNames)
fprintf('--------------------------------------------\n\n')
