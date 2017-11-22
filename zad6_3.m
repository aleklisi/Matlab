clc;
close all;
clearvars;
%%
moon = imread('moon.bmp');

M = [0,1,0;1,-4,1;0,1,0];
M = M/9;