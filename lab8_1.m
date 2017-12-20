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
SE4 = [1,0,0;0,1,0;0,0,1];
buzkaEroded = imerode(buzka ,SE4);

figure();
subplot(1,2,1);
imshow(buzka);
title('buzka');

subplot(1,2,2);
imshow(buzkaEroded);
title('buzkaEroded');

%%
ertka = imread('ertka.bmp');
SE = strel('square',3);

figure();

subplot(2,3,1);
imshow(ertka);
title('ertka');

subplot(2,3,2);
imshow(imerode(ertka,SE));
title('imerode(ertka,SE)');

subplot(2,3,3);
imshow(imdilate(ertka, SE));
title('imdilate(ertka, SE)');

subplot(2,3,4);
imshow(imopen(ertka,SE));
title('imopen(ertka,SE)');

subplot(2,3,5);
imshow(imclose(ertka,SE));
title('imclose(ertka,SE)');


%%
ertka = imread('wyspa.bmp');
SE = strel('square',3);

figure();

subplot(2,3,1);
imshow(ertka);
title('ertka');

subplot(2,3,2);
imshow(imerode(ertka,SE));
title('imerode(ertka,SE)');

subplot(2,3,3);
imshow(imdilate(ertka, SE));
title('imdilate(ertka, SE)');

subplot(2,3,4);
imshow(imopen(ertka,SE));
title('imopen(ertka,SE)');

subplot(2,3,5);
imshow(imclose(ertka,SE));
title('imclose(ertka,SE)');
%%
ertka = imread('kolka.bmp');
SE = strel('square',3);

figure();

subplot(2,3,1);
imshow(ertka);
title('ertka');

subplot(2,3,2);
imshow(imerode(ertka,SE));
title('imerode(ertka,SE)');

subplot(2,3,3);
imshow(imdilate(ertka, SE));
title('imdilate(ertka, SE)');

subplot(2,3,4);
imshow(imopen(ertka,SE));
title('imopen(ertka,SE)');

subplot(2,3,5);
imshow(imclose(ertka,SE));
title('imclose(ertka,SE)');

%% minizadanie
ertka = imread('ertka.bmp');
SE = strel('square',3);

    ertka = imopen(ertka,SE);

for i = 1:2

    ertka = imdilate(ertka, SE);
end

figure();
imshow(ertka);

%%
I = imread('hom.bmp');
SE1 = [0,1,0;1,1,1;0,1,0];
SE2 = [1,0,1;0,0,0;1,0,1];

result = bwhitmiss(I,SE1,SE2);

figure();

subplot(1,2,1);
imshow(result);
title('changed');

subplot(1,2,2);
imshow(I);
title('not changed');

















