function [net,ps,ts] = fitwithnet(p,t)
% ��MATLAB����������

rand('seed',1.101461854E9) %�����������

% Normalize Inputs and Targets
[normInput,ps] = mapminmax(p);  %�淶�������
[normTarget,ts] = mapminmax(t);

% Create Network
numInputs = size(p,1);
numHiddenNeurons = 40;  % ���ز���Ԫ��Ŀ
numOutputs = size(t,1);
net = newff(minmax(normInput),[numHiddenNeurons,20,numOutputs],{'tansig','tansig','purelin'},'trainlm');

% �����ݷֱ�ָ��ѵ�������ԣ���֤����
testPercent = 0.20;  %��������Ϊ20%
validatePercent = 0.20;  % ��֤����Ϊ%20
[trainSamples,validateSamples,testSamples] = dividevec(normInput,normTarget,testPercent,validatePercent);
net.trainParam.epochs = 1500;  
net.trainParam.goal = 0;
%ѵ��
[net,tr] = train(net,trainSamples.P,trainSamples.T,[],[],validateSamples,testSamples);

 % ģ�����磬�ֱ��ѵ������֤����������������з���
[normTrainOutput,Pf,Af,E,trainPerf] = sim(net,trainSamples.P,[],[],trainSamples.T);
[normValidateOutput,Pf,Af,E,validatePerf] = sim(net,validateSamples.P,[],[],validateSamples.T);
[normTestOutput,Pf,Af,E,testPerf] = sim(net,testSamples.P,[],[],testSamples.T);

% ����ԭ��׼��
trainOutput = mapminmax('reverse',normTrainOutput,ts);
validateOutput = mapminmax('reverse',normValidateOutput,ts);
testOutput = mapminmax('reverse',normTestOutput,ts);

% ��ͼ�����ع���Ͻ����ͼ��ʽ��ʾ
figure
postreg({trainOutput,validateOutput,testOutput}, ...
  {t(:,trainSamples.indices),t(:,validateSamples.indices),t(:,testSamples.indices)});
