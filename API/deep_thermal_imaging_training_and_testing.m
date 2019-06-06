% This code is for training/testing the deep thermal imaging dataset
% through "k-fold cross validation".
%
% This work builds on Spatial Transformer based on a Deep Learning
% Framework - MatConvNet (https://github.com/vlfeat/matconvnet/)
%
% [References]
% 1. Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, and Simon J. Julier. 
%    Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns.
%    In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM, 2018.
%
% 2. Jaderberg, Max, Karen Simonyan, and Andrew Zisserman
%    Spatial transformer networks
%    Advances in Neural Information Processing Systems, 2015
%
%
%
% example commands:
% help deep_thermal_imaging_training_and_testing
% 1. Training / Testing of the DeepTherm I dataset.
% deep_thermal_imaging_training_and_testing(5, 15, 'chi2018_deep_thermal_imaging__dataset1__DRQ.mat', 'data/chi_2018_deep_thermal_imaging_indoor_', 0)
%
% 2. Training / Testing of the DeepTherm II dataset.
% deep_thermal_imaging_training_and_testing(5, 17, 'chi2018_deep_thermal_imaging__dataset2__DRQ.mat', 'data/chi_2018_deep_thermal_imaging_outdoor_', 1)
%
% Note: prepare a dataset in the directory ('../../data/')



function deep_thermal_imaging_training_and_testing(kfold, number_of_class, filename, directory, isoutdoor)


    if exist('CHO_CVO.mat')
        load('CHO_CVO.mat');
    else
        load(['../../data/' filename], 'y1')
        label=y1;
        CHO_CVO=cvpartition(label,'k',kfold);
        save('CHO_CVO', 'CHO_CVO');
    end


    for yjo=1:CHO_CVO.NumTestSets
        [net, info] = deep_thermal_imaging_basedon_stncnn(...
      'expDir', [directory num2str(yjo)], 'CHO_CVO', CHO_CVO, 'iter', yjo, 'classnum', number_of_class, 'mmfile', filename , 'dropout',isoutdoor); 
        %% If you want to take a look at network compositions and information, you can use variables: 'net' and 'info' here. 
    end
