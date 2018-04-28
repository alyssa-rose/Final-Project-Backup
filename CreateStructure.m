function area = CreateStructure(areaName,lat,long,foodData)
% function area = CreateStructure(areaName,lat,long) creates structure area
% containing the name, latitude, longitude, and group-specific food data
% for each area
% inputs: areaName (string of country's name); lat (numeric of latitude);
%         long (numeric of longitude); foodData (matrix of food data
%         specific to that country (11 x 54))
% output: area (structure with fields);
%         area.name - field containing country name
%         area.lat - field containing country latitude
%         area.long - field containing country longitude
%         area.(foodGroups) - field containing data from 1961 to 2013
%         specific for each good group (carbohydrates, fruits, legumes,
%         dairy, etc.)
% code author: sid hillwig
[r,c] = size(foodData);
if nargin == 4 % change to 5
    if ischar(areaName)
        area.name = areaName;
    else
        disp('Area name must be string.')
        area.name = [];
    end
    
    if isnumeric(lat)
        area.lat = lat;
    else
        disp('Latitude must be numeric.')
        area.lat = [];
    end
    
    if isnumeric(long)
        area.long = long;
    else
        disp('Longitude must be numeric.')
        area.long = [];
    end
    
    if r == 11
        for i = (1:c)
            area.carbohydrates(i) = foodData(1,i);
            area.fruit(i) = foodData(2,i);
            area.legumes(i) = foodData(3,i);
            area.dairy(i) = foodData(4,i);
            area.meat(i) = foodData(5,i);
            area.alcohol(i) = foodData(6,i);
            area.coffee(i) = foodData(7,i);
            area.tea(i) = foodData(8,i);
            area.stimulants(i) = foodData(9,i);
            area.nuts(i) = foodData(10,i);
            area.vegetables(i) = foodData(11,i);
        end
    else
        disp('Food data must have all food groups.')
        area.carbohydrates = [];
        area.fruit = [];
        area.legumes = [];
        area.dairy = [];
        area.meat = [];
        area.alcohol = [];
        area.coffee = [];
        area.tea = [];
        area.stimulants = [];
        area.nuts = [];
        area.vegetables = [];
    end
else
    disp('Insufficient number of arguments.')
end

return