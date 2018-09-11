function [class] = multiSVM( testdata,multiSVMstruct,nclass )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
m = size(testdata,1);
voting = zeros(m,nclass);
for i = 1:nclass-1
    for j = i+1:nclass
        class = svmclassify(multiSVMstruct{i}{j},testdata);
        voting(:,i) = voting(:,i) + (class==1);
        voting(:,j) = voting(:,j) + (class==0);
    end
end
[~,class] = max(voting,[],2);
end

