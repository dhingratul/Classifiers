% ---------------------------------------------------------------------- %
% OCR: Features
% Author: Atul Dhingra
% dhingra[dot]atul92[at]gmail.com
% Last Editted: 25 Nov 2015
% ---------------------------------------------------------------------- %
%% Variable Declaration
load testimages;
Data=testimages;
plus=0;
asterisk=0;
ctr=1;
Features=[];
r=size(Data,1);
c=size(Data,2);

%% Number of graypixels and blackpixels
for i=1:r
    for j=1:c
        for k=i:i+27
        if Data(k,j)=='+'
            plus=plus+1;
        end
        Features(ctr,1)=plus;
        if Data(k,j)=='#'
            asterisk=asterisk+1
        end
        Features(ctr,2)==asterisk;
        ctr=ctr+1;
    end
end