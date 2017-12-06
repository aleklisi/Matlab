clc;
close all;
clearvars;
%%
load('MR_data.mat');
%%
size = 7;

zmienna1 = convolution(I_noisy1,[size size]);
zmienna2 = convolution(I_noisy2,[size size]);
zmienna3 = convolution(I_noisy3,[size size]);
zmienna4 = convolution(I_noisy4,[size size]);
zmiennafree = convolution(I_noisefree,[size size]);

sigma = 15;

zmienna1b = bilateral(I_noisy1,[size size], sigma);
zmienna2b = bilateral(I_noisy2,[size size], sigma);
zmienna3b = bilateral(I_noisy3,[size size], sigma);
zmienna4b = bilateral(I_noisy4,[size size], sigma);
zmiennafreeb = bilateral(I_noisefree,[size size], sigma);
%%
figure();

subplot(3,5,1);
imshow(I_noisefree,[]);
title('oryginal free');
subplot(3,5,2);
imshow(I_noisy1,[]);
title('oryginal 1');
subplot(3,5,3);
imshow(I_noisy2,[]);
title('oryginal 2');
subplot(3,5,4);
imshow(I_noisy3,[]);
title('oryginal 3');
subplot(3,5,5);
imshow(I_noisy4,[]);
title('oryginal 4');

subplot(3,5,6);
imshow(zmiennafree,[]);
title('convolution');
subplot(3,5,7);
imshow(zmienna1,[]);
title('1');
subplot(3,5,8);
imshow(zmienna2,[]);
title('2');
subplot(3,5,9);
imshow(zmienna3,[]);
title('3');
subplot(3,5,10);
imshow(zmienna4,[]);
title('4');


subplot(3,5,11);
imshow(zmiennafreeb,[]);
title('bilateral');
subplot(3,5,12);
imshow(zmienna1b,[]);
title('1');
subplot(3,5,13);
imshow(zmienna2b,[]);
title('2');
subplot(3,5,14);
imshow(zmienna3b,[]);
title('3');
subplot(3,5,15);
imshow(zmienna4b,[]);
title('4');

