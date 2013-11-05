function [ background ] = grep_background( I ,padding)
%STD the background with 4 conor p*p pixels
%   Detailed explanation goes here
if nargin <2
    padding=5;
end

[x,y,z]=size(I);

a=I(1:padding,1:padding,1:3);
b=I(1:padding,end-padding+1:end,1:3);
c=I(end-padding+1:end,1:padding,1:3);
d=I(end-padding+1:end,end-padding+1:end,1:3);

A=mean(mean(a));
B=mean(mean(b));
C=mean(mean(c));
D=mean(mean(d));

back=[A,B;C,D];

for i = 1:3
    back_min=min(min(back(:,:,i)));
    back(:,:,i)=back(:,:,i)-back_min;
end;

background=imresize(back,[x y]);

end

