clear all
clc
load mm
aa=xlsread('ģ���ۺ����۵÷�.xls','�Ϸ������','B2:J2008');
b=xlsread('ģ���ۺ����۵÷�.xls','�Ϸ������','K2:K2008');
a=[aa(:,2:5) aa(:,8:9)];
n=length(b);
m=rand(1,100);
nm=floor(n*mm);
% �������ѵ�����Ͳ��Լ�
% ѵ��������80������
p_train = a(nm(1:75),:);
t_train = b(nm(1:75),:);
% ���Լ�����23������
p_test = a(nm(76:end),:);
t_test = b(nm(76:end),:);

%% ���ݹ�һ��

% ѵ����
[pn_train,inputps] = mapminmax(p_train');
pn_train = pn_train';
pn_test = mapminmax('apply',p_test',inputps);
pn_test = pn_test';
% ���Լ�
[tn_train,outputps] = mapminmax(t_train');
tn_train = tn_train';
tn_test = mapminmax('apply',t_test',outputps);
tn_test = tn_test';

%% SVMģ�ʹ���/ѵ��

% Ѱ�����c����/g����
[c,g] = meshgrid(-10:0.5:10,-10:0.5:10);
[m,n] = size(c);
cg = zeros(m,n);
eps = 10^(-4);
v = 5;
bestc = 0;
bestg = 0;
error = Inf;
for i = 1:m
    for j = 1:n
        cmd = ['-v ',num2str(v),' -t 2',' -c ',num2str(2^c(i,j)),' -g ',num2str(2^g(i,j) ),' -s 3 -p 0.1'];
        cg(i,j) = svmtrain(tn_train,pn_train,cmd);
        if cg(i,j) < error
            error = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end
        if abs(cg(i,j) - error) <= eps && bestc > 2^c(i,j)
            error = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end
    end
end
% ����/ѵ��SVM  
cmd = [' -t 2',' -c ',num2str(bestc),' -g ',num2str(bestg),' -s 3 -p 0.01'];
model = svmtrain(tn_train,pn_train,cmd);

%% SVM����Ԥ��
[Predict_1,error_1] = svmpredict(tn_train,pn_train,model);
[Predict_2,error_2] = svmpredict(tn_test,pn_test,model);
% ����һ��
predict_1 = mapminmax('reverse',Predict_1,outputps);
predict_2 = mapminmax('reverse',Predict_2,outputps);
% ����Ա�
result_1 = [t_train predict_1];
result_2 = [t_test predict_2];

%% ��ͼ
figure(3)
plot(1:length(t_train),t_train,'r-*',1:length(t_train),predict_1,'b:o')
grid on
legend('��ʵֵ','Ԥ��ֵ')
xlabel('�������')
ylabel('��ѹǿ��')
string_1 = {'ѵ����Ԥ�����Ա�';
           ['mse = ' num2str(error_1(2)) ' R^2 = ' num2str(error_1(3))]};
title(string_1)
figure(4)
plot(1:length(t_test),t_test,'r-*',1:length(t_test),predict_2,'b:o')
grid on
legend('��ʵֵ','Ԥ��ֵ')
xlabel('ѵ������')
ylabel('�ۺ����۵÷�')
string_2 = {'�޳�3����Ҫ���ز��Լ�Ԥ�����Ա�';
           ['mse = ' num2str(error_2(2)) ' R^2 = ' num2str(error_2(3))]};
title(string_2)

