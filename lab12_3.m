clearvars;
clear all;
clc;

obraz = imread('shapes.png');
srcImage = obraz;

obraz = bwlabel(obraz,4);

wsp = obliczWspolczynniki(obraz);
[YY,XX] = size(obraz);

for J = 1:YY
    for i = 1:XX
        piksel = obraz(J,i);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.33 && wsp(piksel,2) < 0.66)
            obraz(J,i) = 0;
        end
    end
end

figure();
subplot(1,2,1);
imshow(srcImage,[]);
title('oryginal');

subplot(1,2,2);
imshow(obraz,[]);
title('x');

