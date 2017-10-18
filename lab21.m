clearvars;
close all;
clc;
%%
parrot = imread('parrot.bmp');
figure();
imshow(parrot);
%%
xReScale = 1.5;
yReScale = 1.5;
[YY,XX] = size(parrot);

nYY = round(YY * yReScale);
nXX = round(XX * xReScale);
%%
xStep = XX/nXX;
yStep = YY/nYY;
newParrot = uint8(zeros(nYY,nXX));
%
for i = 0: nYY-1
   for j = 0 : nXX -1
       A = [0,0] - [round(i * xStep)+1,round(j * yStep)+1];
       B = A + [0,1];
       C = A + [1,1];
       D = A + [1,0];
      newParrot(i+1,j+1) = [1 - i, i] * [parrot(A),parrot(D);parrot(B),parrot(C)]*[1-j;j]; 
   end
end
figure();
imshow(uint8(newParrot));
