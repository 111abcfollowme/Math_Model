clear;
clc;
A=xlsread('������9��ָ��÷�');
B=xlsread('������9��ָ��÷�','�Ϸ������');
C=xlsread('������9��ָ��÷�','�жȷ���');
D=xlsread('������9��ָ��÷�','Ƿ����');
 e=[A' B' C' D']';
 [m,n]=size(e);
 f=zeros(m,9);%����ָ��
 pj=zeros(4,9);%����ָ��
 
 for i=1:9
     f(:,i)=sort(e(:,i+1));
 pj(1,i)=f(floor(0.8*m),i);
  pj(2,i)=f(floor(0.6*m),i);
   pj(3,i)=f(floor(0.4*m),i);
    pj(4,i)=f(floor(0.2*m),i);
 end
 pj
 
 
 
 