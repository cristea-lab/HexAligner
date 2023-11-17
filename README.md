# HexProx

This repository was created to demonstrate and share image alignment method and spatial analysis method used in (spatial analysis of pancreatic tissue) (source). The study team aims to make the analysis more transparent and reproducible by others, and any comments of the method or the study are greatly appreciated. In addition, the study team hopes to iteratively improve this repository such that this analysis framework can be applied in other image analyses.

Included in this repository are:
- 2DBinaryAlign
- HexProx

## 2DBinaryAlign
This a jupyter notebook file (python script) that aligns two binary images that are misaligned by unknown amount of offset in the horiztonal and/or vertical directions. This script will overlay the given two images in all possible ways, pixel by pixel, and select the best aligned images. It assumes the images are in the same scale of units, in the same orientation, and expected to have some degree of overlap. The file has been modified so that it does not share patients' data but it has been shown in the study that the alignment works well in aligning collagen and cell images.

This script returns a dataframe of pixel coordinates of both images (labelled such that the pixel source is clear) and the aligned images in jpeg form.

For the current version, the script is hard-coded such that one of the image is exactly 2408 pixels by 2408 pixels and named the two images to be 'cell' and 'collagen', but the script can be amended for a general case. This repository will further be improved such that it will include an example toy images and be more generalizable for use.

This python code was ran in version 3.7.4.
