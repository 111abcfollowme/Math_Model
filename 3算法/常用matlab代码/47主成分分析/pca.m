function [tg xs q px newdt]=pca(h)  %����ֻ�����Է�����ָ�����Ϊ�У���������Ϊ�е����ݣ�
h=zscore(h); %���ݱ�׼��
r=corrcoef(h); %�������ϵ������
disp('��������ϵ���������£�');
disp(r);
[x,y,z]=pcacov(r);  %������������������ֵ
s=zeros(size(z));
for i=1:length(z)
    s(i)=sum(z(1:i));
end
disp('���ϼ�������ϵ�������ǰ�������������乱����:');
disp([z,s])
tg=[z,s];
f=repmat(sign(sum(x)),size(x,1),1);
x=x.*f;
n=input('��ѡ��ǰn����Ҫ��������ɷ֣�\n');
disp('�ɴ˿ɵ�ѡ������ɷ�ϵ���ֱ�Ϊ:');
for i=1:n
    xs(i,:)=(x(:,i)');
end
newdt=h*xs';
disp('�����ɷֵĹ�����ΪȨ�أ��������ɷ��ۺ�����ģ��ϵ��:');
q=((z(1:n)./100)')
w=input('�Ƿ���Ҫ�������ɷ��ۺ�����?(y or n)\n');
if w==y
    df=h*x(:,1:n);
    tf=df*z(1:n)/100;
    [stf,ind]=sort(tf,'descend'); %���ս�������
    disp('���ɷ��ۺ����۽������');
    px=[ind,stf]
else
    return;
end