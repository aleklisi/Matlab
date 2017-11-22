clc;
close all;
clearvars;
%%
lenaSzum = imread('lenaSzum.bmp');
%%
filtred = medfilt2(lenaSzum);
diff = imabsdiff(lenaSzum,filtred);
figure();
subplot(3,1,1);
imshow(lenaSzum);
subplot(3,1,2);
imshow(filtred);
subplot(3,1,3);
imshow(diff);
%%
%dodaj porownaie

%%
I =  imread('lena.bmp');

for i = 1:10
    I = medfilt2(I);
end;
figure();
imshow(I);