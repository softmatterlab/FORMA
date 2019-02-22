function [k, Omega, theta, D] = forma2d(r, Dt, gamma)
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

dr = diff(r);
r = r(1:end-1,:);
f = gamma*dr/Dt;

J = (r'*r)^-1 * r' * f;

Jc = 0.5*(J+J');
[R,Jd] = eig(Jc);

k = [-Jd(1,1) -Jd(2,2)];
theta = pi+atan2(R(1,2),R(1,1));

Omega = 0.5*(J(2,1)-J(1,2))/gamma;

D = mean(Dt/(2*gamma^2)*(f-r*J).^2);