%% Author Information
% 01-April-2017 / updated on 01-Janunary-2018
%
% Reference
%    Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, and Simon J. Julier. 
%    Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns.
%    In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM, 2018.
%
%
% Extract your confusion matrix.
%
% example command:
% 
% buildconfusionmatrix(17, 'chi_2018_deep_thermal_imaging_outdoor_1',1) 

function [confusion_matrix] = buildconfusionmatrix(numberofclass, network_path_along_with_k_fold, isoutdoor)

    run ../../../matlab/vl_setupnn
    confusion_matrix=zeros(numberofclass,numberofclass); 

    load(['../data/' network_path_along_with_k_fold '/imdb.mat']);
    load(['../data/' network_path_along_with_k_fold '/net-epoch-11.mat'], 'net');
    
    net=dagnn.DagNN.loadobj(net);
    net.mode='test';
    idx=find(images.set==2);
    
    
    for i=1:length(idx)
        net.eval({'input',images.data(:,:,1,idx(i))})  
        switch isoutdoor
            case 0
                scores=net.vars(net.getVarIndex('pred')).value;
            case 1
                scores=net.vars(net.getVarIndex('drop2')).value;
        end
        scores=squeeze(gather(scores));
        [~, best]=max(scores); 

        h_gt=images.labels(idx(i)); 
        confusion_matrix(h_gt,best)=confusion_matrix(h_gt,best)+1;

    end
  

