function group = CreateGroups(area,groupID)
% function group = CreateGroups(area) creates groups for cluster analysis
% input: area (stucture array of all areas and their data)
% output: group (structure array of all data for a group, intended for
%         cluster analysis)
%
% code author: sid hillwig
if ischar(groupID)
   [~,c] = size(area);
   if strcmpi(groupID,'CPL')
       for n = (1:c)
           group(n).carbohydrates = area(n).carbohydrates + area(n).vegetables+ area(n).fruit;
           group(n).protein = area(n).meat + area(n).dairy + area(n).legumes;
           group(n).lipids = area(n).nuts;
       end % WEIGHT THESE BOIS APPROPRIATELY
   elseif strcmpi(groupID,'bev')
       for m = (1:c)
           group(m).alcohol = area(m).alcohol;
           group(m).coffee = area(m).coffee;
           group(m).tea = area(m).tea;
       end
   end
else
    disp('Group should be named.')
end
return