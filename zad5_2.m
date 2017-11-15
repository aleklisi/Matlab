clearvars;
close all;
clc;
%%
I = imread('rice.png');
[X Y] = size(I);
Icopy = I;
W2 = 8;

for i = 1:X
    for j = 1:Y
        srednia = meanLT(i,j,W2,I,X,Y);
        if srednia > I(i,j)
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
I = imread('rice.png');
[X Y] = size(I);
Icopy = I;
W2 = 8;

for i = 1:X
    for j = 1:Y
        srednia = stddevLT(i,j,W2,I,X,Y);
        if srednia > I(i,j)
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
