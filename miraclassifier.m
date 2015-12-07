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
load Feature_Train; %Input = Feature Vectors
load Feature_Test;
load Feature_Test;
load Feature_Validation;
load labels;
label_tr=traininglabels;
label_te=testlabels;
Feature_train=F_Train;
Feature_test=F_Test;
w=zeros(10,size(Feature_train,2)); % Each feature has a weight
b=0;
wb=1;
correct=0;
tau=0;
C=0.000001;
% Dot product one feature vector with all the different weight vectors
for i=1:size(Feature_train,1)%100
    for j=1:(size(w,1))Feature_test=F_Test;
%% Learning
    z(j,1)=w(j,:)*Feature_train(i,:)';
    end
    [maximum, index] = max(z(:)); %Calculating argmax
%% Tau Calculation
    tau=min(C,((w(index,:)-w(label_tr(i,1)+1,:)).*Feature_train(i,:)+1)/abs(2*(Feature_train(i,:).*Feature_train(i,:))));
%% Weight Updates
    if index~=label_tr(i,1)+1
    w(label_tr(i,1)+1,:)=w(label_tr(i,1)+1,:)+tau*Feature_train(i,:);
    w(index,:)=w(index,:)-tau*Feature_train(i,:);
    end
    
end
% end
% w=(w-min(w(:)))/(max(w(:))-min(w(:))); %Normalization of weight vector
% save Weights w
%% Classification
for i=1:size(Feature_test,1)%100
    for j=1:(size(w,1))

   z(j,1)=w(j,:)*Feature_test(i,:)';
    end
   [maximum, index] = max(z(:)); %Calculating argmax
    if index==label_te(i,1)+1
      correct=correct+1;
    end
    
end
Percentage=correct/length(label_te)





