count_face =0;
count_noface=0;
F_Train_Face = F_Train;
testsize=150;
     prior;
for k = 1: testsize
    k
    test_id = k;
    submatrix = F_Test_Face(test_id,:);
    likelihood_matrix =[];
    likelihood_noface =0;
    likelihood_face=0;

       for i = 61 :4200
            feature_id = i;
            value = F_Test_Face(k,i);
            if(likelihood_noface==-Inf)
                continue
            end
            likelihood_noface = likelihood_noface + (Face_NoCondProb(F_Train_Face,value,feature_id,is_notface_ids));
    
       end
    
       class_noface = likelihood_noface+log10(prior_notface);

        for i = 61 :4200
            feature_id = i;
            value = F_Test_Face(k,i);
            if(likelihood_face==-Inf)
                continue
            end
            likelihood_face = likelihood_face + (Face_CondProb(F_Train_Face,value,feature_id,is_face_ids));
    
       end
        
        class_face = likelihood_face+log10(prior_face);

    if(class_noface>class_face && facetest_label(k,1)==0)
        count_noface= count_noface+1;
    
    elseif(class_noface<class_face && facetest_label(k,1)==1)
          count_face= count_face+1;
    end


end
