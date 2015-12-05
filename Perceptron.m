%function [output]= Perceptron(tr,label_tr,te,label_te)
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
% load Feature_Test; 
load labels;
label_tr=traininglabels;
Feature_train=F_Train;
w=zeros(10,size(Feature_train,2)); % Each feature has a weight
b=0;
wb=1;
label_te=testlabels;
correct=0;
Feature_test=F_Test;
% Dot product one feature vector with all the different weight vectors
 
% for k=1:10 % Run it until it converges
for i=1:length(Feature_train)%100
    for j=1:(size(w,1))
%% Learning
    z(j,1)=w(j,:)*Feature_train(i,:)';
    end
    [maximum, index] = max(z(:)); %Calculating argmax
%% Weight Updates
    if index~=label_tr(i,1)+1
    w(label_tr(i,1)+1,:)=w(label_tr(i,1)+1,:)+Feature_train(i,:);
    w(index,:)=w(index,:)-Feature_train(i,:);
    end
    
    
end
% end
% w=(w-min(w(:)))/(max(w(:))-min(w(:))); %Normalization of weight vector
% save Weights w
%% Classification
for i=1:length(Feature_test)%100
    for j=1:(size(w,1))

   z(j,1)=w(j,:)*Feature_test(i,:)';
    end
   [maximum, index] = max(z(:)); %Calculating argmax
    if index==label_te(i,1)+1
      correct=correct+1;
    end
    
end





