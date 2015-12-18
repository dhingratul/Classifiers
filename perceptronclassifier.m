% function [Percentage]= perceptronclassifier(tr,label_tr,te,label_te)
% ---------------------------------------------------------------------- %
% OCR: Perceptron
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% ---------------------------------------------------------------------- %
    clear all;
    close all;
    clc;
%% Variable Declaration
% load FaceData;
ctr=1;

load Feature_Train; %Input = Feature Vectors
load Feature_Test;
load Feature_Test;
load Feature_Validation;
load labels;
for iter=500:500:5000
label_tr=traininglabels(1:iter,:);
label_te=testlabels;
tr=F_Train(1:iter,:);
te=F_Test;

% label_tr=face_train_label(1:iter,:);
% label_te=face_test_label;
% tr=F_Train_Face(1:iter,:);
% te=F_Test_Face;

w=zeros(10,size(tr,2)); % Each feature has a weight
b=0;
wb=1;
correct=0;

% Dot product one feature vector with all the different weight vectors

 % Run it until it converges

    tic;
for i=1:size(tr,1)%100
    for j=1:(size(w,1))
%% Learning
    z(j,1)=w(j,:)*tr(i,:)';
    end
    [maximum, index] = max(z(:)); %Calculating argmax
%% Weight Updates
    if index~=label_tr(i,1)+1
    w(label_tr(i,1)+1,:)=w(label_tr(i,1)+1,:)+tr(i,:);
    w(index,:)=w(index,:)-tr(i,:);
    end
  
% end
% w=(w-min(w(:)))/(max(w(:))-min(w(:))); %Normalization of weight vector
% save Weights w
end
 
time(ctr,1)=toc;
%% Classification
for i=1:size(te,1)%100
    for j=1:(size(w,1))

   z(j,1)=w(j,:)*te(i,:)';
    end
   [maximum, index] = max(z(:)); %Calculating argmax
    if index==label_te(i,1)+1
      correct=correct+1;
    end
    
end
Percentage(ctr,1)=correct/length(label_te)*100
ctr=ctr+1;
end




