function specifyGUI

figure
hold on
axesm globe;
% gridm('GLineStyle','-','Gcolor',[.7 .8 .9],'Grid','on')
gridm('GLineWidth',0.75,'Grid','on')
set(gca,'Box','off','Projection','perspective')
base = zeros(180,360);
baseR = georefcells([-90 90],[0 360],size(base));
copperColor = [0.62 0.38 0.24];
hs = geoshow(base,baseR,'FaceColor',copperColor);

setm(gca,'Galtitude',0.025);
axis vis3d

clmo(hs)

load topo
topo = topo / (earthRadius('km')* 20);
hs = meshm(topo,topolegend,size(topo),topo);
demcmap(topo)

set(gcf,'color','black');
axis off;

camlight right
lighting Gouraud;
material ([.7, .9, .8])

locAFG = csvread('dataFinal.csv',1,8,'I2..J2')
plot3m(locAFG(1),locAFG(2),0.1,'m*')


popup = uicontrol('Style', 'popup',...
    'String',{'North America','South America','Europe', 'Africa','Asia'})
    hold off