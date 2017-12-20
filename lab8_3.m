close all;
clearvars;
clc;

ferrari = imread('ferrari.bmp');

SE = strel('square',3);
ferrariErode = imerode(ferrari,SE);
ferrariDilate = imdilate(ferrari,SE);
ferrariDiff = imsubtract(ferrariDilate,ferrariErode);

figure();
subplot(1,4,1);
imshow(ferrari);
title('oryginl');

subplot(1,4,2);
imshow(ferrariErode);
title('ferrarierode');

subplot(1,4,3);
imshow(ferrariDilate);
title('ferraridilate');

subplot(1,4,4);
imshow(ferrariDiff);
title('ferraridiff');

%%

figure();
ferrariOpen = imopen(ferrari,SE);
ferrariClose = imclose(ferrari,SE);

subplot(1,3,1);
imshow(ferrari);
title('oryginl');

subplot(1,3,2);
imshow(ferrariOpen);
title('ferrariopen');

subplot(1,3,3);
imshow(ferrariClose);
title('ferrariclose');

%%

ferrariTop = imtophat(ferrari,SE);
ferrariBottom = imbothat(ferrari,SE);

figure();
subplot(1,3,1);
imshow(ferrari);
title('oryginal');

subplot(1,3,2);
imshow(ferrariTop);
title('top-hat');

subplot(1,3,3);
imshow(ferrariBottom);
title('bottom-hat');

%%

rice = imread('rice.png');
disk = strel('disk',10);

riceTophat = imtophat(rice,disk);

figure();
subplot(1,2,1);
imshow(rice);
title('oryginl');

subplot(1,2,2);
imshow(riceTophat);
title('riceTophat');

