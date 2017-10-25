%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%
load funkcjeLUT;
plot(kwadratowa);
%%
orygianlImage = imread('lena.bmp');
imshow(orygianlImage);
%%
figure();
LUT(orygianlImage,kwadratowa);
%%

LUT(orygianlImage,log);