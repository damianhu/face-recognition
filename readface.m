function [ f_matrix,rclass ] = readface( npersons,bool )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
rclass=zeros(npersons*5,1);  
f_matrix=zeros(npersons*5,112*92);  
for i=1:npersons  
    facepath='F:\�п�Ժ\day2\����\orl_faces\s';  
    facepath=strcat(facepath,num2str(i));  
    facepath=strcat(facepath,'\');  
    cachepath=facepath;  
    for j=1:5  
        facepath=cachepath;  
        if bool==0 %����ѵ������ͼ�������  
            facepath=strcat(facepath,num2str(j));  
            rclass((i-1)*5+j)=i;
        else %���������������  
            facepath=strcat(facepath,num2str(5+j));  
            rclass((i-1)*5+j)=i;  
        end  
        facepath=strcat(facepath,'.pgm');  
        img=imread(facepath);  
        f_matrix((i-1)*5+j,:)=reshape(img,1,112*92);  
    end  
end  

end

