function [ pcaA,V ] = fastpca( A,k,mA )
tic
m = size(A,1);
Z=(double(A)-repmat(mA,m,1));
T = Z*Z';
[V,D] =eigs(T,k);
V = Z'*V;
  for i=1:k
        l=norm(V(:,i));
        V(:,i)=V(:,i)/l;
  end
pcaA = Z*V;
toc
disp toc
end

