a=imread('D:\CAST\MATLAB\PROGRAM\三、Matlab编程：直方图均衡\lena_gray_512.tif');
b=zftjhh(a);
figure(1)
subplot(3,2,1);
histogram(a,200);
title('原图直方图');
subplot(3,2,3);
imshow(a);
title('原图');
subplot(3,2,4);
imshow(b);
title('直方图均衡图');
subplot(3,2,5);
histogram(b,200);
title('自定义均衡直方图');
figure(2)
subplot(3,2,1);
histogram(a,200);
title('原图直方图');
subplot(3,2,3);
imshow(a);
title('原图');
b2=histeq(a);
subplot(3,2,4);
imshow(b2);
title('直方图均衡图');
subplot(3,2,5);
histogram(b2,200);
title('内置函数均衡直方图');