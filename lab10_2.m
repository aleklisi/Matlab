clearvars;
clear all;
clc;

umbrealla = imread('umbrealla.png');
obrazPoczatkowy = umbrealla;

umbrealla = double(rgb2hsv(umbrealla));
imageH = umbrealla(:,:,1);
[Y,X] = size(imageH);

global sTh window_min_size segRes MRes index;
sTh = 0.05;
window_min_size = 8;
segRes = zeros(Y,X);
MRes = zeros(Y,X);
index = 0;

split(imageH,1,1,Y,X);

i = 0;

while i < index
    IB = segRes == i;
    if sum(IB(:)) == 0 
       i = i + 1;
       continue;
    end
    [yF,xF] = find(IB,1,'first');
    IB_dilate = imdilate(IB,strel('square',3));
    IB_diff = imabsdiff(IB_dilate,IB);
    IB_mult = IB_diff.* segRes;
    IB_mult_non_zeros = nonzeros(IB_mult);
    IB_unique = unique(IB_mult_non_zeros);
    joined = 0;
    for k = 1:numel(IB_unique)
        IBS = segRes == IB_unique(k);
        [yFF, xFF] = find(IBS,1,'first');        
        color_difference = abs(MRes(yF,xF) - MRes(yFF, xFF));
        if color_difference < (5/255)
            segRes(IBS) = i;
            joined = 1;
        end
    end
        if joined == 0
            i = i+1;
        end
end

segRes_unique = unique(segRes);
for ii = 1:numel(segRes_unique)
    obszar = segRes == segRes_unique(ii);
    if sum(obszar) < 40
        segRes(obszar) = 0;
    end
end

segRes_unique_2 = unique(segRes);
for ii = 1:numel(segRes_unique_2)
    obszar = segRes == segRes_unique_2(ii);
    segRes(obszar) = ii;
end

obrazKonocwy = label2rgb(segRes);

subplot(1,2,1);
imshow(obrazPoczatkowy);
subplot(1,2,2);
imshow(obrazKonocwy,[]);
