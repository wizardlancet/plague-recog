function [ result ] = plague_recog(filename)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

I=imread(filename);
Id=im2double(I);
%need resize image here
back=grep_background(Id);
for i=1:3
    Is(:,:,i)=Id(:,:,i)-back(:,:,i);
end

[Amat inter]=select_and_regress(Is);
Ilog=rgb2logit(Is,Amat,inter);
Ibw=im2bw(Ilog,0);
M=strel('disk',5);
Iclose=imclose(Ibw,M);

result=Iclose;
end

