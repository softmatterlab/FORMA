function [F0x, F0y] = FORMA2D_forcefield(X, Y, DX, DY, dt, gamma)
% FORMA2D   2D implementation of FORMA
%
% [k, Omega, theta, D] = FORMA2D(r, Dt, gamma) calculates the values of the
%           trap stiffnesses along the principal axes k=[kx,ky], the
%           orientaiton of the principal axes theta, the angular velocity
%           Omega, and the particle diffusion coefficients along the
%           principla directions D=[Dx,Dy] given a sequence of particle
%           positions r=[x,y] (N by 2 matrix) sampled with sampling
%           frequency 1/Dt and the friction coefficient gamma of the
%           particle.
%
%   This code is provided with the article:
%
%   High-Performance Reconstruction of Microscopic Force Fields from
%   Brownian Trajectories
%   Laura Perez Garcia, Jaime DonLucas, Giorgio Volpe, Alejandro V. Arzola
%   & Giovanni Volpe 
%   2018

%dr = diff(r);
ONEM=ones(size(X));
DXY=gamma/dt*[DX,DY];
XY1=[X,Y,ONEM];
clear ONEM
MLE=(transpose(XY1)*XY1)\transpose(XY1)*DXY;
clear XY1
clear DXY
MLE=MLE';
F0x=gamma*MLE(1,3);
F0y=gamma*MLE(2,3);

    
%f = gamma*[drx dry]/Dt;
%r1=[rx ry ones(size(rx))];
%Jt =(transpose(r1)*r1)\transpose(r1)*f;

%Jt=Jt';
%F0x=Jt(1,3);
%F0y=Jt(2,3);
