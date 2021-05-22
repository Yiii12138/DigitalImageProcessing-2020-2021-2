function [output] = zftjhh(input)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
input_min=(min(min(min(input))));
input_max=(max(max(max(input))));
input0=double(input)
[x,y,z]=size(input);
%转化成灰度图
if(z>1)
    input=rgb2gray(input);
end
%计算input的灰度直方图
h=imhist(input,256)';

%计算input的灰度分布概率
pf=h/(x*y);

%计算input的累计分布
pa=cumsum(pf);

pa(1)=0;
pa_1=round(pa*255);

%计算每一个output
for i=1:x
    for j=1:y
        output(i,j)=pa_1(input0(i,j)+1);
    end
end
output=uint8(output);
end

