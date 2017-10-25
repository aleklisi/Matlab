%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%preszskalownaie obrazka metoda najblizszego somsiada
orygianlImage = imread('lena.bmp');
resizedImageWithNearestNbour = imresize(orygianlImage, 1.5, 'nearest');
%%pokazanie oryginalnego obrazka
figure();
imshow(orygianlImage);
title('orygianlny obazek');
%%pokazanie przeskalowanego obrazka najblizyszm somsiadem
imshow(resizedImageWithNearestNbour);
title('obazek przesklowany najblizyszym somsiadem');
%%przesklowanie obrazka metoda bilinearna
resizedImageWithBilinear = imresize(orygianlImage, 1.5, 'bilinear');
%%pokazanie przeskalowanego obrazka bilinearnie
imshow(resizedImageWithBilinear);
title('obazek przesklowany metoda bilinearna');
%%preszskalownaie obrazka metoda szescienna
resizedImageWithCubic = imresize(orygianlImage, 1.5, 'bicubic');
%%pokazanie przeskalowanego obrazka szescienna
imshow(resizedImageWithCubic);
title('obazek przesklowany metoda szescienna');