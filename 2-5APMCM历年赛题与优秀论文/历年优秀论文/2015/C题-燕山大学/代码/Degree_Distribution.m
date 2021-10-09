function [M,N_DeD,N_predict,DeD,aver_DeD]=Degree_Distribution(A,P)
%% ������ͼ�и��ڵ�Ķȼ��ȵķֲ�����
%% ����㷨�����ÿ���ڵ�Ķȣ��ٰ�����Ƶ�ʼ�Ϊ���ʣ���P(k) 
%A��������������������ͼ���ڽӾ���
%DeD��������������������ͼ���ڵ�Ķȷֲ�
%aver_DeD������������������ͼ��ƽ����
N=size(A,2);
DeD=zeros(1,N);
for i=1:N
   % DeD(i)=length(find((A(i,:)==1)));
   DeD(i)=sum(A(i,:));
end
aver_DeD=mean(DeD);

if sum(DeD)==0
    disp('������ͼֻ����һЩ���������');
    return;
else 
    figure;     
    bar([1:N],DeD);  
    xlabel('�ڵ���n');
    ylabel('���ڵ�Ķ���K');
    title('����ͼ�и��ڵ�ĶȵĴ�С�ֲ�ͼ');
end

figure;
M=max(DeD);
predict=0:P;
for i=1:M+1;    %����ͼ�нڵ�Ķ������ΪM,��Ҫͬʱ���ǵ���Ϊ0�Ľڵ�Ĵ�����
    N_DeD(i)=length(find(DeD==i-1));
end
P_DeD=zeros(1,M+1);
P_DeD(:)=N_DeD(:);
bar([0:M],P_DeD,'r');
xlabel('�ڵ�Ķ� K');
ylabel('�ڵ��ΪK�Ľڵ����');
title('����ͼ�нڵ�ȵĸ����ֲ�ͼ');
hold on
N_predict=interp1([0:M],N_DeD,predict,'spline');
plot(predict,N_predict);
hold off
figure;
PK_DeD=zeros(1,M+1);
PK_DeD(:)=N_DeD(:)./sum(N_DeD);
bar([0:M],PK_DeD);
set(gca,'yscale','log','xscale','log');
xlabel('��k');
ylabel('��Ϊk�Ķ�����ռ�ı���Pk');
title('���ɶȷֲ�')






