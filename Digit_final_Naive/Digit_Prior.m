% submatrix=[];
prior_digit=[];
% for  i = 1: n
%     submatrix = vertcat(submatrix,traininglabels(i));
% end
%% priors digit
n = size(traininglabels,1);
for i = 0:9
    a = find(traininglabels==i);
    b = size(a,1);
    prior_digit = vertcat(prior_digit,b/n);
end
clearvars  i a b