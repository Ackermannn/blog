
clc,clear
close all
I = imread('image/coins.png');
subplot(1,3,1)
imshow(I)
title('ԭͼ')
I = im2double(I);
[level,EM] = graythresh(I);

I2 = imbinarize(I,level); % imbinarize
subplot(1,3,2)
imshow(I2)
title('��ֵ�ָ�')

se = strel('disk',2);
I3 = imclose(I2,se);%ֱ�ӱ����� �գ��������ٸ�ʴ������ȥ��Ŀ���ڵĿס�

se = strel('disk',10);
I3 = imerode(I3,se); %��ʴ

subplot(1,3,3)
imshow(I3)
title('��̬ѧ�����')
[L,num] = bwlabel(I3);
num
set(gcf,'units','normalized','position',[0.1,0.2,0.8,0.6])
% https://www.cnblogs.com/nickup/p/5936206.html
% https://www.jianshu.com/p/2cf4d5b732ed ��ֵͼ�����:����ʵս(�ı�����+Ӳ�Ҽ���)
saveas(gcf,'image/save.bmp')