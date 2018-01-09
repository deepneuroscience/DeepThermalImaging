# [Deep Thermal Imaging]
##### -
#### Information
 This README.md is created on 8th January 2018.

 Author: Youngjun Cho
 * Ph.D Candidate, UCLIC, Faculty of Brain Sciences, University College London (UCL)
 * MSc in Robotics, BSc in ICT
 * Email: youngjun.cho.15@ucl.ac.uk


#### Requirement
  Matlab (version>2012)
  MatConvNet (https://github.com/vlfeat/matconvnet): Deep CNN Framework for Matlab users.
  

#### Quick Instruction to install MatConvNet
  git clone https://github.com/vlfeat/matconvnet.git

  (On the command window of MATLAB)
  close all
  clc
  mex -setup C
  mex -setup C++

  (Detailed instruction is available at http://www.vlfeat.org/matconvnet/)


#### Quick Instruction to use the Deep Thermal Imaging API
  You can easily get example command lines by typing the below on the Matlab command window:

  help deep_thermal_imaging_training_and_testing
  help deep_thermal_imaging_utils/buildconfusionmatrix
  help deep_thermal_imaging_utils/testingasample
  help deep_thermal_imaging_utils/growingdataset
  help deep_thermal_imaging_utils/simpleDRQ


#### Citation:

Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, and Simon J. Julier. "Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns." In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM, 2018.
```
@inproceedings{youngjunDeepBreath,  
  title={Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns.},  
  author={Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, Simon J. Julier},  
  proceedingtitle={In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM},  
  year={2018}  
}  
```

#### Q&A
If you have any questions, feel free to contact us / http://youngjuncho.com .
