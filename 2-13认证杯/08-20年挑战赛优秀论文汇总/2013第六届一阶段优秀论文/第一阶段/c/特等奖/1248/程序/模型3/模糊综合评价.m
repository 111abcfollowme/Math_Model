clear;
clc;
A=xlsread('������9��ָ��÷�');
B=xlsread('������9��ָ��÷�','�Ϸ������');
C=xlsread('������9��ָ��÷�','�жȷ���');
D=xlsread('������9��ָ��÷�','Ƿ����');
 e=[A' B' C' D']';
 [l,n]=size(e);
 f=zeros(l,9);%����ָ��
 pj=zeros(4,9);%����ָ��
 m=zeros(1,9);
 n=zeros(1,9);
 jj=zeros(1,9);
 for i=1:9
     px=sort(e(:,i+1));
     m(i)=px(floor(0.55*l));
       n(i)=px(floor(0.05*l));
       jj(i)=(m(i)-n(i))/5;
 pj(1,i)= m(i)- jj(i);
  pj(2,i)=m(i)- 2*jj(i);
   pj(3,i)=m(i)- 3*jj(i);
    pj(4,i)=m(i)-4*jj(i);
 end
 pj=pj';
pj(5,:)=[0.8 0.6 0.4 0.2];
 
 r=zeros(9,4);
w=[ 26.595
26.595
5.985
5.985
3.5605
6.4716
11.6947
8.7
4.35
]'/100;
[m,n]=size(A);
defen1=zeros(m,1);
for j=1:m
    x=A(j,2:end);
 for i=1:9
     zz=pj(i,:);
       xx=x(i);
y(1)=(xx>=zz(1))+(zz(2)-xx)/(zz(2)-zz(1))*((xx>zz(2))&(xx<zz(1)));
y(2)=(xx>zz(2)&xx<=zz(1))*(xx-zz(1))/(zz(2)-zz(1))+(xx>=zz(3)&xx<=zz(2))*(zz(3)-xx)/(zz(3)-zz(2));
y(3)=(xx>zz(3)&xx<=zz(2))*(xx-zz(2))/(zz(3)-zz(2))+(xx>=zz(4)&xx<=zz(3))*(zz(4)-xx)/(zz(4)-zz(3));
y(4)=(xx>zz(4)&xx<=zz(3))*(xx-zz(3))/(zz(4)-zz(3))+(xx<=zz(4));
r(i,:)=y;
 end 
  d=fuzzy_zhpj(3,w,r);
  r=zeros(9,4);
  defen1(j)=d*[4;3;2;1];
end
disp('A��Ӱ��÷�Ϊ')
disp(sum(defen1)/m)
  
  [m,n]=size(B);
defen2=zeros(m,1);
for j=1:m
    x=B(j,2:end);
 for i=1:9
     zz=pj(i,:);
       xx=x(i);
y(1)=(xx>=zz(1))+(zz(2)-xx)/(zz(2)-zz(1))*((xx>zz(2))&(xx<zz(1)));
y(2)=(xx>zz(2)&xx<=zz(1))*(xx-zz(1))/(zz(2)-zz(1))+(xx>=zz(3)&xx<=zz(2))*(zz(3)-xx)/(zz(3)-zz(2));
y(3)=(xx>zz(3)&xx<=zz(2))*(xx-zz(2))/(zz(3)-zz(2))+(xx>=zz(4)&xx<=zz(3))*(zz(4)-xx)/(zz(4)-zz(3));
y(4)=(xx>zz(4)&xx<=zz(3))*(xx-zz(3))/(zz(4)-zz(3))+(xx<=zz(4));
r(i,:)=y;
 end 
  d=fuzzy_zhpj(3,w,r);
  r=zeros(9,4);
  defen2(j)=d*[4;3;2;1];
end
disp('B��Ӱ��÷�Ϊ')
  disp(sum(defen2)/m)
  
    [m,n]=size(C);
defen3=zeros(m,1);
for j=1:m
    x=C(j,2:end);
 for i=1:9
     zz=pj(i,:);
       xx=x(i);
y(1)=(xx>=zz(1))+(zz(2)-xx)/(zz(2)-zz(1))*((xx>zz(2))&(xx<zz(1)));
y(2)=(xx>zz(2)&xx<=zz(1))*(xx-zz(1))/(zz(2)-zz(1))+(xx>=zz(3)&xx<=zz(2))*(zz(3)-xx)/(zz(3)-zz(2));
y(3)=(xx>zz(3)&xx<=zz(2))*(xx-zz(2))/(zz(3)-zz(2))+(xx>=zz(4)&xx<=zz(3))*(zz(4)-xx)/(zz(4)-zz(3));
y(4)=(xx>zz(4)&xx<=zz(3))*(xx-zz(3))/(zz(4)-zz(3))+(xx<=zz(4));
r(i,:)=y;
 end 
  d=fuzzy_zhpj(3,w,r);
  r=zeros(9,4);
  defen3(j)=d*[4;3;2;1];
end
disp('C��Ӱ��÷�Ϊ')
  disp(sum(defen3)/m)
  
    [m,n]=size(D);
defen4=zeros(m,1);
for j=1:m
    x=D(j,2:end);
 for i=1:9
     zz=pj(i,:);
       xx=x(i);
y(1)=(xx>=zz(1))+(zz(2)-xx)/(zz(2)-zz(1))*((xx>zz(2))&(xx<zz(1)));
y(2)=(xx>zz(2)&xx<=zz(1))*(xx-zz(1))/(zz(2)-zz(1))+(xx>=zz(3)&xx<=zz(2))*(zz(3)-xx)/(zz(3)-zz(2));
y(3)=(xx>zz(3)&xx<=zz(2))*(xx-zz(2))/(zz(3)-zz(2))+(xx>=zz(4)&xx<=zz(3))*(zz(4)-xx)/(zz(4)-zz(3));
y(4)=(xx>zz(4)&xx<=zz(3))*(xx-zz(3))/(zz(4)-zz(3))+(xx<=zz(4));
r(i,:)=y;
 end 
  d=fuzzy_zhpj(3,w,r);
  r=zeros(9,4);
  defen4(j)=d*[4;3;2;1];
end
disp('D��Ӱ��÷�Ϊ')
  disp(sum(defen4)/m)
 

 
 
 
 