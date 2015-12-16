% load('Feature_Train.mat')
% final_feature1 = transpose(F_Train);
% % n = size(F_Train,1); % no of training images to consider


count =0;
Digit_Prior;
for k =1:1000
    k
    test_id = k;
    submatrix = F_Test(test_id,:);
    likelihood_matrix =[];
    likelihood =1;
    
    for digit = 0:9
        likelihood=1;
        for i = 1 : size(submatrix,2)
            value = submatrix(1,i);
            feature_id =i;
            if(likelihood==0)
%                 disp('likelihood exception');
                continue
            end
            likelihood = likelihood* Digit_CondProb(traininglabels,F_Train,digit,value,feature_id);
    
        end
        likelihood_matrix = vertcat(likelihood_matrix,likelihood);
    end

%% Finding max class
    likelihood_times_prior = likelihood_matrix.*prior_digit;
    a= find(likelihood_times_prior== max(likelihood_times_prior))-1;
    if(testlabels(k) ==a )
    count = count+1;
    end


end