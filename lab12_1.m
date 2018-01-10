clearvars;
clear all;
clc;

obraz = imread('ccl1.png');


[YY,XX] = size(obraz);
L = 1;
nobraz = zeros(YY,XX);
id = zeros(100);
for i = 1:100
    id(i) = i;
end

for J = 2:YY-1
    for i = 2:XX-1
        if(obraz(J,i) ~= 0)
            A = nobraz(J-1,i-1);
            B = nobraz(J-1,i);
            C = nobraz(J-1,i+1);
            D = nobraz(J,i-1);
            sasiedzi = [A,B,C,D];

            if sum(sasiedzi) == 0 
                nobraz(J,i) = L;
                L = L+1;
            else
                sasiedzi1 = nonzeros(sasiedzi);
                minimum = min(sasiedzi1);
                maximum = max(sasiedzi1);

                if(minimum == maximum)
                    nobraz(J,i) = maximum;
                else
                    id = union(minimum,maximum,id);
                    nobraz(J,i) = minimum;
                end
            end 
        end
     end
end

lut = zeros(100);
for i = 1:100
   lut(i) = root(id(i),id); 
end

for J = 1:YY
    for i = 1:XX
        if nobraz(J,i) ~= 0
           nobraz(J,i) = lut(nobraz(J,i)); 
        end
    end
end
imageResult = imread('ccl1Result.png');

figure();
subplot(1,3,1); 
imshow(obraz); 
title('oryginal');

subplot(1,3,2);
imshow(nobraz,[]);
title('nobraz');

subplot(1,3,3);
imshow(imageResult);
title('lut');