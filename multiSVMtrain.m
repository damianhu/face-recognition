function [ multiSVMstruct ] = multiSVMtrain( traindata,nclass,gamma,c )
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for i=1:nclass-1
    for j=i+1:nclass
        X = [traindata(5*(i-1)+1:5*i,:);traindata(5*(j-1)+1:5*j,:)];
        Y = [ones(5,1);zeros(5,1)];
        multiSVMstruct{i}{j} = svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sqrt(1/2/gamma),'boxconstraint',c);
    end
end


    

