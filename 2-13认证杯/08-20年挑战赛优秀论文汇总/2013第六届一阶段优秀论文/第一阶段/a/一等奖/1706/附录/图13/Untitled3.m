clc
x=[4.0,6.0,10.0,20.0,30.0,40.0]
y1=[0.63,0.78,0.97,1.0,1.02,1.05]
y2=[0.59,0.73,0.96,1.0,1.03,1.04]
xi=1:1:41
y11 = interp1(x,y1,xi,'spline')
y22 = interp1(x,y2,xi,'spline')
plot(xi,y11,'r*-')
hold on
plot(xi,y22,'cp-')
plot(x,y2,'bo')
plot(x,y1,'o')
title('���Ⱥ��Ͷ��������Լ����ʹ�ϵ����������ֵ����')
xlabel('l��m��')
ylabel('\eta/\eta_{20}')
xlim([0,50])
ylim([0.6,1.1])
legend('\epsilon=4.8','\epsilon=6.0')