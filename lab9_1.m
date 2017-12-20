close all;
clearvars;
clc;
%%
dom = imread('dom.png');
domEdge = edge(dom,'log');

figure();
subplot(1,2,1);
imshow(dom);
title('oryginl');

subplot(1,2,2);
imshow(domEdge);
title('domEdge');

%%

domEdgeCanny = edge(dom,'canny');

figure();
subplot(1,2,1);
imshow(dom);
title('oryginl');

subplot(1,2,2);
imshow(domEdgeCanny);
title('domEdgeCanny');

%%

tresh = 27;
sigma = 0.09;
imageEdgeCannyComp = edge(dom,'log',tresh,sigma);

figure();
subplot(1,2,1);
imshow(dom);
title('oryginl');

subplot(1,2,2);
imshow(imageEdgeCannyComp);
title('imageEdgeCannyHand');


%%

tresh = 0.1;
sigma = 0.07;
imageEdgeCannyComp = edge(dom,'canny',tresh,sigma);

figure();
subplot(1,2,1); imshow(dom);
title('dom');
subplot(1,2,2); 
imshow(imageEdgeCannyComp);
title('imageEdgeCannyHand');

%%
sigma = 0.02;
imageEdgeCannyComp = edge(dom,'Sobel',sigma);

figure();
subplot(1,2,1); 
imshow(dom);
title('oryginl');

subplot(1,2,2);
imshow(imageEdgeCannyComp);
title('imageEdgeSobelHand');

%%

imageEdgelogComp = edge(dom,'log');
imageEdgeSobelComp = edge(dom,'Sobel');
imageEdgeCannyComp = edge(dom,'canny');

tresh1 = 0.5;
sigma1 = 0.5;

imageEdgelog = edge(dom,'log',tresh1,sigma1);

tresh2 = 0.05;

imageEdgeSobel = edge(dom,'Sobel',tresh2);

tresh3 = 0.5;
sigma3 = 0.5;
imageEdgeCanny = edge(dom,'canny',tresh3,sigma3);

figure();
subplot(2,3,1);
imshow(imageEdgelogComp);
title('log komp');
subplot(2,3,2);
imshow(imageEdgeSobelComp);
title('Sobel komp');
subplot(2,3,3);
imshow(imageEdgeCannyComp);
title('canny komp');

subplot(2,3,4);
imshow(imageEdgelog);
title('log ja');
subplot(2,3,5);
imshow(imageEdgeSobel);
title('Sobel ja');
subplot(2,3,6);
imshow(imageEdgeCanny);
title('canny ja');

%%

dom = zeros(11,11);
dom(7,2) = 1;

[H,tehta,ro] = hough(dom,'RhoResolution',0.1,'ThetaResolution',0.5);

dom(5,11) = 1;

[H2,tehta2,ro2] = hough(dom,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();

subplot(1,3,1);
imshow(dom);
title('oryginal');

subplot(1,3,2);
imshow(H,[]);
title('H');

subplot(1,3,3);
imshow(H2,[]);
title('H2');

%%
dom = zeros(11,11);
dom(7,2) = 1;
dom(5,11) = 1;
dom(1,1) = 1;
dom(4,6) = 1;

[H,theta,rho] = hough(dom,'RhoResolution',0.1,'ThetaResolution',0.5);

figure();
imshow(H,[]);
%%

rho144 = rho(144);
theta164 = theta(164);

x = 0:0.1:10;

y = (rho144 - x*cosd(theta164)/sind(theta164));
figure();
imshow(dom);

figure();
plot(x+1,y+1);
%%

kwadraty = imread('kwadraty.png');
kwadratyEdge = edge(kwadraty,'canny');

figure();
subplot(1,2,1); imshow(kwadraty);
title('kwadraty');
subplot(1,2,2); imshow(kwadratyEdge);
title('kwadratyEdge');

[H,theta,rho] = hough(kwadratyEdge,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,10);

figure();
imshow(H,[]);
plot(peaks(:,2),peaks(:,1),'ro');
title('maxima');

figure();
lines = houghlines(kwadratyEdge,theta,rho,peaks,'FillGap',5,'MinLength',7);
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
lab112 = imread('lab112.png');

figure();
subplot(1,3,1); imshow(lab112);
title('oryginal');

lab112 = im2bw(lab112,0.4);
lab112 = imcomplement(lab112);

SE = ones(1,100);
imageEroded = imerode(lab112,SE);
lab112 = imreconstruct(imageEroded,lab112);

lab112 = imcomplement(lab112);
subplot(1,3,2); 
imshow(lab112);
title('imcomplement');

lab112 = edge(lab112,'sobel');
subplot(1,3,3); 
imshow(lab112);
title('sobel');

[H,theta,rho] = hough(lab112,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,8);

figure();
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');
title('peaks');

figure();
lines = houghlines(lab112,theta,rho,peaks,'FillGap',5,'MinLength',7);
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

dom = imread('dom.png');

figure(1);
subplot(1,3,1); imshow(dom);

dom = im2bw(dom,0.3);
dom = imcomplement(dom);

SE = ones(1,100);
imageEroded = imerode(dom,SE);
dom = imreconstruct(imageEroded,dom);

dom = imcomplement(dom);

subplot(1,3,2); 
imshow(dom);
title('imcomplement');

dom = edge(dom,'sobel');
subplot(1,3,3);
imshow(dom);
title('sobel');

[H,theta,rho] = hough(dom,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,13);

figure();
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');
title('peaks');

figure();
lines = houghlines(dom,theta,rho,peaks);
imshow(dom); hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   length = norm(lines(k).point1 - lines(k).point2);
   if ( length > max_len)
      max_len = length;
      xy_long = xy;
   end
end
