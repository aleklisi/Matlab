clc;
close all;
clearvars;
%%
ertka = imread('ertka.bmp');
SE = strel('square',3);
ertkaEroded = imerode(ertka,SE);

figure();
subplot(1,2,1);
imshow(ertka);
title('orygial');

subplot(1,2,2);
imshow(ertkaEroded);
title('zerodowane');
%%
SE1 = strel('diamond',3);
ertkaEroded1 = imerode(ertka,SE1);
SE2 = strel('disk',3,4);
ertkaEroded2 = imerode(ertka,SE2);

figure();
subplot(1,2,1);
imshow(ertkaEroded1);
title('diamond');

subplot(1,2,2);
imshow(ertkaEroded2);
title('disk');

%%
SE = strel('square',3);
ertkaEroded3 = imerode(ertka,SE);
figure();
subplot(1,4,1);
imshow(ertka);
for i = 2:4
    ertkaEroded3 = imerode(ertkaEroded3 ,SE);
    subplot(1,4,i);
    imshow(ertkaEroded3);
end

%%

buzka = imread('buzka.bmp');
SE4 = [0,0,0;1,1,1;0,0,0];
buzkaEroded = imerode(buzka ,SE4);

figure();
subplot(1,2,1);
imshow(buzka);
title('buzka');

subplot(1,2,2);
imshow(buzkaEroded);
title('buzkaEroded');

%%

SE = strel('square',3);
ertkadilatate = imdilate(ertka, SE);
figure();
subplot(1,2,1);
imshow(ertka);
title('ertka');

subplot(1,2,2);
imshow(ertkadilatate);
title('ertkadilatate');







