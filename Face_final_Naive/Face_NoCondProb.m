

function[likelihood_given_noface] = Face_NoCondProb(F_Train_Face,value,feature_id,is_notface_ids)
feature_given_noface_count =0;

    
         for j = 1:size(is_notface_ids,1)
        
           if(F_Train_Face(is_notface_ids(j),feature_id)==value)
             feature_given_noface_count = feature_given_noface_count+ 1;
           end
         end   
         likelihood_given_noface = log10(feature_given_noface_count/size(is_notface_ids,1));

end
