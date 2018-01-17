Lena = imread('lena.bmp');
FastFurierLena = fft2(Lena);
ShiftFastFurierLena = fftshift(FastFurierLena);
AmplitudeLena = abs(ShiftFastFurierLena);
AmplitudeLean2 = log10(AmplitudeLena + 1);
PhaseLena = angle(ShiftFastFurierLena.*(AmplitudeLena>0.0001));

figure();

subplot(1,3,1);
imshow(Lena);
title('oryginal');

subplot(1,3,2);
imshow(AmplitudeLean2,[]);
title(' logarytm dziesintny amplitudy');

subplot(1,3,3);
imshow(PhaseLena,[]); 
title('faza');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[F1,F2] = freqspace(512,'meshgrif');
Hd = ones(512);
r = sqrt(F1.^2 + F2.^2);
%Hd((r<0.6)) = 0;
Hd((r<0.1) | (r>0.6) ) = 0;
%Hd((r>0.1)) = 0;
figure();

colormap(jet(64));
mesh(F1,F2,Hd);
title('filtr kolowy wizualizacja');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LenaFiltr = ShiftFastFurierLena.*Hd;

nLenaImage = ifft2(ifftshift(LenaFiltr));
figure();
imshow(nLenaImage,[]);
title('przefiltrowana lena');

%% 
h = fwind1(Hd,hanning(21));
[H F1 F2] = freqz2(h,512,512);

figure();
mesh(F1,F2,H);

LeanRazH = ShiftFastFurierLena.*H;

LeanFurierShift = ifft2(ifftshift(LeanRazH));

figure();
imshow(LeanFurierShift,[]);
title('LeanFurierShift');