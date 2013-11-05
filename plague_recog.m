function [ result ] = plague_recog(filename)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

I=imread(filename);
Id=im2double(I);
%need resize image here
back=grep_background(Id);
Is=zeros(size(I));
for i=1:3
    Is(:,:,i)=Id(:,:,i)-back(:,:,i);
end

[Amat,inter]=select_and_regress(Is);
Ilog=rgb2logit(Is,Amat,inter);
Ibw=im2bw(Ilog,0);
M=strel('disk',3);
Iclose=imclose(Ibw,M);

label=bwlabel(~Iclose);
A=regionprops(label);
square=cat(1,A.BoundingBox);
square=square(:,3:4);
square=square(:,1).*square(:,2);
area=cat(1,A.Area);
area_square_ratio=area./square;
a=abs(area_square_ratio-0.7854);

rgblabel=label2rgb(label,[a a a]);
imshow(rgblabel);
result=Iclose;
%to count
end

