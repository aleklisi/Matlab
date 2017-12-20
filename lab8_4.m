close all;
clearvars;
clc;

%%

calculator = imread('calculator.bmp');
figure();
imshow(calculator);

SE = ones(1,71);
calculatorErode = imerode(calculator,SE);

figure();
imshow(calculatorErode);
title('calculatorErode');

calculatorReconstruct = imreconstruct(calculatorErode,calculator);
calculatorOpen = imopen(calculator,SE);

figure();
subplot(1,2,1);
imshow(calculatorReconstruct);
title('calculatorReconstruct');

subplot(1,2,2);
imshow(calculatorOpen);
title('calculatorOpen');

calculatorSubtractReconstruct = imsubtract(calculator,calculatorReconstruct);
calculatorSubtractOpen = imsubtract(calculator,calculatorOpen);

figure();
subplot(1,2,1);
imshow(calculatorSubtractReconstruct);
title('calcSubtractReconstruct');

subplot(1,2,2);
imshow(calculatorSubtractOpen);
title('calcSubtractOpen');

SE2 = ones(1,11);
calculatorSubtractReconstructEroded2 = imerode(calculatorSubtractReconstruct,SE2);

calculatorSubtractReconstructRecostructed2 = imreconstruct(calculatorSubtractReconstructEroded2,calculatorSubtractReconstruct);

figure();
imshow(calculatorSubtractReconstructRecostructed2);
title('calculatorSubtractReconstructRecostructed2');

SE3 = ones(1,21);
calculatorSubtractReconstructRecostructedDilatate2 = imdilate(calculatorSubtractReconstructRecostructed2,SE3);
minn = min(calculatorSubtractReconstructRecostructedDilatate2,calculatorSubtractReconstruct);

calculatorSubtractReconstructConstruct3 = imreconstruct(minn,calculatorSubtractReconstruct);

figure();
imshow(calculatorSubtractReconstructConstruct3);
title('calculatorSubtractReconstructConstruct3');

