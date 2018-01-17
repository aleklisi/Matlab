clearvars;
close all;
clc;

ImageZeros = zeros(11,11);

ImageZeros(3,3) = 1;

[H theta rho] = hough(ImageZeros,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();

subplot(1,3,1);
imshow(H,[]);
title('jeden punkt');

ImageZeros(5,7) = 1;

[H theta rho] = hough(ImageZeros,'RhoResolution',0.1,'ThetaResolution',0.5);

subplot(1,3,2);
imshow(H,[]);

title('dwa punkty');

ImageZeros(4,8) = 1;

ImageZeros(3,11) = 1;

[H theta rho] = hough(ImageZeros,'RhoResolution',0.1,'ThetaResolution',0.5);

subplot(1,3,3);
imshow(H,[]);

title('cztery punkty');

XX = 180;
YY = 232;

o = theta(XX);
p = rho(YY);

x = [0:0.1:10];

y = ((p - x*cosd(o))/sind(o));

figure();
subplot(1,2,1);
imshow(ImageZeros,[]);

hold on;
plot(x+1,y+1);


{%% test ab

I = zeros(5,5);
I(3,1) = 1;
I(3,2) = 1;
I(3,3) = 1;
I(3,4) = 1;
I(3,5) = 1;
subplot(1,2,1);
imshow(I);
H = myHough(I,-100,100,1,-100,100,1);
subplot(1,2,2);
imshow(H,[]);
%%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars;
close all;
clc;

Image = imread('kwadraty.png');

figure()
subplot(1,2,1);
imshow(Image);

ImageEdge = edge(Image,'log');
subplot(1,2,2);
imshow(ImageEdge);

[H theta rho] = hough(ImageEdge);

figure();
subplot(1,2,1);
imshow(H,[]);
hold on;

peaks = houghpeaks(H,8);
plot(peaks,'o');

lines = houghlines(ImageEdge,theta,rho,peaks);

figure, imshow(ImageEdge), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars;
close all;
clc;

Image = imread('lab112.png');

figure();
subplot(2,2,1);
imshow(Image);
title('0ryginal');

ImageBnary = im2bw(Image, 0.4);

subplot(2,2,2);
imshow(ImageBnary);
title('ImageBnary');


ImageComplementary = imcomplement(ImageBnary);
Filer = ones(1,100);
ErodedImage = imerode(ImageComplementary,Filer);

ImageReconstructed = imreconstruct(ErodedImage,ImageComplementary);
ImageComplemetary2 = imcomplement(ImageReconstructed);

subplot(2,2,3);
imshow(ImageComplemetary2);
title('ImageComplemetary2');

ImageDetected = edge(ImageReconstructed,'canny');

subplot(2,2,4);
imshow(ImageDetected);
title('ImageDetected');

[H theta rho] = hough(ImageDetected);

figure();
imshow(H,[]);
title('hough space');

hold on;
peaks = houghpeaks(H,8);
plot(peaks,'o');
hold off;

lines = houghlines(ImageDetected,theta,rho,peaks);

figure();
imshow(ImageDetected);
hold on;

max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1;
   lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

ImageDom = imread('dom.png');
ImageDetected = edge(ImageDom,'log');
imshow(ImageDetected);

[H theta rho] = hough(ImageDetected);

peaks = houghpeaks(H,20);
plot(peaks,'o');

lines = houghlines(ImageDetected,theta,rho,peaks);

figure();
imshow(ImageDetected);
hold on;

max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end