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
           area(n).totalFood = area(n).carbohydrates + area(n).fruit + ...
               area(n).legumes + area(n).dairy + area(n).meat + ...
               area(n).alcohol + area(n).coffee + area(n).tea + ...
               area(n).stimulants + area(n).nuts + area(n).vegetables;
           group(n).carbohydrates = (1*area(n).carbohydrates + ...
               0.44*area(n).vegetables + 0.22*area(n).dairy + ...
               0.24*area(n).legumes + 0.82*area(n).fruit + ...
               0.05*area(n).nuts)./area(n).totalFood;
           group(n).protein = (0.83*area(n).meat + 0.39*area(n).dairy + ...
               0.75*area(n).legumes + 0.56*area(n).vegetables + ...
               0.18*area(n).fruit + 0.31*area(n).nuts)./area(n).totalFood;
           group(n).lipids = (0.17*area(n).meat + 0.39*area(n).dairy + ...
               0.01*area(n).legumes + 0.64*area(n).nuts)./area(n).totalFood;
       end 
   elseif strcmpi(groupID,'bev')
       for m = (1:c)
           area(m).totalBev = area(m).alcohol + area(m).coffee + area(m).tea;
           group(m).alcohol = area(m).alcohol./area(m).totalBev;
           group(m).coffee = area(m).coffee./area(m).totalBev;
           group(m).tea = area(m).tea./area(m).totalBev;
       end
   end
else
    disp('Group should be named.')
end
return