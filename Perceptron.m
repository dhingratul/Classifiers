function [output]= Perceptron(tr,te,label,param)
% ---------------------------------------------------------------------- %
% OCR: Perceptron
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% Last Editted: 25 Nov 2015
% ---------------------------------------------------------------------- %

%% Variable Declaration
w=zeros(28,28);
b;
wb=1;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Binary Threshold Neuron%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(param=='b')
z=b+tr.*w;
if(z>=0)
    y=1;
else
    y=0;
end
%% Learning:Binary Threshold Neuron
for i=1:28
    for j=1:28
        if(tr{i,j}=te{})
        end
    end
end

end

%%
%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Sigmoid Neuron %%%%
%%%%%%%%%%%%%%%%%%%%%%%%
if(param=='s')
    
end
end
