%% Author Information
% 01-April-2017 / updated on 01-Janunary-2018
%
% Youngjun Cho
% * Ph.D Candidate, UCLIC, Faculty of Brain Sciences, University College London (UCL)
% * MSc in Robotics, BSc in ICT
% * Email: youngjun.cho.15@ucl.ac.uk
%
% Reference
%    Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, and Simon J. Julier. 
%    Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns.
%    In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM, 2018.
%
%
% Classify a sample (quantized, via DRQ) thermal image
%
% example command:
% 
% load data %% this sample image data should be quantizsed by the DRQ function
% (for example, data= simpleDRQ(your_data))
% 
% testingasample(data, 'chi_2018_deep_thermal_imaging_outdoor_1',1) 

function [predicted_class] = testingasample(sampleimage, network_path_along_with_k_fold, isoutdoor)

    run ../../../matlab/vl_setupnn

    load(['../data/' network_path_along_with_k_fold '/net-epoch-11.mat'], 'net');
    
    net=dagnn.DagNN.loadobj(net);
    net.mode='test';
        
    
    net.eval({'input',sampleimage})  
    switch isoutdoor
        case 0
            scores=net.vars(net.getVarIndex('pred')).value;
        case 1
            scores=net.vars(net.getVarIndex('drop2')).value;
    end
    
    scores=squeeze(gather(scores));
    [~, best]=max(scores); 

    predicted_class=best;

  

