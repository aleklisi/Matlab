%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%
kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');

%%
kolo = boolean(kolo);
kwadrat = boolean(kwadrat);
%%

zadNOT = ~ kolo;
zadAND = kolo & kwadrat;
zadOR =  kolo | kwadrat;
zadXOR = xor(kolo,kwadrat);
%%
imshow(zadNOT);
%%
imshow(zadAND);
%%
imshow(zadOR);
%%
imshow(zadXOR);
%%
subplot(2,2,1);
imshow(zadNOT);
subplot(2,2,2);
imshow(zadAND);
subplot(2,2,3);
imshow(zadOR);
subplot(2,2,4);
imshow(zadXOR);