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
for i = 0: nYY-1
   for j = 0 : nXX -1
      newParrot(i+1,j+1) = parrot(round(i * xStep)+1,round(j * yStep)+1); 
   end
end
figure();
imshow(newParrot);
%%
