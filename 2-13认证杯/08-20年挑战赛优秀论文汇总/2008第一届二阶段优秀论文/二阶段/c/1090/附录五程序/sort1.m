function y=sort1(data)  
%����ʡ���ݰ�վ����м��㣬�Ȱ�Q�Ĵ�С����������
N=size(data);
    j=1;
    k(1)=1;
     for i=1:N-1
         if data(i,1)~=data(i+1,1)   %վ�����ֲ�ͬʱת����һ��վ�����ͳ�ƺͼ���
           j=j+1;
           k(j)=i+1;
         end  
     end 
     j=j+1;
     k(j)=N(1)+1;
   for i=1:j-1          
       cdata(i).os=data(k(i):k(i+1)-1,1);   %����ͳһ��ֵ��cdata�ṹ����
       cdata(i).b(:,2)=data(k(i):k(i+1)-1,2);
       cdata(i).b(:,1)=data(k(i):k(i+1)-1,3); 
       p=0;
       for l=1:k(i+1)-k(i)                              %������
           for c=l:k(i+1)-k(i)                     
              if cdata(i).b(l,1)>cdata(i).b(c,1)
                  p=cdata(i).b(l,:);
                  cdata(i).b(l,:)=cdata(i).b(c,:);
                  cdata(i).b(c,:)=p;
              end
           end
       end  
    if sum(cdata(i).b(:,1))~=0              %������վ��������ݣ��·ݵ�ɳ���������Ͳ�Ϊ��ʱ
       y(i,1:2)=polyfit(cdata(i).b(:,2)',cdata(i).b(:,1)',1);  %�ֱ�͸�վ����з���ϵ�������
       y(i,3)=cdata(i).os(1);
    else
       y(i,1:2)=[0 0];                         % ������Ϊ�㣬�����ϲ�����ɳ����������ϵı�Ҫ
       y(i,3)=cdata(i).os(1);
    end
   end
end

   
    