% Test script to demonstrate the use of FORMA1D
%
%   This script uses the data in FORMA1D.MAT corresponding to the
%   simulation of a particle with radius R=.48e-6 m in a solution with
%   viscosity eta=0.0011 Pa s held by optical tweezers with stiffness
%   k=.6e-6 N/m whose position is sampled at 5000 frames per second for 20
%   s. 
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

load forma1d.mat

[k_forma1d, D_forma1d] = forma1d(s-s0, Dt, gamma);

disp(['FORMA 1D results:'])
disp(['k* = ' num2str( k_forma1d ) ' N/m'])
disp(['k*/k = ' num2str( k_forma1d/k )])
disp(['D* = ' num2str( D_forma1d ) ' m^2/s'])
disp(['D*/D = ' num2str( D_forma1d/D )])