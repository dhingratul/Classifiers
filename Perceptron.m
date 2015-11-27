%function [output]= Perceptron(tr,te,label)
% ---------------------------------------------------------------------- %
% OCR: Perceptron
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% Last Editted: 25 Nov 2015
% ---------------------------------------------------------------------- %
clear all;
close all;
clc;
%% Variable Declaration
load Feature_Train; %Input = Feature Vectors
load Feature_Test; 
load Labels;
label=traininglabels;
Feature=F_train;
w=zeros(10,size(F_train,2)); % Each feature has a weight
b=0;
wb=1;

for i=1:length(Feature)
    for j=1:(length(w))
%% Learning
    z=b+Feature(i,1).*w(j,1);
    if j==1
    maximum=z;
    index=j;
    end
    if(z>maximum)
    maximum=z;
    index=j;
    end    
    y=maximum;
%% Weight Updates
    if y~=label(index,1)
    w(i,1)=w(i,1)-Feature(j,1);
    w(index,1)=w(index,1)+Feature(j,1);
    end
    end
end
%end




