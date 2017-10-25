%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%wczytanie oryginalnego obrazka
orygianlImage = imread('lena.bmp');
%% wyliczenie 3 wersji
rescaledImage256 = imresize(orygianlImage, 0.5, 'bilinear');
rescaledImage128 = imresize(orygianlImage, 0.25, 'bilinear');
rescaledImage64 = imresize(orygianlImage, 0.125, 'bilinear');
%%pokazanie oryginalu
figure();
imshow(orygianlImage);
title('Original size');

%% pokaznie wersji 64 na 64
imshow(rescaledImage64, 'InitialMagnification', 800);
title('64na64');

%% pokaznie wersji 128 na 128
imshow(rescaledImage128, 'InitialMagnification', 400);
title('128na128');

%% pokaznie wersji 256 na 256
imshow(rescaledImage256, 'InitialMagnification', 200);
title('256na256');
