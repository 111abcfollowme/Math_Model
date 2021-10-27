%%Feature_Extract.m
function [FileName,mean_value,variance]=Feature_Extract(FileName)
% [mean_value,variance]=Feature_Extract(FileName)
% FileName����Ҫ�����Ĳ����ļ���·��
% mean_value�Ǽ���ó�������ֵ��ƽ��ֵ
% variance�Ǽ���ó�������ֵ�ķ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[F,Fs,NBITS] = wavread(FileName,20*44100);         % ���벨������
time = 20;                                         % ����ʱ��60��
T = 1:time*Fs;                                       % ����ʱ����
Wave = F(T);                                         % ����������
Wave = Wave/max(abs(Wave)); % ���ݹ�һ������
WLen = length(T); % ͳ�Ʋ������ݵ������

winlen = 2^nextpow2(Fs*20/1000); % ����Ϊ10ms~30ms,����ȡ20ms
dupwin = 2^nextpow2(Fs*5/1000); % Ϊ���������ԣ��������ص����ص�5ms
stepwin = winlen-dupwin; % ��ÿ���ƶ�stepwin��������
E = zeros(WLen-stepwin,1); %` ��ʼ����������
for i = 1:stepwin:WLen-stepwin % ����֡����FE
    xm = Wave(i:i+stepwin);
    E(i) = sum(xm.*xm);
end
E0 = [E zeros(length(E),1)]; % Ϊ��¼֡��λ��׼����E0��һά��E,
                             % �ڶ�ά����Ӧ��λ��
E0 = setxor(E0(:,1),0); % ɾ��ĩβ���¼
j=1;
for i = 1:length(E) % ��¼֡��λ��
    if E(i)>0
        E0(j,1)=E(i);
        E0(j,2)=i;
        j = j+1;
    end
end
Emin = min(E0(:,1)); % ����֡��������Сֵ
Emax = max(E0(:,1)); % ����֡���������ֵ
Emean = mean(E0(:,1)); % ����֡������ƽ��ֵ
lamda = 0.5; % �趨������ֵ
Ttfe = Emin + lamda * (Emean - Emin);

for i = 1:length(E0(:,1)) % ����E0�ж���֡����С�ھ�����ֵ��ֵ
    if E0(i,1) < Ttfe 
        E0(i,1) = 0;
    end
end
% Ѱ������Ƭ��
FER = ones(length(E0(:,1)),2); % ��ʼ��֡�����Ⱦ���
for i = 1:(length(E0(:,1))-1) % ����֡������
    if(and(E0(i,1),E0(i+1,1))) % ����ǰ֡���һ֡����Ϊ��
        FERa = E0(i+1,1)/E0(i,1);
        FERb = E0(i,1)/E0(i+1,1);
        FER(i,1)=max(FERa,FERb);
        FER(i,2)=E0(i,2);
    end
end
level = mean(FER(:,1)); % �趨�߳��˵���ֵ
result0 = zeros(length(FER(:,2)),1); % ��ʼ���������
j = 2;
if FER(1,1)-level >0
    result(1) = FER(1,2);
end              %���˳��߳��˵�
for i = 2:length(FER(:,2))-1
    if FER(i,2)-level >0
        if FER(i-1,2)-level <0
            result0(j) = FER(i,2);
            j = j+1;
        end
    end
end
result0 = setxor(result0,0); % ɾ���������Ԫ��
result = zeros(length(result0)-1,1);
for i = 1:length(result0)-1
    result(i) = result0(i+1)-result(i);
end
charaction = zeros(size(result));
for i = 1:length(result)-1
    charaction(i) = result(i+1)-result(i);
end
result = charaction;
FileName;                 %�����������
u = mean(result);
d = var(result);
disp([FileName])
disp([ '��ֵ��' num2str(u) '���' num2str(d)]);
mean_value = u; % ����������������
variance = d;
end




        






    