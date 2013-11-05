function [ Amat,intercept ] = select_and_regress( I )
%Select 2 group of pointss and logistic regress
% No detail at present

%Todo:close figure after select
figure,
p_plague = impixel(I);
figure,
p_matrix = impixel(I);

yp=0.75 * ones(size(p_plague,1),1);
ym=0.25 * ones(size(p_matrix,1),1);

y0=[yp;
        ym];
Y=log((1-y0)./y0);
X=[p_plague; 
    p_matrix];
X=[ones(size(X,1),1) X];

[b,bint,r,rint,stats]=regress(Y,X);

intercept=b(1)';
Amat=b(2:4)';

close all;
end

