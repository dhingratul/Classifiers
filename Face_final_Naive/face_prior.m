



%% Calculating priors
is_face_ids = find(face_train_label==1);
is_notface_ids = find(face_train_label==0);
c_face = size( is_face_ids,1); % c(y) # of traing instances with label 1 (is a face)
size_train_data = size(face_train_label,1); % n
c_notface = size_train_data - c_face;

prior_face = c_face/ size_train_data; % p(face)
prior_notface = c_notface/ size_train_data; % p(no face)
prior_face_example = transpose([prior_notface,prior_face]);