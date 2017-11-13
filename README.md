# AFS: an open source toolkit of Axiomatic Fuzzy Sets theory

Axiomatic Fuzzy Sets (AFS) theory facilitates a significant step on how to convert the information in the observed data into fuzzy sets (membership functions) and implement their fuzzy logic operations, which offers a far more flexible and powerful tool for representing human knowledge and emulating the human recognition process. AFS theory has gained increasing interest from various research fields recently. AFS has been extended for formal concept analysis, rough set, clustering, classification and other learning tasks. These
newly proposed methods significantly boom the application of AFS theory. Due to its unique characteristic in semantic representation, AFS theory has been applied in many domains, such as business intelligence, computer vision, financial analysis, and clinical data analysis.

## WIKI
**For instructions of how to install/compile/use the project please see [WIKI](https://github.com/TadasBaltrusaitis/OpenFace/wiki)**

More details about the project - http://www.cl.cam.ac.uk/research/rainbow/projects/openface/

## Functionality

The system is capable of performing a number of facial analysis tasks:

- Facial Landmark Detection

![Sample facial landmark detection image](https://github.com/TadasBaltrusaitis/OpenFace/blob/master/imgs/multi_face_img.png)

- Facial Landmark and head pose tracking (links to YouTube videos)

<a href="https://www.youtube.com/watch?v=V7rV0uy7heQ" target="_blank"><img src="http://img.youtube.com/vi/V7rV0uy7heQ/0.jpg" alt="Multiple Face Tracking" width="240" height="180" border="10" /></a>
<a href="https://www.youtube.com/watch?v=vYOa8Pif5lY" target="_blank"><img src="http://img.youtube.com/vi/vYOa8Pif5lY/0.jpg" alt="Multiple Face Tracking" width="240" height="180" border="10" /></a>

- Facial Action Unit Recognition

<img src="https://github.com/TadasBaltrusaitis/OpenFace/blob/master/imgs/au_sample.png" height="280" width="600" >

- Gaze tracking (image of it in action)

<img src="https://github.com/TadasBaltrusaitis/OpenFace/blob/master/imgs/gaze_ex.png" height="182" width="600" >

- Facial Feature Extraction (aligned faces and HOG features)

![Sample aligned face and HOG image](https://github.com/TadasBaltrusaitis/OpenFace/blob/master/imgs/appearance.png)

## Citation

If you use any of the resources provided on this page in any of your publications we ask you to cite the following work and the work for a relevant submodule you used.

#### Overall system

**OpenFace: an open source facial behavior analysis toolkit**
Tadas Baltrušaitis, Peter Robinson, and Louis-Philippe Morency,
in *IEEE Winter Conference on Applications of Computer Vision*, 2016  

#### Facial landmark detection and tracking

**Constrained Local Neural Fields for robust facial landmark detection in the wild**
Tadas Baltrušaitis, Peter Robinson, and Louis-Philippe Morency. 
in IEEE Int. *Conference on Computer Vision Workshops, 300 Faces in-the-Wild Challenge*, 2013.  

#### Eye gaze tracking

**Rendering of Eyes for Eye-Shape Registration and Gaze Estimation**
Erroll Wood, Tadas Baltrušaitis, Xucong Zhang, Yusuke Sugano, Peter Robinson, and Andreas Bulling 
in *IEEE International. Conference on Computer Vision (ICCV)*,  2015 

#### Facial Action Unit detection

**Cross-dataset learning and person-specific normalisation for automatic Action Unit detection**
Tadas Baltrušaitis, Marwa Mahmoud, and Peter Robinson 
in *Facial Expression Recognition and Analysis Challenge*, 
*IEEE International Conference on Automatic Face and Gesture Recognition*, 2015 

# Copyright

Copyright can be found in the Copyright.txt

You have to respect boost, TBB, dlib, OpenBLAS, and OpenCV licenses.

# Commercial license

For inquiries about the commercial licensing of the OpenFace toolkit please contact innovation@cmu.edu

# Final remarks

I did my best to make sure that the code runs out of the box but there are always issues and I would be grateful for your understanding that this is research code and not full fledged product. However, if you encounter any problems/bugs/issues please contact me on github or by emailing me at Tadas.Baltrusaitis@cl.cam.ac.uk for any bug reports/questions/suggestions. 
