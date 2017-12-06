clc;
close all;
clearvars;
%%
plansza = imread('plansza.bmp');

%%

h3 = fspecial('average',3);
h3double = double(h3);
conveted3 = uint8(conv2(plansza, h3double, 'same'));
imdif = imabsdiff(plansza,conveted3);
figure();
subplot(3,1,1);
imshow(plansza);
subplot(3,1,2);
imshow(conveted3);
subplot(3,1,3);
imshow(imdif);
%%
h5 = fspecial('average',5);
h5double = double(h5);
conveted5 = uint8(conv2(plansza, h5double, 'same'));
h9 = fspecial('average',9);
h9double = double(h9);
conveted9 = uint8(conv2(plansza, h9double, 'same'));
h15 = fspecial('average',15);
h15double = double(h15);
conveted15 = uint8(conv2(plansza, h15double, 'same'));
h35 = fspecial('average',35);
h35double = double(h35);
conveted35 = uint8(conv2(plansza, h35double, 'same'));
figure();
subplot(1,5,1);
imshow(conveted3);
title('3');
subplot(1,5,2);
imshow(conveted5);
title('5');
subplot(1,5,3);
imshow(conveted9);
title('9');
subplot(1,5,4);
imshow(conveted15);
title('15');
subplot(1,5,5);
imshow(conveted35);
title('35');
%%
lena = imread('lena.bmp');
h5 = fspecial('average',5);
h5double = double(h5);
lenaconveted5 = uint8(conv2(lena, h5double, 'same'));
figure();
imshow(lena);
figure();
imshow(lenaconveted5);
%%
M = [1,2,1;2,4,2;1,2,1];
M = M/sum(sum(M));
lena = imread('lena.bmp');
lenaconvetedM = uint8(conv2(lena, M, 'same'));
figure();
imshow(lenaconvetedM);
%%
lena = imread('lena.bmp');
hG = fspecial('gaussian',5,0.5);
figure();
mesh(hG);
hGdouble = double(hG);
lenaconvetedG = uint8(conv2(lena, hGdouble, 'same'));
figure();
imshow(lenaconvetedG);
%%







