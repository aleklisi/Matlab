clearvars;
close all;
clc;
%%
I = imread('rice.png');
[X,Y] = size(I);
Icopy = I;
W2 = 8;

for i = 1:X
    for j = 1:Y
        srednia = meanLT(i,j,W2,I,X,Y);
        if srednia < I(i,j)
            Icopy(i,j) = 255;
        else
            Icopy(i,j) = 0;
        end;
    end;
end;
figure();
imshow(I);
figure();
imshow(Icopy);

%%
Icopy2 = I;
k=0.1;
R = round(X/2);
W = 8;

for i =1:X
    for j = 1:Y
            srednia = meanLT(i,j,W,I,X,Y);
            odchylenie = stddevLT(i,j,W,I,srednia,X,Y);
            T = srednia*(1 - k*((odchylenie/R)-1));
            if (I(i,j) < T) 
                Icopy2 (i,j) = 0;
            else
                Icopy2 (i,j)= 255;
            end
    end
end

figure;
imshow(Icopy2 );

