clearvars;
clear all;
clc;

obraz = imread('dom.png');
tresh = 28;
sigma = 0.08;
obrazEdge = edge(obraz,'log');

figure();

subplot(1,2,1);
imshow(obraz);
title('oryginal');

subplot(1,2,2);
imshow(obrazEdge);
title('detekcja log');

%%

obraz = imread('dom.png');
tresh = [0.1 0.2];
sigma = 0.07;

obrazEdge = edge(obraz,'canny',tresh,sigma);

figure();

subplot(1,2,1);
imshow(obraz);
title('oryginal');

subplot(1,2,2);
imshow(obrazEdge);
title('detekcja Canny');

%%

obraz = imread('dom.png');
tresh = 0.15;

obrazEdge = edge(obraz,'Sobel',tresh);

figure();

subplot(1,2,1);
imshow(obraz);
title('oryginal');

subplot(1,2,2);
imshow(obrazEdge,[]); 
title('detekcja Sobel');

%%
obraz = imread('dom.png');

obrazEdgeLog = edge(obraz,'log');
obrazEdgeSobel = edge(obraz,'Sobel');
obrazEdgeCanny = edge(obraz,'canny');


tresh1 = 0.5;
sigma1 = 0.5;
imageEdgeLoG1 = edge(obraz,'log',tresh1,sigma1);

tresh2 = 0.15;
imageEdgeSobel1 = edge(obraz,'Sobel',tresh2);

tresh3 = 0.5;
sigma3 = 0.5;
imageEdgeCanny1 = edge(obraz,'canny',tresh3,sigma3);

figure();

subplot(2,3,1); 
imshow(obrazEdgeLog); 
title('Log');

subplot(2,3,2);
imshow(obrazEdgeSobel);
title('Sobel');

subplot(2,3,3);
imshow(obrazEdgeCanny);
title('Canny');

subplot(2,3,4);
imshow(imageEdgeLoG1); 
title('Log1');

subplot(2,3,5);
imshow(imageEdgeSobel1);
title('Sobel1');

subplot(2,3,6);
imshow(imageEdgeCanny1);
title('Canny1');

%%

obraz = zeros(11,11);
obraz(7,2) = 1;

[H,tehta,ro] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);

obraz(5,11) = 1;

[H2,tehta2,ro2] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();
subplot(1,3,1);
imshow(obraz);
title('oryginal');

subplot(1,3,2);
imshow(H,[]);   
title('hough');

subplot(1,3,3);
imshow(H2,[]);  
title('hough 2');

%%
obraz = zeros(11,11);
obraz(2,2) = 1;
obraz(5,11) = 1;
obraz(1,1) = 1;
obraz(4,6) = 1;

[H,theta,rho] = hough(obraz,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();
subplot(1,1,1);
imshow(H,[]);
title('H');

%%
rho1 = rho(143);
theta1 = theta(163);
%%
x = 0:0.1:10;

y = (rho1 - x*cosd(theta1)/sind(theta1));
figure();
imshow(obraz);
hold on;
plot(x+1,y+1);

%%

obraz = imread('kwadraty.png');
obrazEdge = edge(obraz,'canny');

figure();
subplot(1,2,1);
imshow(obraz);

subplot(1,2,2); 
imshow(obrazEdge);

[H,theta,rho] = hough(obrazEdge,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,10);

figure();
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

figure();
lines = houghlines(obrazEdge,theta,rho,peaks,'FillGap',5,'MinLength',7);
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
%%

obraz = imread('lab112.png');

figure();
subplot(1,3,1);
imshow(obraz);

obraz = im2bw(obraz,0.4);
obraz = imcomplement(obraz);

SE = ones(1,100);
imageEroded = imerode(obraz,SE);
obraz = imreconstruct(imageEroded,obraz);

obraz = imcomplement(obraz);

subplot(1,3,2);
imshow(obraz);

obraz = edge(obraz,'sobel');

subplot(1,3,3);
imshow(obraz);

[H,theta,rho] = hough(obraz,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,8);

figure();
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

figure();
lines = houghlines(obraz,theta,rho,peaks);
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

%%
obraz = imread('dom.png');

figure();
subplot(1,3,1);
imshow(obraz);

obraz = im2bw(obraz,0.4);
obraz = imcomplement(obraz);

SE = ones(1,100);
imageEroded = imerode(obraz,SE);
obraz = imreconstruct(imageEroded,obraz);

obraz = imcomplement(obraz);

subplot(1,3,2);
imshow(obraz);

obraz = edge(obraz,'sobel');

subplot(1,3,3);
imshow(obraz);

[H,theta,rho] = hough(obraz,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,13);

figure(2);
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

figure(3);
lines = houghlines(obraz,theta,rho,peaks);
imshow(obraz); hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

%%
%czyścimy zmienne
clearvars;
clear all;
clc;

obraz = zeros(4,4);
obraz(2,1) = 1;
obraz(2,2) = 1;
obraz(2,3) = 1;
obraz(2,4) = 1;

myHoughImage = myHough(obraz,-100,100,0.5,-100,100,0.5);

subplot(1,2,1); imshow(obraz);
subplot(1,2,2); imshow(myHoughImage,[]);
