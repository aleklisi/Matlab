clearvars;
close all;
clc;

%%
lenaRGB = imread('lenaRGB.bmp');
lenaR = lenaRGB(:,:,1);
lenaG = lenaRGB(:,:,2);
lenaB = lenaRGB(:,:,3);

figure();
subplot(2,2,1);
imshow(lenaRGB);

subplot(2,2,2);
imshow(lenaR);

subplot(2,2,3);
imshow(lenaG);

subplot(2,2,4);
imshow(lenaB);

lenaREQ = histeq(lenaR,256);
lenaGEQ = histeq(lenaG,256);
lenaBEQ = histeq(lenaB,256);

nowaLena = lenaRGB;
nowaLena(:,:,1) =  lenaREQ;
nowaLena(:,:,2) =  lenaGEQ;
nowaLena(:,:,3) =  lenaBEQ;

%%
figure();
imshow(nowaLena);

%%
lenaHSV = rgb2hsv(lenaRGB);

figure();
imhist(lenaHSV(:,:,1));
figure();
imhist(lenaHSV(:,:,2));
figure();
imhist(lenaHSV(:,:,3));

lenahsvnew = lenaHSV;
lenahsvnew(:,:,3) = histeq(lenaHSV(:,:,3),256);
lenaHSV2 = hsv2rgb(lenahsvnew);

figure(4);
imshow(lenaHSV2);