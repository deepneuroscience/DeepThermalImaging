%% Author Information
% 08-Janunary-2018
%
%
% Reference
%    Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, and Simon J. Julier. 
%    Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns.
%    In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM, 2018.
%
%
% Building your dataset (based on the DeepTherm I and II data sets).
% 
% WE ASSUME that your recording (raw thermal matrix) only includes one material type (class)
% each class number corresponds to the material type within each indoor or
% outdoor materials summarized in the paper (Reference)
%
% Example command:
%%%% growingdataset(class, new_data, dataset_filename): if you choose the
%%%% existing class, then you can just input the number corresponding to
%%%% the class. If you want to add a new material type, then simply input 0
%%% CASE 1
% data=simpleDRQ(your_raw_thermal_matrix)
% growingdataset(0, data,
% 'chi2018_deep_thermal_imaging__dataset2__DRQ.mat'); % to add a new material.
%
%%% CASE 2
% data=simpleDRQ(your_raw_thermal_matrix)
% growingdataset(15, data,
% 'chi2018_deep_thermal_imaging__dataset2__DRQ.mat'); % to add more data to
% the existing class.

function growingdataset(class, new_data, dataset_filename)

    run ../../../matlab/vl_setupnn
    dataDir = fullfile(vl_rootnn, 'data') ;
    datapath =fullfile(dataDir, dataset_filename);
    
    load(datapath,'train_x', 'y1')

    if class==0
        class=max(y1)+1;
    end

    [~, ~, leng]=size(new_data);
    

    train_x(:,:,length(train_x)+1:length(train_x)+leng)=new_data;
    y1(length(y1)+1:length(y1)+leng)= class;
    
    save('new_dataset', 'train_x', 'y1');

