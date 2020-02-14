% This script contains examples for how to plot CTD-profiles from 1
% station.

load KB2018602_CTD  % What CTD-file to use (once the data is loaded you can comment out this line) 
I=10;               % What station to use, nb - number in structure


%% plot one parameter and overplot something else...(similar to plotxx)
% but more control like this...
figure
plot(CTD(I).CT,CTD(I).P); 
set(gca,'ydir','reverse'); % z increases downward
xlabel('Conservative temperature [^\circ C]')

[addax, h]=overplotx(gca,CTD(I).SA,CTD(I).P); 
set(gca,'ydir','reverse');
xlabel('Absolute Salinty [g kg^{-1}]')


%% Plot three parameters
figure
ax=CTDXXX(CTD(I).P,CTD(I).CT,CTD(I).SA,CTD(I).SIGTH,...
     CTD(I).fname(2:end-5)); 
% Change parameters to 'T',S,'X','OX','BVF' depending on what you want to
% plot
set(gcf,'Position',[360.3333   85.6667  560.0000  532.0000]) % modify size of plot so that axes don't come on top of each other

% use ax to modify your plot
set(ax(10),'fontsize',12)
set(ax(1),'Ytick',[0:50:max(get(ax(1),'Ylim'))]) % Modify y-axis
set(ax(2:3),'Xlim',[31 36],'Xtick',[31:0.5:36])

figure
ax=CTDXXX(CTD(I).P,CTD(I).CT,CTD(I).SA,CTD(I).OX,...
     CTD(I).fname(2:end-5)); 
set(gcf,'Position',[360.3333   85.6667  560.0000  532.0000]) % modify size of plot so that axes don't come on top of each other
 
 

%% TS-plot
figure
gsw_SA_CT_plot(CTD(I).SA,CTD(I).CT,0,[20:.5:28]);

% The following functions plots temperature and salinity, not conservative
% temperature and absolute salinity
% %% Plot (for example) one station
 figure
 plot_ctd(CTD(I).T,CTD(I).S,CTD(I).SIGTH,CTD(I).P)
% 
% %% or you can do this:
 figure
 CTDXXX(CTD(I).P,CTD(I).T,CTD(I).S,CTD(I).SIGTH,CTD(I).fname)
% 
% %% or messy tickmarks, but more use of the panel:
 figure
 CTDXXX2(CTD(I).P,CTD(I).T,CTD(I).S,CTD(I).SIGTH,CTD(I).fname)
