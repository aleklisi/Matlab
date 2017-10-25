%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%preszskalownaie obrazka metoda najblizszego somsiada
orygianlImage = imread('chessboard.bmp');
resizedImageWithNearestNbour = imresize(orygianlImage, 1.5, 'nearest');
%%pokazanie oryginalnego obrazka
figure();
imshow(orygianlImage);
title('orygianlny obazek');
%%pokazanie przeskalowanego obrazka najblizyszm somsiadem
figure();
imshow(resizedImageWithNearestNbour);
title('obazek przesklowany najblizyszym somsiadem');
%%przesklowanie obrazka metoda bilinearna
resizedImageWithBilinear = imresize(orygianlImage, 1.5, 'bilinear');
%%pokazanie przeskalowanego obrazka bilinearnie
figure();
imshow(resizedImageWithBilinear);
title('obazek przesklowany metoda bilinearna');
%%preszskalownaie obrazka metoda szescienna
resizedImageWithCubic = imresize(orygianlImage, 1.5, 'bicubic');
%%pokazanie przeskalowanego obrazka szescienna
figure();
imshow(resizedImageWithCubic);
title('obazek przesklowany metoda szescienna');