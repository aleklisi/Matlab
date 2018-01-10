clearvars;
clear all;
clc;

image1 = imread('dam_n_1.png');
image2 = imread('dam_n.png');

subplot(2,2,1); 
imshow(image1);
title('orginal dam_n_1');

subplot(2,2,2);
imshow(image2);
title('orginal dam_n_1');
Cn = image2;
[Cn1, num] = bwlabel(image1);


subplot(2,2,3);
imshow(Cn1,[]);
title('bwlabel dam_n_1');


[Y,X] = size(image1);
damImage = zeros(Y,X);
while true
    zmiany = 0;
    for Q = 1:num
       Cn1_copy = Cn1;
       for iY = 2:Y-1
           for iX = 2:X-1
               if Cn(iY,iX) > 0 && Cn1(iY,iX) == 0
                    C = Cn1(iY-1:iY+1,iX-1:iX+1);
                    C0 = nonzeros(C(:));
                    if sum(C0 == Q) > 0
                       zmiany = zmiany + 1;
                       CU = unique(C0);
                       if size(CU == 1)
                           Cn1_copy(iY,iX) = CU(1);
                       else
                           damImage(iY,iX) = 1;
                           Cn(iY,iX) = 0;
                       end
                    end
               end
           end
       end
       Cn1 = Cn1_copy;
    end
    if zmiany == 0
        break;
    end;
end

subplot(2,2,4);
imshow(damImage);
title('damImage');
