clc;
clear;
A=xlsread('��Ȩ��ʽ.xlsx');
num=zeros(1,12);%ͳ��ÿ�����и���
num(1)=1;
city=A(:,1);%���б��
gz=A(:,2);%���ý��
j=1;
for i=2:length(city)
    if(city(i)==city(i-1))
        num(j)=num(j)+1;
    else
        j=j+1;
        num(j)=num(j)+1;
    end
end
N=num;
ssum=zeros(1,12);%����
av=zeros(1,12);%ÿ��������ֵ
i=1;

for j=1:num(i)
    if(isnan(gz(j))==1)
        gz(j)=0;
        N(i)=N(i)-1;
    end
    ssum(i)=ssum(i)+gz(j);
end
av(i)=ssum(i)/N(i);
 t=find(gz(1:num(i))>av(i));
    if(length(t)~=0)
        disp('���ý���쳣����Ϊ')
        disp(t)
      N(i)=N(i)-t(i);
      ssum(i)=ssum(i)-sum(gz(t));
    end
    av(i)=ssum(i)/N(i);
cum=cumsum(num);
for i=2:12
    for j=cum(i-1)+1:cum(i)
         if(isnan(gz(j))==1)
        gz(j)=0;
        N(i)=N(i)-1;
    end
    ssum(i)=ssum(i)+gz(j);
    end
     t=find(gz>10*mean(gz));
    if(length(t)~=0)
        disp('���ý���쳣����Ϊ')
        disp(t)
      N(i)=N(i)-t;
      ssum(i)=ssum(i)-sum(gz(t));
    end
    av(i)=ssum(i)/N(i);
   
end
av'
