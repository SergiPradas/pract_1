%% PLOT DE pract_1_correlation.exe
clear all; close all; 
fileID = fopen('s_omega.dat');
dades = textscan(fileID,'%f%f');
vec_omega = cell2mat(dades(1)); S_omega = cell2mat(dades(2));

figure(1)
plot(vec_omega, S_omega, '-k','LineWidth',2)
title('S(\omega)')
xlabel('\omega')
ylabel('S(\omega)')
