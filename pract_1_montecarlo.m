%% PLOTS DE LA PRACT 1: INTEGRAL A TRAVÉS DE MONTECARLO
clear all; close all; 

fileID = fopen('results_A.dat');
dades = textscan(fileID,'%f%f%f');
vec_N = cell2mat(dades(1)); 
mean_A = cell2mat(dades(2));
std_A = cell2mat(dades(3));

figure(1)
semilogx(vec_N, mean_A, '-ok','LineWidth',2)
title(['<A>(N)  ' '  (M = 100)'])
xlabel('Nº of points used')
ylabel('<A>')

figure(2)
semilogx(vec_N, std_A, '-k','LineWidth',2)
title(['\sigma_{A}(N)  ' '  (M = 100)'])
xlabel('Nº of points used')
ylabel('\sigma_{A}')

