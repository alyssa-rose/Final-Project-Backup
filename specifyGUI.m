%{
specifyGUI3 takes in user data to fit a line to the data and to predic food
consumption for a specific year given a country

Alyssa Rose  Final Project 04-29-18
%}
%% list possible regions and food choices
regions = {'North/Central America','South America','West Europe',...
    'East Europe', 'North Africa','Sub Saharan Africa'...
    ,'South East Asia/Asia','Oceanic','Middle East'};

foodGroups = {'carbohydrates','fruit','legumes','dairy',...
    'meat','alcohol','coffee','tea','stimulants','nuts','vegetables'};

%creates menu to select region
[selection,v]=listdlg('PromptString','Region','SelectionMode','single','ListString',regions);

%% Creates globe
% Original code from MathWorks Documentation
% "Display a Rotating Globe" and edited by Alyssa Rose

figure(1)
hold on
p = axesm('globe');
gridm('GLineWidth',0.75,'Grid','on')
load coastlines
plotm(coastlat,coastlon);
setm(gca,'Galtitude',0.025);
axis vis3d
load topo
topo = topo / (earthRadius('km')* 20);
hs = meshm(topo,topolegend,size(topo),topo);
demcmap(topo);
set(gcf,'color','black');
axis off;
camlight right
lighting Gouraud;
material ([.7, .9, .8]);
rotate(p,[35 0],38);

%% North/Central America
if strcmp(regions{selection},'North/Central America')
    % rotates globe to region
    view(-9,39);
    
    %lists possible countries
    country1 = {'Bahamas','Barbados','Canada','Costa Rica','Cuba'...
        'Dominican Republic','El Salvador','Guatemala',...
        'Haiti','Honduras','Jamaica','Panama','Trinidad and Tobago'};
    
    %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% South America
if strcmp(regions{selection},'South America')
    
    view(28,-23)
    country1 = {'Argentina', 'Bolivia', 'Chile','Colombia'...
        'Ecuador','Guyana','Peru','Uruguay','Venezuela'}
     %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% West Europe
if strcmp(regions{selection},'West Europe')
    
    view(101,56)
    country1 = {'Austria','Belgium','Denmark','Finland','Iceland','Ireland'...
        'Luxembourg','Netherlands','Norway','Portugal','Spain','Sweden',...
        'Switzerland','United Kingdom'};
    
    %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% East Europe
if strcmp(regions{selection},'East Europe')
    
    view(101,56)
    country1 = {'Albania','Belarus','Bosnia and Herzegovina','Bulgaria',...
        'Croatia','Cyprus','Czechia','Estonia','Greece','Hungary',...
        'Lithuania','Malta','Montenegro','Poland','Republic of Moldova',...
        'Romania','Serbia','Slovakia','Slovenia','Ukraine'};
    
    %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% North/East/West Africa
if strcmp(regions{selection},'North Africa')
    
    view(103,3)
    country1 = {'Algeria','Benin','Burkina Faso','Cote d''lvoire',...
        'Chad','Djibouti','Ethiopia','Gambia','Ghana','Guinea','Guinea-Bissau',...
        'Liberia','Mali','Morocco','Nigeria','Niger','Senegal','Sierra Leone',...
        'Sudan','Togo','Tunisia'};
    
     %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% Sub Saharan Africa
if strcmp(regions{selection},'Sub Saharan Africa')
    
    view(103,3)
    country1 = {'Angola', 'Botswana','Cameroon','Central African Republic',...
        'Kenya','Madagascar','Malawi','Mozambique','South Africa','Uganda',...
        'United Republic of Tanzania','Zambia','Zimbabwe'};
    
    %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% South East Asia/Asia
if strcmp(regions{selection},'South East Asia/Asia')
    
    view(-170,-3)
    country1 = {'Brunei Darussalam','Cambodia','China, Hong Kong', 'China, Macao',...
        'China, Taiwan','Democratic People''s Republic of Korea','Kazakhstan','Kyrgyzstan',...
        'Lao People''s Democratic Republic','Malaysia','Mongolia',...
        'Myanmar','Nepal','Philippines','Pakistan','Republic of Korea',...
        'Sri Lanka','Thailand','Uzbekistan','Viet Nam'};
    
     %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% Oceanic
if strcmp(regions{selection},'Oceanic')
    
    view(-153,-26)
    country1 = {'Australia','Fiji','New Zealand'};
    
     %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end

%% Middle East
if strcmp(regions{selection},'Middle East')
    
    view(139,26)
    country1 = {'Afghanistan','Armenia','Azerbaijan','Georgia','Iraq',...
        'Israel','Jordan','Kuwait','Lebanon','Oman','Saudi Arabia',...
        'Tajikistan','Turkey','Turkmenistan','United Arab Emirates','Yemen'};
    
     %gets index of country selection
    countryChoice = menu('Country', country1);
    country = country1{countryChoice};
    %finds index of country in struct
    I = find(strcmpi({area.name}, country)==1);
    
    %plots star where country is
    pause(0.1);
    hold on
    plot3m(area(I).lat,area(I).long,0.1,'m*');
    hold off
    
    %gets user input for food type and years
    foodChoice = menu('Food',foodGroups);
    m = foodGroups{foodChoice};
    yearRange = inputdlg({'Input Year Range from: ','To: '},'Years',[1 35]);
    year1 = str2num(yearRange{1});
    year2 = str2num(yearRange{2});
    %extrapolates
    yPredic = DataFit(1992:2013,area(I).(m),1,year1:year2);
    fprintf('%s is expected to consume %.0f tonnes of %s in %4.0f\n',country, yPredic(end),m,year2)
end


