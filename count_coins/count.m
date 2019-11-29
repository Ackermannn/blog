
clc,clear
close all
I = imread('image/coins.png');
subplot(1,3,1)
imshow(I)
title('原图')
I = im2double(I);
[level,EM] = graythresh(I);

I2 = imbinarize(I,level); % imbinarize
subplot(1,3,2)
imshow(I2)
title('阈值分割')

se = strel('disk',2);
I3 = imclose(I2,se);%直接闭运算 闭：先膨胀再腐蚀，可以去掉目标内的孔。

se = strel('disk',10);
I3 = imerode(I3,se); %腐蚀

subplot(1,3,3)
imshow(I3)
title('形态学处理后')
[L,num] = bwlabel(I3);
num
set(gcf,'units','normalized','position',[0.1,0.2,0.8,0.6])
% https://www.cnblogs.com/nickup/p/5936206.html
% https://www.jianshu.com/p/2cf4d5b732ed 二值图像分析:案例实战(文本分离+硬币计数)
saveas(gcf,'image/save.bmp')