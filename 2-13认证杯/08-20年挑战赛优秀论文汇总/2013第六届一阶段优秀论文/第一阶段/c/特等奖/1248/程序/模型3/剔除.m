clear;
clc;
dq1=xlsread('������.et');
dq1=xlsread('������.et','Ƿ����7,22');
zhn=dq1(:,2);
zkn=dq1(:,3);
for j=1:length(zhn)
     if(isnan(zhn(j))==1)
        zhn(j)=0;
     end
end
n1=sum(zhn);%�ػ�����
for j=1:length(zkn)
     if(isnan(zkn(j))==1)
        zkn(j)=0;
     end
end
n2=sum(zkn); %�ؿͳ���
dq1(:,2)=zhn;
dq1(:,3)=zkn;
row=~any(isnan(dq1),2);
dq1=dq1(row,:);
