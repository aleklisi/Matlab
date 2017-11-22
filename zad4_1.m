clearvars;
close all;
clc;
%%
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

figure();

n = 256;

subplot(2,4,1);
imhist(lena1,n);
subplot(2,4,2);
imhist(lena2,n);
subplot(2,4,3);
imhist(lena3,n);
subplot(2,4,4);
imhist(lena4,n);
subplot(2,4,5);
imshow(lena1);
subplot(2,4,6);
imshow(lena2);
subplot(2,4,7);
imshow(lena3);
subplot(2,4,8);
imshow(lena4);
%pierwszy najlepszy
%%
n = 256;

hist1 = imread('hist1.bmp');
figure();
subplot(2,1,1);
imshow(hist1);
subplot(2,1,2);
imhist(hist1,n);

%%

newHist1 = imadjust(hist1);
figure();
subplot(2,1,1);
imshow(newHist1);
subplot(2,1,2);
imhist(newHist1,n);
%%
[H,x] = imhist(hist1,n);
figure();
subplot(2,1,1);
C = cumsum(H);
maxH = max(H);
maxC = max(C);
k = maxC / maxH;
C2 = C / k;
bar(x,C2);
title('super histogram EH');

subplot(2,1,2);
bar(x,H);
title('zwykly histogram');

%%

maxC = max(C);
C2rescaled = (C / maxC) * 255;
C2reint = uint8(C2rescaled);
mylut = intlut(hist1,C2reint);
imshow(mylut);

%%
figure

subplot(2,1,1);
hist1eq = histeq(hist1,256);
title('histeq');
imshow(hist1eq);
subplot(2,1,2);
adapthist1eq = adapthisteq(hist1);
imshow(adapthist1eq);
title('adapthisteq');

%%
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

[H,x] = imhist(hist2,n);
C = cumsum(H);
maxH = max(H);
maxC = max(C);
k = maxC / maxH;
C2 = C / k;
maxC2 = max(C2);
C2rescaled = C2 / max(C2) * 255;
C2reint = uint8(C2rescaled);
mylut = intlut(hist2,C2reint);
imshow(mylut);
figure();
subplot(2,2,1);
plot(x,H);
title('zwykly histogram');

subplot(2,2,2);
histeq(hist2,256);
title('HE');

subplot(2,2,3);
adapthist2eq = adapthisteq(hist2);
imshow(adapthist2eq);
title('CLAHE');
subplot(2,2,4);
imshow(hist2);
title('orygina');

%%




