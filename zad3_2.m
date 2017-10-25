%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%
orygianlImage1 = imread('lena.bmp');
orygianlImage11 = uint16(imread('lena.bmp'));
orygianlImage111 = int16(imread('lena.bmp'));

imshow(orygianlImage1);
%%
orygianlImage2 = imread('jet.bmp');
orygianlImage22 = uint16(imread('jet.bmp'));
orygianlImage222 = int16(imread('jet.bmp'));

imshow(orygianlImage2);
%%
AddedImages = imadd(orygianlImage1,orygianlImage2);
imshow(AddedImages,[]);
%%
AddedImages1 = imadd(orygianlImage11,orygianlImage22);
imshow(AddedImages1,[]);
%%
LinearCombinationImage2 = imlincomb(0.5,orygianlImage2,0.3,orygianlImage1);
imshow(LinearCombinationImage2,[]);
%%
SubstractedImages1 = imsubtract(orygianlImage111,orygianlImage222);
imshow(SubstractedImages1,[]);
%%
SubstractedImages11 = imsubtract(orygianlImage11,orygianlImage22);
imshow(SubstractedImages11);
%%
AbstractImages11 = imabsdiff(orygianlImage1,orygianlImage2);
imshow(AbstractImages11);
%%
MultiplyImages11 = immultiply(orygianlImage1,orygianlImage2);
imshow(MultiplyImages11);
%%
imshow(imcomplement(orygianlImage1));
%%