% function [Percentage]= miraclassifier(tr,label_tr,te,label_te)
% ---------------------------------------------------------------------- %
% OCR: Perceptron
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% ---------------------------------------------------------------------- %
    clear all;
    close all;
    clc;
%% Variable Declaration
load FaceData;
ctr=1;

% load Feature_Train; %Input = Feature Vectors
% load Feature_Test;
% load Feature_Test;
% load Feature_Validation;
% load labels;
for iter=45:45:450
% label_tr=traininglabels(1:iter,:);
% label_te=testlabels;
% tr=F_Train(1:iter,:);
% te=F_Test;

label_tr=face_train_label(1:iter,:);
label_te=face_test_label;
tr=F_Train_Face(1:iter,:);
te=F_Test_Face;

w=zeros(2,size(tr,2)); % Each feature has a weight
b=0;
wb=1;
correct=0;

% Dot product one feature vector with all the different weight vectors

 % Run it until it converges
tau=0;
C=0.000001;
    tic;
% Dot product one feature vector with all the different weight vectors
for i=1:size(tr,1)%100
    for j=1:(size(w,1))
%% Learning
    z(j,1)=w(j,:)*tr(i,:)';
    end
    [maximum, index] = max(z(:)); %Calculating argmax
%% Tau Calculation
    tau=min(C,((w(index,:)-w(label_tr(i,1)+1,:)).*tr(i,:)+1)/abs(2*(tr(i,:).*tr(i,:))));
%% Weight Updates
    if index~=label_tr(i,1)+1
    w(label_tr(i,1)+1,:)=w(label_tr(i,1)+1,:)+tau*tr(i,:);
    w(index,:)=w(index,:)-tau*tr(i,:);
    end
    
end
time(ctr,1)=toc;
% end
% w=(w-min(w(:)))/(max(w(:))-min(w(:))); %Normalization of weight vector
% save Weights w
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
Percentage(ctr,1)=correct/length(label_te)*100;
ctr=ctr+1;
end




