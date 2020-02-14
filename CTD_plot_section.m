%% This scripts provides an example for how to plot CTD-sections. 
% You need to determine what stations to include, 
% what text to write etc below. CTD data needs to be loaded into
% workingspace
 

% Define section
sts=[401:409]; % What stations to include, nb - station numbers, not numbers in structure 
ttext=['KB2019602 , Section A']; % Title
xtime=1; % xtime=0 -> section, xtime=1 -> time series
section_name='A'; % This name will appear where stations are marked


%% Do not modify below 
%(or, off course you can - but then save script with a different name so that you 
% keep a basic version that you know is working...)

colormap('jet') % What colormap to use

switch xtime
    case 0
        xtext='Distance [km]';
    case 1
        xtext='Time [h]';
end
        
stname=make_lettered_numbers(section_name,[1:length(sts)]);
        

A=buildsection(CTD,sts);

BDepth=[A.BottomDepth];
z_toplim=0;


% % Predefine some contour intervals for T / S / sigmat etc.
% Tcon=[-2:.5:9];
% Scon=[33.5 34:.2:35.2];%[34.5:.05:35.1];
% denscon=[26 27 27.5:.1:28.2];
% Or get limits for each section:
[Tlim,~,Tcon]=get_axislim([A.T],20);
[~,~,Scon]=get_axislim([A.S],20);
% [~,~,denscon]=get_axislim([A.SIGTH],10);
denscon=[21:25 25.5:.2:29];
%%--------------------------------------

if xtime  % For time series stations
    x=([A.dnum]-A.dnum(1)).*24;
    xlab='Time (h)';
    xbathy=x;
    xli=[0 nanmax(x)];
else  % For sections
    x=roundto([0 cumsum(sw_dist([A.LAT],[A.LON],'km'))'],.01);
    xlab='Distance (km)';
    xli=[0 max(x)];
    xbathy=x;
end

YLIM=[z_toplim nanmax(BDepth)+6];
%%           T, S and Density contours
%figure
set(gcf,'position',[500 50 550 550]);
subaxis(2,1,1,'SV',0.01,'MB',.09,'MT',.1,'MR',0.08);

 [hax1,hc1,hc11,h13]=contour_2par(x,-A.z,A.CT,A.SIGTH,Tcon,denscon,...
    ' CT(\circC)','k',[7 3],1,11);
set(gca,'ylim',YLIM,'ydir','reverse','xlim',xli);

FillBathy(x,BDepth);
set(h13,'linew',1.);
ylabel('Depth (m)');
set(hax1,'xticklabel',[]);
topaxe1=AddStationTick(x,stname,hax1);

subaxis(2);
[hax2,hc2,hc22,h23]=contour_2par(x,-A.z,A.SA,A.SIGTH,Scon,denscon,...
    '  SA [g kg^{-1}','k',[7 3],[],11);
set(gca,'ylim',YLIM,'ydir','reverse','xlim',xli);
FillBathy(x,BDepth);
set(h23,'linew',1.);
ylabel('Depth (m)');
xlabel(xlab);
topaxe2=AddStationTick(x,[],hax2);
% 


suptitle(ttext);


