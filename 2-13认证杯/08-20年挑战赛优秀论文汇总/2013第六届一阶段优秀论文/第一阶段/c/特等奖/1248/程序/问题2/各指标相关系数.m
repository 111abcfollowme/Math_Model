r=zeros(10,4);
x=xlsread('ģ���ۺ����۵÷�','������','B2:K180');
x=zscore(x);
rr=corrcoef(x);
r(:,1)=rr(:,end);

x=xlsread('ģ���ۺ����۵÷�','�Ϸ������','B2:K2008');
x=zscore(x);
rr=corrcoef(x);
r(:,2)=rr(:,end);

x=xlsread('ģ���ۺ����۵÷�','�жȷ���','B2:K298');
x=zscore(x);
rr=corrcoef(x);
r(:,3)=rr(:,end);

x=xlsread('ģ���ۺ����۵÷�','Ƿ����','B2:K564');
x=zscore(x);
rr=corrcoef(x);
r(:,4)=rr(:,end);
