clc;
close all;
clearvars;
%%
bart = imread('bart.bmp');
figure;
imshow(bart);
 %%
figure;
imhist(bart);
 %%
obraz = bart > 170 & bart < 220;
obraz = uint8(obraz);

figure;
subplot(1,2,1);
imshow(bart);
subplot(1,2,2);
imshow(obraz,[]);