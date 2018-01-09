# [Deep Thermal Imaging]
##### 　 　
#### Information
 This README.md is created on 8th January 2018.<br />
 Author: Youngjun Cho<br />
 * Ph.D Candidate, UCLIC, Faculty of Brain Sciences, University College London (UCL)
 * MSc in Robotics, BSc in ICT
 * Email: youngjun.cho.15@ucl.ac.uk<br />

##### 　 　
#### Requirement
  Matlab (version>2012)<br />
  
  MatConvNet (https://github.com/vlfeat/matconvnet): Deep CNN Framework for Matlab users.<br />
  
##### 　 　
#### Quick Instruction to install MatConvNet
  git clone https://github.com/vlfeat/matconvnet.git<br />
 　 　<br />
  (On the command window of MATLAB)<br />
  close all<br />
  clc<br />
  mex -setup C<br />
  mex -setup C++　 　<br />
  (Detailed instruction is available at http://www.vlfeat.org/matconvnet/)<br />
 　 　
##### 　 　
#### Quick Instruction to use the Deep Thermal Imaging API
  The first thing you need to do is to put the Deep Thermal Imaging API codes in the 'examples' directory.<br />
  (e.g., c:\your_directory\matconvnet\examples\DeepThermalImagingAPI\*")<br />
     


  You can easily get example command lines by typing the below on the Matlab command window:<br />
   

  help deep_thermal_imaging_training_and_testing<br />
  help deep_thermal_imaging_utils/buildconfusionmatrix<br />
  help deep_thermal_imaging_utils/testingasample<br />
  help deep_thermal_imaging_utils/growingdataset<br />
  help deep_thermal_imaging_utils/simpleDRQ<br />
  (Detailed instruction is available at http://youngjuncho.com/2018/deepthermalimagingapi/) <br/>
<br />
##### 　 　
#### Data sets: http://youngjuncho.com/datasets/

##### 　 　
#### Citation:
 　 　
Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, and Simon J. Julier. "Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns." In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM, 2018.<br />
```
@inproceedings{youngjunDeepBreath,  
  title={Deep Thermal Imaging: Proximate Material Type Recognition in the Wild through Deep Learning of Spatial Surface Temperature Patterns.},  
  author={Youngjun Cho, Nadia Bianchi-Berthouze, Nicolai Marquardt, Simon J. Julier},  
  proceedingtitle={In Proceedings of the 2018 CHI Conference on Human Factors in Computing Systems. ACM},  
  year={2018}  
}  
```

##### 　 　
#### Q&A
If you have any questions, feel free to contact us / http://youngjuncho.com .<br />
