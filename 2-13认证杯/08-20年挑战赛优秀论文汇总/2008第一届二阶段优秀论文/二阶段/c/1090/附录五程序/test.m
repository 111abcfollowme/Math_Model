%����ʡ���µĴ�Ԥ�����ݷ�������ģ�ͽ��з��� 
pn = mapminmax('apply',data,ps); % Ԥ����
an = sim(net1,pn); % ����
a = mapminmax('reverse',an,ts); %���ؽ��
e=abs(a-t);%�������
error=e./t;
plot(a,'go')        %�������ͼ
hold
plot(t,'r*')
figure
plot(error,'b.')