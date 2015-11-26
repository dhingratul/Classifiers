function [output]= Perceptron(tr,te,label)
% ---------------------------------------------------------------------- %
% OCR: Perceptron
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% Last Editted: 25 Nov 2015
% ---------------------------------------------------------------------- %

%% Variable Declaration
w=cell(28,28);
b;
wb=1;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Binary Threshold Neuron%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:28
    for j=1:28
z=b+tr{i,j}.*w{i,j};
if(z>=0)
    y=1;
else
    y=0;
end
   
%% Learning:Binary Threshold Neuron
        if(tr{i,j}~=te{i,j} && y==0)
            w{i,j}=w{i,j}+tr{i}{j};
        else if(tr{i,j}~=te{i,j} && y==1)
             w{i,j}=w{i,j}-tr{i}{j};   
        end
    end
end

end


