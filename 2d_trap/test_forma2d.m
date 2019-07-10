% Test script to demonstrate the use of FORMA2D
%
%   This script uses the data in FORMA2D.MAT corresponding to the
%   simulation of a particle with radius R=.48e-6 m in a solution with
%   viscosity eta=0.0011 Pa s held by optical tweezers with stiffnesses
%   kx=1.5e-6 N/m and ky=.5e-6 N/m (theta=30 degrees) and Omega=100 rad/s
%   whose position is sampled at 5000 frames per second for 20 s.
%
%   This code is provided with the article:
%
%   High-Performance Reconstruction of Microscopic Force Fields from
%   Brownian Trajectories
%   Laura Perez Garcia, Jaime DonLucas, Giorgio Volpe, Alejandro V. Arzola
%   & Giovanni Volpe 
%   2018

close all
clear all
clc

load forma2d.mat
x=x-x0;
y=y-y0;
[k_forma2d, Omega_forma2d, theta_forma2d, D_forma2d] = forma2d([x,y], Dt, gamma);

disp(['FORMA 2D results:'])
disp(['kx* = ' num2str( k_forma2d(1) ) ' N/m'])
disp(['kx*/kx = ' num2str( k_forma2d(1)/kx )])
disp(['ky* = ' num2str( k_forma2d(2) ) ' N/m'])
disp(['ky*/ky = ' num2str( k_forma2d(2)/ky )])
disp(['theta* = ' int2str( theta_forma2d/pi*180 ) ' degrees'])
disp(['theta*-theta = ' int2str( (theta_forma2d-theta)/pi*180 ) ' degrees'])
disp(['Omega* = ' num2str( mean(Omega_forma2d) ) ' rad/s'])
disp(['Omega*/Omega = ' num2str( mean(Omega_forma2d)/Omega )])
disp(['D* = ' num2str( mean(D_forma2d) ) ' m^2/s'])
disp(['D*/D = ' num2str( mean(D_forma2d)/D )])