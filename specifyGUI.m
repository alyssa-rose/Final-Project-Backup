function specifyGUI
s = input('enter country: ','s')
figure
hold on
axesm globe;
gridm('GLineWidth',0.75,'Grid','on')

% popup = uicontrol('Style', 'popup',...
%     'String',{'North America','South America','Europe', 'Africa','Asia'}...
%     ,'Callback',@setmap);
%     hold off

worldmap(s)
load coastlines

plotm(coastlat,coastlon)
setm(gca,'Galtitude',0.025);
axis vis3d
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
  
