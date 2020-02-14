load('../../2019_Masfjorden/Data/Bathymetry/Masfjorden_bathy.mat')

n=1;
figure;

%D(D<0)=nan;


%m_proj('lambert','long', [5 5.6],'lat', [60.6 60.8])
m_proj('lambert','long', [4.5 5.6],'lat', [60.6 61])

m_grid('box','fancy','tickdir', 'in')
hold on;

%m_contourf(lon(1:n:end,1:n:end),lat(1:n:end,1:n:end),D(1:n:end,1:n:end),'linestyle','none');
m_contourf(double(lon(1:n:end,1:n:end)),double(lat(1:n:end,1:n:end)),double(D(1:n:end,1:n:end)),[5 5]);


%colorbar




