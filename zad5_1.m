clearvars;
close all;
clc;
%%
coins = imread('coins.png');
figure();
imshow(coins);
figure();
coinshistq = imhist(coins,256);
bar(coinshistq);
%%
level = max(coinshistq)/2^13;
coinsbw = imbinarize(coins,0.5);
figure();
imshow(coinsbw);
%%

figura = imread('figura.png');
figurahistq = imhist(figura,256);
figure();
bar(figurahistq);
%%
figura2 = imread('figura2.png');
figura2histq = imhist(figura2,256);
figure();
bar(figura2histq);
%%
figura3 = imread('figura3.png');
figura3histq = imhist(figura3,256);
figure();
imshow(figura3);
figure();
bar(figura3histq);

%%
%%
figura4 = imread('figura4.png');
figura4histq = imhist(figura4,256);
figure();
imshow(figura4);
figure();
bar(figura4histq);
%%
graycoinslevel = graythresh(coins);
graycoins = imbinarize(coins,graycoinslevel);
imshow(graycoins);
%%
graycoinslevelKittler = clusterKittler(coins)/255;
graycoinsKittler = imbinarize(coins,graycoinslevelKittler );
imshow(graycoinsKittler);
%%
graycoinslevel = entropyYen(coins)/255;
graycoins = imbinarize(coins,graycoinslevel);
imshow(graycoins);
%%




