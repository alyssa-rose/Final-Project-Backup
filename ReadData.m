% script to read in food data
T = readtable('dataFinal-v.3.xlsx','Range','B1:W396');
%% forming structures
areaCodes = unique(T{:,1});
foodGroups = T{:,2}(1:11);
areaNames = unique(T{:,3});
lat = unique(T{:,4});
long = unique(T{:,5});
foodData = T{:,6:end};

for j = (1:length(areaNames(:)))
   startIn = ((areaCodes(j)-1)*10) + areaCodes(j);
   stopIn = startIn + 10;
   area(j) = CreateStructure(areaNames{j},lat(j),long(j),foodData(startIn:stopIn,:));
end
