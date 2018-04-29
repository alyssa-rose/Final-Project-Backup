% script to read in food data
T = readtable('dataFinal-v.3.xlsx','Range','B1:W397');
%% forming structures
areaCodes = unique(T{:,1}); % is an array
foodGroups = T{:,2}(1:end); % is a cell
areaNames = unique(T{:,3}); % is a cell
lat = unique(T{:,4}); % is an array
long = unique(T{:,5}); % is an array
foodData = T{:,6:end}; % is an array

for j = (1:length(areaNames(:)))
   startIn = ((areaCodes(j)-1)*10) + areaCodes(j);
   stopIn = startIn + 10;
   area(j) = CreateStructure(areaNames{j},lat(j),long(j),foodData(startIn:stopIn,:));
end
