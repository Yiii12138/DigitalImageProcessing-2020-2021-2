%读取图片
a=imread('D:\CAST\MATLAB\PROGRAM\二、Matlab图像操作\lena_color_512.tif')
%显示图片
figure(1)
subplot(4,4,1);
imshow(a);
title('读取、显示、保存图片测试')
%保存图片
imwrite(a,'1.读取、显示、保存图片\test.png')
%提取图像三通道信息
channel_1=a;
channel_2=a;
channel_3=a;
%将其他两个通道的灰度值变成0
channel_1(:,:,2)=0;
channel_1(:,:,3)=0;%只剩R通道
channel_2(:,:,1)=0;
channel_2(:,:,3)=0;%只剩G通道
channel_3(:,:,1)=0;
channel_3(:,:,2)=0;%只剩B通道
%显示 subplot(x,y,z)显示b行a列个图像，这是其中第z个
subplot(4,4,5);
imshow(channel_1);
title('R通道');
imwrite(channel_1,'2.3个单通道的灰度图像\R通道.png')
subplot(4,4,6);
imshow(channel_2);
title('G通道');
imwrite(channel_2,'2.3个单通道的灰度图像\G通道.png')
subplot(4,4,7);
imshow(channel_3);
title('B通道');
imwrite(channel_3,'2.3个单通道的灰度图像\B通道.png')
%将灰度值调整到0-255
subplot(4,4,9);
a_255_1=(a-min(a(:)))/(max(a(:))-min(a(:)))*255;
imshow(a_255_1);
title('灰度值0-255');
imwrite(a_255_1,'3.改变亮度、对比度\灰度值0-255.png')
subplot(4,4,10);
imshow(a,[]);
title('灰度值0-255（2）');
subplot(4,4,11);
imshow(a);
title('原图');
imwrite(a,'3.改变亮度、对比度\原图1.png')
b=imread('D:\CAST\MATLAB\PROGRAM\二、Matlab图像操作\lena_gray_512.tif')
%改变图像亮度、对比度
subplot(4,4,13);
b_cr=1.5*b;
imshow(b_cr);
title('对比度');
imwrite(b_cr,'3.改变亮度、对比度\对比度.png')
subplot(4,4,14);
b_l=b+50;
imshow(b_l);
title('亮度');
imwrite(b_l,'3.改变亮度、对比度\亮度.png')
subplot(4,4,15);
b_log=log(1+double(b))*2;
imshow(b_log,[]);
title('非线性点运算')
imwrite(b_log,'3.改变亮度、对比度\非线性点运算.png');
subplot(4,4,16);
imshow(b,[0,255]);
title('原图');
imwrite(b,'3.改变亮度、对比度\原图2.png')

figure(2)
c=imread('D:\CAST\MATLAB\PROGRAM\二、Matlab图像操作\lena_gray_512.tif');
translation=maketform('affine',[1 0 0;0 1 0;0 0 1]);%平移
translation=imtransform(c,translation);
subplot(3,3,1);
imshow(translation);
title('平移');
imwrite(translation,'4.几何变换\平移.png');
scale=maketform('affine',[1 0 0;0 0.5 0;0 0 1]);%缩放
scale=imtransform(c,scale);
subplot(3,3,2);
imshow(scale);
title('缩放');
imwrite(scale,'4.几何变换\缩放.png');
flip_1=maketform('affine',[-1 0 0;0 1 0;0 0 1]);%翻转
flip_1=imtransform(c,flip_1);
subplot(3,3,3);
imshow(flip_1)
title('水平翻转');
imwrite(flip_1,'4.几何变换\水平翻转.png');
flip_2=maketform('affine',[1 0 0;0 -1 0;0 0 1]);%翻转
flip_2=imtransform(c,flip_2);
subplot(3,3,4);
imshow(flip_2)
title('垂直翻转');
imwrite(flip_2,'4.几何变换\垂直翻转.png');
rotation=maketform('affine',[cosd(30) -sind(30) 0;sind(30) cosd(30) 0;0 0 1]);%旋转
rotation=imtransform(c,rotation);
subplot(3,3,5);
imshow(rotation);
title('旋转30°');
imwrite(rotation,'4.几何变换\旋转30°.png');
shear=maketform('affine',[1 0.1 0;0.1 1 0;0 0 1]);%错切
shear=imtransform(c,shear);
subplot(3,3,6);
imshow(shear);
title('错切');
imwrite(shear,'4.几何变换\错切.png');
perspective=maketform('affine',[1 0.1 0;0.1 0.1 0;0 0 1]);%透视
perspective=imtransform(c,perspective);
subplot(3,3,7);
imshow(perspective);
title('透视');
imwrite(perspective,'4.几何变换\透视.png');

figure(3)
d=imread('D:\CAST\MATLAB\PROGRAM\二、Matlab图像操作\lena_gray_512.tif');
subplot(3,2,1);
d_histogram=histogram(d,200);
title('直方图')
subplot(3,2,3);
imshow(d);
title('原图')
subplot(3,2,4);
dd=histeq(d);
imshow(dd);
title('直方图均衡');
imwrite(dd,'6.直方图均衡\直方图均衡.png')
subplot(3,2,5);
histogram(dd,200);
title('均衡后的直方图')