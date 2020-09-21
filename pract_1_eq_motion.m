%% PLOT DE LA PRACT_1 EQ MOTION
clear all; close all;

fileID = fopen('results_eq_motion_euler_pc.dat');
dades = textscan(fileID,'%f%f%f%f');
t_euler_pc = cell2mat(dades(1)); x_euler_pc = cell2mat(dades(2));
v_euler_pc = cell2mat(dades(3)); a_euler_pc = cell2mat(dades(4));

fileID = fopen('results_eq_motion_verlet.dat');
dades = textscan(fileID,'%f%f%f%f');
t_verlet = cell2mat(dades(1)); x_verlet = cell2mat(dades(2));
v_verlet = cell2mat(dades(3)); a_verlet = cell2mat(dades(4));

figure(1)
plot(t_euler_pc, x_euler_pc,'-b','LineWidth',3)
hold on
plot(t_verlet, x_verlet, '-r', 'LineWidth',3)
legend('euler pc','verlet')