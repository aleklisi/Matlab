imfinfo('lena.bmp');
%%
lena = imread('lena.jpg');
lenaSzara = rgb2gray(lena);
imshow(lena);
figure();
imshow(lenaSzara);
%%
imwrite(lenaSzara, 'lena_gray.bmp');
%%
figure();
colormap gray;
mesh(lenaSzara);
%%
figure();
plot(lena(10,:));
figure();
plot(lena(:,10));
%%
[ind,map] = gray2ind(lenaSzara,256);

figure();
imshow(ind,map);
%%
figure();
imshow(ind,colormap(winter(256)));