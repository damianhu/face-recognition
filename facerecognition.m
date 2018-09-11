% path ='F:\中科院\day2\人脸\orl_faces\s';
npersons=40;
result=zeros(1,1);
f_martrix = readface(npersons,0);
nfaces = size(f_martrix,1);
meanvalue = mean(f_martrix);
 k = 80;
[pcaface,V] = fastpca(f_martrix,k,meanvalue);
lowvec = min(pcaface);
upvec = max(pcaface);
scaledface = scaling(pcaface,lowvec,upvec);
for c = 70:5:80;
for gamma = 0.0005:0.0005:0.002;
multisvmstruct = multiSVMtrain( scaledface,npersons,gamma,c );
[testface,realclass] = readface(npersons,1);
m = size(testface,1);
for i=1:m
    testface(i,:) = testface(i,:) - meanvalue;
end
pcatestface = testface *V;
lowvec_test=min(pcatestface);
upvec_test=max(pcatestface);
scaledtestface = scaling(pcatestface,lowvec_test,upvec_test);
trainclass = multiSVM(scaledface,multisvmstruct,npersons);
testclass = multiSVM(scaledtestface,multisvmstruct,npersons);
testaccuracy = sum(testclass==realclass)/length(testclass); 
display(['正确率：',num2str(testaccuracy)]); 
result=[result,testaccuracy];
trainaccuracy = sum(trainclass==realclass)/length(trainclass); 
display(['正确率：',num2str(trainaccuracy)]); 
end
end
c=[70,70,70,70,75,75,75,75,80,80,80,80];
gamma=[0.0005,0.001,0.0015,0.002,0.0005,0.001,0.0015,0.002,0.0005,0.001,0.0015,0.002];
[m,n]=size(result);
result2=result(1,2:n);
plot3(c,gamma,result2);



   
    









