function [ Iout ] = rgb2logit(Iin,Amat,intercept)
%R,G,B * Amat' + intercept to a diffrentiational gray map
%   Detailed explanation goes here
[x,y,z] = size(Iin);
reshaped = reshape(Iin,x*y,z);
Iout = reshaped * Amat' +intercept ;
Iout = reshape(Iout,x,y);
end

