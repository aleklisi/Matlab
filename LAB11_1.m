clearvars;
close all;
clc;
%%
knee = double(imread('knee.png'));
imshow(knee, []);

[YY, XX] = ginput(1);
XX = round(XX);
YY = round(YY);


imgSize = size(knee);

visited = zeros(imgSize);
segmented = zeros(imgSize);

stack = zeros(10000, 2);
iStack = 0;

iStack = iStack + 1;
stack(iStack, :) = [XX YY];

visited(XX, YY) = 1;
segmented(XX, YY) = 1;

mV = knee(XX, YY);
nS = 0;
mV = 0;
figure(2);
Icopy = knee;
imshow(Icopy, []);

%% Proper Loop
while(iStack > 0)
    currentPoint = stack(iStack, :);
    iStack = iStack - 1;
    nS = nS + 1;
    mV = (mV*(nS-1) + knee(currentPoint(1), currentPoint(2)))/nS;
    if mod(nS, 100) == 0
        Icopy(segmented>0) = 255;
        imshow(Icopy, []);
        drawnow;
    end
    
    if (currentPoint(1) ~= 1 && currentPoint(2) ~=1 && currentPoint(1)~=imgSize(1) && currentPoint(2)~=imgSize(2))
        for i = -1:1:1 
            for j = -1:1:1
                xNeigh = currentPoint(1)+i;
                yNeigh = currentPoint(2)+j;
                dist = abs(mV - knee(xNeigh, yNeigh));
                
                if dist<20 && visited(xNeigh, yNeigh) == 0
                    segmented(xNeigh, yNeigh) = 1;
                    iStack = iStack +1;
                    stack(iStack, :) = [xNeigh, yNeigh];
                end
                visited(xNeigh, yNeigh) = 1;
            end
        end
    end
end

figure(3);
imshow(segmented, []);

fil = fspecial('gaussian', 10, 1);
segmented = imfilter(segmented, fil);
figure(4);
imshow(segmented, []);
