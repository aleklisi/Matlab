clc;
close all;
clearvars;
%%
moon = double(imread('moon.bmp'));

M = [0,1,0;1,-4,1;0,1,0];
M = M/9;

maskaskalowanie = (conv2(moon,M,'same')) + 128;
maskaskalowanieabs = abs(conv2(moon,M,'same'));

%%

h = fspecial('laplacian');
maskalaplasian = conv2(moon,double(h), 'same');

moonsharp = moon - maskalaplasian;
figure();
subplot(1,5,1);
imshow(moon,[]);
title('oryginał');
subplot(1,5,2);
imshow(maskaskalowanie,[]);
title('+128');
subplot(1,5,3);
imshow(maskaskalowanieabs,[]);
title('abs');
subplot(1,5,4);
imshow(maskalaplasian,[]);
title('laplasian');
subplot(1,5,5);
imshow(moonsharp ,[]);
title('diff');