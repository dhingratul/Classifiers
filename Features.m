% ---------------------------------------------------------------------- %
% OCR: Features
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% Last Editted: 25 Nov 2015
% ---------------------------------------------------------------------- %
%% Variable Declaration
clear all;
close all;
clc;

load validationimages;
Data=validationimages;
plus=0;
asterisk=0;
ctr=1;
F_validation=[];
r=size(Data,1);
c=size(Data,2);

%% Number of graypixels and blackpixels
for i=1:28:r
    for j=1:c
        for k=i:i+27
        if Data{k,j}=='+'
            plus=plus+1;
        end
        
        if Data{k,j}=='#'
            asterisk=asterisk+1;
        end
        if isempty(Data{k,j})==1
            Data{k,j}=0;
        end
        end
        
    end
        F_validation(ctr,1)=plus;
        F_validation(ctr,2)=asterisk;
        F_validation(ctr,3)=plus+asterisk;
        ctr=ctr+1;
        asterisk=0;
        plus=0;
end
save Feature_Validation F_validation