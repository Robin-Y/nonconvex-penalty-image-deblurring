function [psnrvalue]=psnr(original,test)

% PSNR=10*log_10(L^2/MSE)
% MSE=1/MN*sum_i=1^Msum_j=1^n(test(i,j)-original(i,j))^2
%����ԭʼͼ����źŹ���
% A=imread(original);
%A=rgb2gray(A);
A=double(original);
% B=imread(test);
%B=rgb2gray(B);
B=double(test);

%����MSE
%�ж�����ͼ���Ƿ���Ч
[m,n]=size(A);
[m2,n2]=size(B);
if m2~=m||n2~=n
    error('ͼ��ѡ�����');
end

%����MSE
msevalue=0;
for i=1:m
    for j=1:n
        msevalue=msevalue+(A(i,j)-B(i,j))^2;
    end
end
msevalue=msevalue/(m*n);
if msevalue==0
    error('ͼ��ѡ�����');
end

%��������ȣ���ֵ�����
psnrvalue=255^2/msevalue;
psnrvalue=10*log10(psnrvalue);
end