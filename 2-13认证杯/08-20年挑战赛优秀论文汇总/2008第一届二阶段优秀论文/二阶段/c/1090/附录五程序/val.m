function y=val(p,q)  %����������ݺ�
    [a,b]=size(p);
    for i=1:a
        y(i)=polyval(p(i,:),q(i));
    end