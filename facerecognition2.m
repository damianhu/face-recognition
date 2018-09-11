clc;
clear;
nps=43;%43个人
result=zeros(1,1);
%读取训练数据%
[f_matrix,tclass]=readface(nps,0);
nfaces=size(f_matrix,1);%人脸的数量

%pca特征降维%
mA=mean(f_matrix);%平均数

k=80;%维度
[pcaface,V]=fastpca(f_matrix,k,mA);

%训练数据scaling化%
lowvec=min(pcaface);
upvec=max(pcaface);
pcaface = scaling( pcaface,lowvec,upvec);

%样本训练%

c=100;
gamma=0.002;
multiSVMstruct=multiSVMtrain( pcaface,nps,gamma,c);


%读取测试数据%
%[testface,rclass]=ReadFace(nps,1);
for i = 1:1:3
    for j = 2:2:10
inpath = 'F:\中科院\day2\人脸\orl_faces\s4';
inpath=strcat(inpath,num2str(i));  
inpath=strcat(inpath,'\',num2str(j),'.pgm');  
% imshow(inpath);
testface=double(ReadFaceTest(inpath));
testface=testface-mA;
pcatestface=testface*V;

lowvec_test=min(pcatestface);
upvec_test=max(pcatestface);
pcatestface = scaling( pcatestface,lowvec_test,upvec_test);


%svm人脸识别%
testclass= multiSVM(pcatestface,multiSVMstruct,nps);
out_path='F:\中科院\day2\人脸\orl_faces\s';
out_path=strcat(out_path,num2str(testclass));
out_path=strcat(out_path,'\1.pgm');
figure;
s(1)=subplot(2,1,1);
imshow(inpath);
s(2)=subplot(2,1,2);
imshow(out_path)
title(s(1),'测试图');
title(s(2),'识别图');
    end
end