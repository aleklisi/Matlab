clc;
close all;
clearvars;
%%
moon = double(imread('kw.bmp'));
load maskiPP;

maskaR1 = conv2(moon,R1, 'same');
maskaR2 = conv2(moon,R2, 'same');
maskaP1 = conv2(moon,P1, 'same');
maskaP2 = conv2(moon,P2, 'same');
maskaS1 = conv2(moon,S1, 'same');
maskaS2 = conv2(moon,S2, 'same');

figure()
subplot(2,3,1);
imshow(moon);
title('oryginal');
subplot(2,3,2);
imshow(maskaR1-maskaR2,[]);
title('wersj R');
subplot(2,3,3);
imshow(maskaP1-maskaP2,[]);
title('wersja P');
subplot(2,3,4);
imshow(maskaS1-maskaS2,[]);
title('wersja S');

%%

OW = sqrt(maskaS1.^2 + maskaS2.^2); 

OW2 = abs(maskaS1) + abs(maskaS2.^2); 
subplot(2,3,5);
imshow(OW,[]);
title('OW^2');
subplot(2,3,6);
imshow(OW2,[]);
title('OWABS');

