function [ r ] = get_degree_correlation( A)
%�ú�������������Ķ�-�������
%  �� r > 0 ��-������� assortativeness
%  �� r = 0 ��-��û����� nonassortativeness
%  �� r < 0 ��-�ȸ���� disassortativeness
% ���������һ��������ڽӾ���
%����Pearson�㷨��
B = triu(A);
M = size(find(B==1),1);
sum1=0;
sum2=0;
sum3=0;
A1 = find(B==1);
length = size(A1,1);
for i=1:length
  
    [x y]=ind2sub(size(B),A1(i));
    sum1 = sum1+get_degree(A,x)*get_degree(A,y);
    sum2 = sum2+get_degree(A,x)+get_degree(A,y);
    sum3 = sum3+get_degree(A,x)^2+get_degree(A,y)^2;
end

x1 = sum1/M-(sum2/(2*M))^2;
y1 = sum3/(2*M)-(sum2/(2*M))^2;
r=x1/y1;
end

