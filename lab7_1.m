clc;
close all;
clearvars;
%%

zmienna1 = convolution(I_noisy1,[256 256]);
zmienna2 = convolution(I_noisy2,[256 256]);
zmienna3 = convolution(I_noisy3,[256 256]);
zmienna4 = convolution(I_noisy4,[256 256]);
zmiennafree = convolution(I_noisyfree,[256 256]);

%%
figure();
subplot(2,3,1);
imshow(zmiennafree,[]);
title('free');
subplot(2,3,1);
imshow(zmienna1,[]);
title('1');
subplot(2,3,1);
imshow(zmienna2,[]);
title('2');
subplot(2,3,1);
imshow(zmienna3,[]);
title('3');
subplot(2,3,1);
imshow(zmienna4,[]);
title('4');

