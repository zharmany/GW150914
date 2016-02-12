% Plot of the LIGO gravity wave detection event data
% Data and inspiration from https://losc.ligo.org/events/GW150914/
clear; close all;

H = dlmread('fig1-observed-H.txt',' ',1,0);
L = dlmread('fig1-observed-L.txt',' ',1,0);

L(:,1) = L(:,1) + 0.0072; % Correct for the speed of light
H(:,2) = -H(:,2); % And reverse the amplitude

maxY = max(max(H(:,2)), max(L(:,2)));
minY = min(min(H(:,2)), min(L(:,2)));
maxX = max(max(H(:,1)), max(L(:,1)));
minX = min(min(H(:,1)), min(L(:,1)));

extendX = 0.025;
rangeX = maxX - minX;
startX = minX - extendX*rangeX;
endX = maxX + extendX*rangeX;

extendY = 0.1;
rangeY = maxY - minY;
startY = minY - extendY*rangeY;
endY = maxY + extendY*rangeY;

figure;
plot(linspace(startX,endX,100),zeros(1,100),'Linewidth',2,'Color',[0.4 0.4 0.4])
hold on
plot(H(:,1),H(:,2),'Linewidth',2,'Color',[1 0.5 0.2]);
plot(L(:,1),L(:,2),'Linewidth',2,'Color',[0.2 0.5 1]);
xlim([startX, endX])
ylim([startY, endY])
set(gca,'PlotBoxAspectRatio',[16 9 1])
axis off
title('GW150914','FontName','Helvetica','FontWeight','normal','FontSize',24)