    sim = inv( sparse(eye(size(train,1))) - lambda * train);   
    % �����Ծ���ļ���
    sim = sim - sparse(eye(size(train,1)));