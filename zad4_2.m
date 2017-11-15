clearvars;
close all;
clc;
%%
phobos = imread('phobos.bmp');
histeq(phobos,256);
%%
load histogramZadany;
figure();
bar(histogramZadany);
%%
 phoboSaDJUST = imadjust(phobos);
 phoboada = adapthisteq(phobos);
 
 imshow(phoboSaDJUST);
 figure();
 imshow(phoboada);
 %%
 phobosAdjusted = imadjust(phobos);
 clashephobos = adapthisteq(phobosAdjusted);
 imshow(clashephobos);
 