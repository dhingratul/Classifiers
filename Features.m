% % ---------------------------------------------------------------------- %
% % OCR: Features
% % Author: Atul Dhingra
% % dhingra[dot]atul92[at]gmail.com
% % Last Editted: 25 Nov 2015
% % ---------------------------------------------------------------------- %
% %% Ideas:
% %Each digit is 28x28 pixels, and each face/non-face image is 60x74 
% %   pixels, each pixel can take the following values:
% %     0: no edge (blank)
% %     1: gray pixel (+) [used for digits only]
% %     2: edge [for face] or black pixel [for digit] (#)
% 
% % 1. Euler Number
% % 2. PCA 
% % 3. The number of white pixels
% % 4. The principal components of the set of coordinates of the white pixels — tells you how "elongated" the shape is
% % 5. Segment into windows and count
% % 6. t-sne on the entire image
% % 7. HOG
% 
%% Variable Declaration
clear all;
close all;
clc;

load validationimages;
load labels;
Data=validationimages;
plus=0;
asterisk=0;
ctr=1;
F_validation=[];
r=size(Data,1);
c=size(Data,2);
Dataset=zeros(r,c);
label=size(testlabels,1);
%% Convert to MAT and Number of graypixels and blackpixels
for i=1:28:r
    for j=1:c
        for k=i:i+27
        if Data{k,j}=='+'; % Gray edge
            Dataset(k,j)=0.5;
            plus=plus+1;
        end
        
        if Data{k,j}=='#'
            Dataset(k,j)=1; %Black Edge
            asterisk=asterisk+1;
        end
        if isempty(Data{k,j})==1
            Data{k,j}=0;
            Dataset(k,j)=0;
        end
        end
        
    end
        F1(ctr,1)=plus;
        F1(ctr,2)=asterisk;
        F1(ctr,3)=plus+asterisk;
        ctr=ctr+1;
        asterisk=0;
        plus=0;
end
%% Reshaping into a Feature Vector
ctr2=1;
for i=1:28:r  
    for j=1:28
    A=Dataset(i:i+27,1:28);
    
    F_validation(ctr2,:)=A(:)';
    
    end
    ctr2=ctr2+1;
end
F_Validation=[F_validation]; %F1]; % Load extra features
save Feature_Validation F_Validation