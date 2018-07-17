clc;
clear;
nps=43;%43����
result=zeros(1,1);
%��ȡѵ������%
[f_matrix,tclass]=readface(nps,0);
nfaces=size(f_matrix,1);%����������

%pca������ά%
mA=mean(f_matrix);%ƽ����

k=80;%ά��
[pcaface,V]=fastpca(f_matrix,k,mA);

%ѵ������scaling��%
lowvec=min(pcaface);
upvec=max(pcaface);
pcaface = scaling( pcaface,lowvec,upvec);

%����ѵ��%

c=100;
gamma=0.002;
multiSVMstruct=multiSVMtrain( pcaface,nps,gamma,c);


%��ȡ��������%
%[testface,rclass]=ReadFace(nps,1);
for i = 1:1:3
    for j = 2:2:10
inpath = 'F:\�п�Ժ\day2\����\orl_faces\s4';
inpath=strcat(inpath,num2str(i));  
inpath=strcat(inpath,'\',num2str(j),'.pgm');  
% imshow(inpath);
testface=double(ReadFaceTest(inpath));
testface=testface-mA;
pcatestface=testface*V;

lowvec_test=min(pcatestface);
upvec_test=max(pcatestface);
pcatestface = scaling( pcatestface,lowvec_test,upvec_test);


%svm����ʶ��%
testclass= multiSVM(pcatestface,multiSVMstruct,nps);
out_path='F:\�п�Ժ\day2\����\orl_faces\s';
out_path=strcat(out_path,num2str(testclass));
out_path=strcat(out_path,'\1.pgm');
figure;
s(1)=subplot(2,1,1);
imshow(inpath);
s(2)=subplot(2,1,2);
imshow(out_path)
title(s(1),'����ͼ');
title(s(2),'ʶ��ͼ');
    end
end