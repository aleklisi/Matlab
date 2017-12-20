close all;
clearvars;
clc;
%%
fingerprint = imread('fingerprint.bmp');
fingerprint1 = bwmorph(fingerprint,'thin',1);
fingerprint2 = bwmorph(fingerprint,'thin',2);
fingerprintinf = bwmorph(fingerprint,'thin',Inf);


figure();
subplot(1,4,1);
imshow(fingerprint);
title('orginal');

subplot(1,4,2);
imshow(fingerprint1);
title('1');

subplot(1,4,3);
imshow(fingerprint2);
title('2');

subplot(1,4,4);
imshow(fingerprintinf);
title('Inf');

%%

kosc = imread('kosc.bmp');

kosc_skel = bwmorph(kosc, 'skel',Inf);

figure();
subplot(1,2,1);
imshow(kosc);
title('oryginal');


subplot(1,2,2);
imshow(kosc_skel);
title('changed');

%%

text = imread('text.bmp');

SE = ones(51,1);
textopen = imopen(text,SE);
texteroz = imerode(text,SE);
textreconstuct = imreconstruct(texteroz, text);

figure();
subplot(2,2,1);
imshow(text);
title('changed');

subplot(2,2,2);
imshow(textopen);
title('textopen');

subplot(2,2,3);
imshow(texteroz);
title('texteroz');

subplot(2,2,4);
imshow(textreconstuct);
title('textreconstuct');

%%
text = imread('text.bmp');
textholes = imfill(text,'holes');

figure();
subplot(1,2,1);
imshow(text);
title('orygial');

subplot(1,2,2);
imshow(textholes);
title('textholes');

%%

textborder= imclearborder(text);

figure();
subplot(1,2,1);
imshow(text);
title('orygial');

subplot(1,2,2);
imshow(textborder);
title('textborder');

