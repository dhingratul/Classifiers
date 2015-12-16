% p_f1_0_g1;
% 
% p_f1_1_g1;

function[likelihood] = Digit_CondProb(traininglabels,F_Train,digit,value,feature_id)
    given_digit_ids = find(traininglabels == digit);
    count0=0;
    count1=0;
    count0_5=0;
    for i = 1 : size(given_digit_ids,1)
%         given_digit_ids(i)
%         temp= feature_id;
        flag= F_Train(given_digit_ids(i),feature_id);
        if(flag==0)
            count0 = count0+1;
        elseif(flag ==0.5)
            count0_5 = count0_5+1;
        elseif (flag ==1)
            count1 = count1+1;
        end
    end
    
    if(value == 0)
        likelihood = count0/size(given_digit_ids,1);
    elseif(value ==0.5)
        likelihood = count0_5/size(given_digit_ids,1);
    elseif(value ==1)
        likelihood = count1/size(given_digit_ids,1);

    end


end