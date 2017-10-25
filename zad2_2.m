%%przygotowanie srodowiska jak w poleceniu
clearvars;
close all; 
clc;
%%wczytanie obrazu jako duble
PomImage = imread('chessboard.bmp');
ParrotImage = double(PomImage);
%%wyswietlenie wczytanego
figure();
imshow(uint8(ParrotImage));
%%
xScale = 1.5;
yScale = 1.5;

%%okreslenie starej rozdzielczosci
[yOldSize, xOldSize] = size(ParrotImage);

%%okreslenie nowej rozdzielczosci
yNewSize = floor(yOldSize * yScale); % floor or round zaokraglenie
xNewSize = floor(xOldSize * xScale);

newParrotImage = uint8(zeros(yNewSize, xNewSize));

xStep = xOldSize/xNewSize;
yStep = yOldSize/yNewSize;

for ii = 0 : (xNewSize - 1)
    for jj = 0 : (yNewSize - 1)
        i1 = floor(ii * xStep);
        j1 = floor(jj * yStep);
        
         if i1 > xOldSize - 2
            i1 = xOldSize - 2;
        end
        if j1 > yOldSize - 2
            j1 = yOldSize - 2;
        end
        
        A = [j1+1,i1+1];
		B = A + [0,1];
		C = A + [1,1];
		D = A + [1,0]; 
        valueA = double(ParrotImage(A(1),A(2)));
        valueB = double(ParrotImage(B(1),B(2)));
        valueC = double(ParrotImage(C(1),C(2)));
        valueD = double(ParrotImage(D(1),D(2)));
        
        i1 = i1 - ii * xStep;
        j1 = j1 - jj * yStep;
        
        newParrotImage(jj+1,ii+1) = [1-i1 i1] * [valueA, valueD; valueB, valueC] * [1-j1; j1];
    end
end
%%
figure();
imshow(uint8(newParrotImage));