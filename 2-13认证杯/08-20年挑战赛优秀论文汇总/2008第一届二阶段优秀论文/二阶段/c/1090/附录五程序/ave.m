function y=ave(data)  %�����ݰ�վ�Ž��з��鲢��ƽ��ֵ
    k=data(1,1) 
    count=0;
    sumd=0;
    j=1;
    x=size(data);
    for i=1:x
        if data(i,1)==k
            count=count+1;%����
            sumd=sumd+data(i,2);
        else k=data(i,1);
            y(j)=sumd/count;   %���ֵ
            sumd=0;             %��ԭ�Դ���һ������
            count=0;   
            j=j+1;
        end   
    end
   y(j)=sumd/count;
end

        