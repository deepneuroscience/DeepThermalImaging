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
% Quantize a thermal matrix (or sequence) using the 
% [Dynamic Range Quantization (DRQ)]
% Its basic concept is very similar to normalization, but this main
% characteristic is laid on the quantization process itself.
% - Mapping temperature values into gray color values
%
% example command:
% 
% first, we assume that (a) raw thermal matrix(ce) is composed of [height, width, length]
% 
% data= simpleDRQ(yourdata)

function [data] = simpleDRQ(Original_RawThermalMatrix)
    RawThermalMatrix=Original_RawThermalMatrix;
    [height, width, leng]=size(RawThermalMatrix);
    
    % Preprocessing.
    if height<width
        tmp = width;
        width= height;
        height = tmp;
        RawThermalMatrix=reshape(RawThermalMatrix,height,width,[]);
    end
    RawThermalMatrix=RawThermalMatrix((height- width*0.625)/2+1:(height+ width*0.625)/2, (width- width*0.625)/2+1:(width+ width*0.625)/2,:);
    [adjusted_h, adjusted_w, ~]=size(RawThermalMatrix);
    
    data=zeros(60,60,leng);
    
    for iter=1:leng
        temp_A=RawThermalMatrix(:,:,iter)
        mmin=min(min(temp_A));
        mmax=max(max(temp_A));
        
        for cho1=1:adjusted_w
            for cho2=1:adjusted_h
                temp_A(cho2,cho1,iter)=(temp_A(cho2,cho1,iter)-mmin)/(mmax-mmin);
            end
        end
        data(:,:,iter)=imresize(temp_A, [60 60]);
    end

    %% compare both original and quantized data.
    subplot(211)
    imshow(Original_RawThermalMatrix(:,:,1))
    subplot(212)
    imshow(data(:,:,1))
