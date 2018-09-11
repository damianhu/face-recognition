function [ scaledface ] = scaling( faceMat,lowvec,upvec )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
upnew = 1;
lownew = -1;
[m,n] = size(faceMat);
scaledface = zeros(m,n);
for i=1:m
    scaledface(i,:) = lownew + (faceMat(i,:)-lowvec)./(upvec-lowvec)*(upnew-lownew);
end
end

