% �������������Ϊȫ�ֱ�����������������
%����˵����qamu qasigma stamu stasigma uomu uosigma ldownmu ldowmsigma lupmu lpsigma va2mu va2sigma x1mu x1sigma x2mu x2sigma
%    ��ʾ����ʪ��qa  ����sta  �ܷ����u0  ��ˮ��ldown  ��������lup   ����va2  �ۺ�1x1 �ۺ�2x2 �ľ�ֵ�ͷ���
%    global k  k1 kst l0  ��ʾ���� k  k1 kst �Լ������¶�l0.
%    global st0 ��ʾ�����¶�st�ľ�ֵ,�䷽��ת��Ϊ����ֵ��ʾ

global qamu qasigma stamu stasigma uomu uosigma ldownmu ldowmsigma lupmu lpsigma va2mu va2sigma x1mu x1sigma x2mu x2sigma;
global k  k1 kst l0;
global st0;

%���ݶ���,����Ϊ��ֵ�������ṹΪ24*29*31
%% 29���� ĳ�·�31�� ÿ�����ʱ�̣�h�������� 

%%%%%%%%%%%%%%%%%%%%
%����ֵ����ֵ����

%ʪ��qa
qa=[
    ];

%����sta  
sta=[
    ];

%�ܷ����u0  
u0=[
    ];

%��ˮ��ldown  
ldown=[
    ];

%��������lup   
lup=[
    ];

%����va2
va2=[
    ];
%�����ĳ�·���ɳ������Ƶ��ֵ
    kk=[
        ];
%��С���˷���������
sum=zeros(nian,1);
control=100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�ռ�����
for k=0:1:100
        for kst= 0:100           %�Դ��������������� 
                for k1=0:100
                    for l0=0:100
 %�Էֲ����� ��������
    for qasigma=1:20
        for stasigma=1:5
            for uosigma=40:50 
                for ldowmsigma=1:10
                    for lpsigma =10:20
                        for va2sigma =10:20
                            
 for nian=1:1:28
     for yue=nian:nian+31
            sum(nian,1)=0;      
          for h=1:24
                qamu=qa(yue,h); stamu=sta(yue,h); uomu=uo(yue,h); ldownmu=ldown(yue,h); lupmu=lup(yue,h); va2mu=va2(2,1); 
            
             stg0=kst*u0mu+st0;
             x1mu=4*kst*u0mu+4*st0-4*stamu;
             x1sigma=4*a*u0sigma.^2+4*stasigma.^2;
             x2mu=stamu-stg0-0.608*k*kst*k1*l0*u0mu-0.608*k*k1*stmu*ldownmu+0.608*k*stmu*k1*lupmu-0.608*k*stmu*l0*k1;
             x2sima=stasigma.^2+(kst*u0sigma).^2+0.608*k*kst*k1*l0*u0sigma.^2+0.608*k*k1*stmu*ldownsigma.^2+0.608*k*stmu*k1*lupsigma.^2+0.608*k*stmu*k1*lupsigma.^2;
                 
             %�������
                    if(ttdiv(1000)>0.4) 
                    sum(nian,1)=sum(nian,1)+1;  %���ܼ��Ƚ��п��ƣ���ͳ�����п��ܲ���ɳ�����Ĵ��������п��ơ�
                    end
          end
     end
 end
%%��С���˷��ж�
    totil=0;
    for nian=1:29
         totil=totil+(sum(nian,1)-kk(nian,1)).^0.5;
    end
    totil=totil.^0.5;
    if totil=control
        control=totil;
        %%%��������ֵ
            ekst=kst; 
            ek1=k1;        
            el0=l0;
            ek=k;
            eqasigma=qasigma;
            estasigma=stasigma;  
            euosigma=uosigma; 
            edowmsigma=dowmsigma;
            elpsigma=lpsigma;
            eva2sigma=va2sigma; 
            ex1sigma=x1sigma; 
            ex2sigma=x2sigma;
    end

                        end
                    end
                end
            end
        end
    end
                    end
                end
        end
end

                                
        
                