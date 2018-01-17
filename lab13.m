clearvars;
clear all;
clc;

dwieFale = imread('dwieFale.bmp');

FastFurierDwieFale = fft2(dwieFale);
ShiftFastFurierDwieFale = fftshift(FastFurierDwieFale);

figure();
subplot(3,1,1);
imshow(dwieFale,[]);
title('oryginal');

subplot(3,1,2);
imshow(FastFurierDwieFale);
title('FastFurierDwieFale');

subplot(3,1,3);
imshow(ShiftFastFurierDwieFale);
title('ShiftFastFurierDwieFale');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Amplitude = abs(ShiftFastFurierDwieFale);
Amplitude2 = log10(Amplitude + 1);
Phase = angle(ShiftFastFurierDwieFale.*(Amplitude>0.0001));

figure();
subplot(3,1,1);
imshow(ShiftFastFurierDwieFale);
title('ShiftFastFurierDwieFale');

subplot(3,1,2);
imshow(Amplitude2,[]);
title('logarytm dizesitny amplitudy');

subplot(3,1,3);
imshow(Phase,[]);
title('faza');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F1 = fft(dwieFale,[],1);
F2 = fft(F1,[],2);

figure();

subplot(1,2,1);
imshow(FastFurierDwieFale);
title('pierwsza transformata');

subplot(1,2,2);
imshow(F2);
title('druga transformata');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kwadrat = imread('kwadrat.bmp');

FastFurierKwadrat = fft2(kwadrat);

ShiftFastFurierKwadrat = fftshift(FastFurierKwadrat);
Amplitude = abs(ShiftFastFurierKwadrat);
Amplitude2 = log10(Amplitude + 1);
Phase = angle(ShiftFastFurierKwadrat.*(Amplitude>0.0001));

figure();

subplot(2,4,1);
imshow(kwadrat);
title('oryginal');

subplot(2,4,2);
imshow(ShiftFastFurierKwadrat);
title('fImage');

subplot(2,4,3);
imshow(Amplitude2,[]);
title('logarytm dziesintny amplitudy');

subplot(2,4,4);
imshow(Phase,[]);
title('faza');

kwadratS = imread('kwadratS.bmp');

FastFurierKwadratS = fft2(kwadratS);
ShiftFastFurierKwadratS = fftshift(FastFurierKwadratS);
Amplitude = abs(ShiftFastFurierKwadratS);
Amplitude2 = log10(Amplitude + 1);
Phase = angle(ShiftFastFurierKwadratS .*(Amplitude>0.0001));

subplot(2,4,5);
imshow(kwadratS);
title('oryginal');

subplot(2,4,6);
imshow(ShiftFastFurierKwadratS);
title('fImage');

subplot(2,4,7);
imshow(Amplitude2,[]);
title('logarytm dziesintny amplitudy');

subplot(2,4,8);
imshow(Phase,[]);
title('faza');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Kolo = imread('kolo.bmp');

FastFurierKolo = fft2(Kolo);
ShiftFastFurierKolo = fftshift(FastFurierKolo);
ifKolo = ifftshift(ShiftFastFurierKolo);
nImage = ifft2(ifKolo);
KoloUint8 = uint8(nImage);
KoloAbsDiff = imabsdiff(Kolo,KoloUint8);
imshow(KoloAbsDiff,[]);
