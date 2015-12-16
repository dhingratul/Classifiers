function[likelihood_given_face] = Face_CondProb(F_Train_Face,value,feature_id,is_face_ids)
feature_given_face_count =0;

    
         for j = 1:size(is_face_ids,1)
        
           if(F_Train_Face(is_face_ids(j),feature_id)==value)
             feature_given_face_count = feature_given_face_count+ 1;
           end
         end   
         likelihood_given_face = log10(feature_given_face_count/size(is_face_ids,1));

end