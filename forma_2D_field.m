% Test script to demonstrate the use of FORMA2D to reconstruct extended
% force field
%
%   This script uses the data in doublebeam_traj_disp.MAT corresponding to the
%   experimental trajectory of a particle with radius R=.48e-6 m in a solution with
%   viscosity eta=0.0011 Pa s held by a double well optical potential
%  
  
clear all
close all
load('doublebeam_dataxvsdx.mat')
histogram2(xT, yT)
d0=0.025;
dx=0.05;
dy=dx;


%%

 
%creates mesh grid with boxes of size 'dsamp'
min_x=min(xT); %1.3
max_x=max(xT); %3.5
min_y=min(yT); %1.6
max_y=max(yT); %2.5
nx=round((max_x-min_x)/dx);
ny=round((max_y-min_y)/dy);
Dt=1/448.43;
a = 0.5;  % radius [m]
eta = 0.90e-3;   % fluid viscosity [Pa s]
T = 273.15+21;      % temperature [K]
% Constants
kB = 1.38e-5;  %Boltzmann constant [J/K]
% Derived parameters
gamma = 6*pi*a*eta; % friction coefficient

xx=min_x+dx/2:dx:max_x-dx/2;
yy=min_y+dy/2:dy:max_y-dy/2;
[X,Y]=meshgrid(xx,yy); 
F0xf=zeros(size(X));
F0yf=zeros(size(X));
visitas=zeros(size(X));
%%now build the force field by checking every 'box' of the grid
 for ii=1:length(xx)
     ii
     for jj=1:length(yy)
         %%first we need to select the data to be considered for every box
         x0=xx(ii);
         y0=yy(jj);
         [indexRd]= BB_index_filter(d0, xT, yT, x0, y0);
         visitas(jj, ii)=length(indexRd);
         if length(indexRd)< 50  %we only calculate the force field when there is enough data correspondent 
             %to that point in the grid
             F0xf(jj, ii)=NaN;
             F0yf(jj, ii)=NaN; 
              else
             [F0xf(jj, ii), F0yf(jj, ii)] = FORMA2D_F0_J0(xT(indexRd)-x0, yT(indexRd)-y0, dxT(indexRd), dyT(indexRd), Dt, gamma);
         end
     end
 end

figure(9)
surf(X,Y, log(visitas))
axis equal
shading interp
view(2)
xlim([xx(1) xx(end-1)])
ylim([yy(1) yy(end-1)])
xlabel('x[\mu m]')
ylabel('y[\mu m]')

colormap winter
colorbar
hold on
quiver3(X,Y,1e7*ones(size(X)),F0xf,F0yf,zeros(size(X)), 'Color', 'red', 'MaxHeadSize',0.1, 'LineWidth',1.3 )
