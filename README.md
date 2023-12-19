# HexProx

This repository was created to demonstrate and share the image alignment and spatial analysis methods used in (spatial analysis of pancreatic tissue) (source). Through this GitHub repository, the study team aims to make the analysis more transparent and reproducible, and any comments of the method or the study are greatly appreciated. In addition, the study team hopes to iteratively improve this repository such that this analysis framework can be applied in other image analyses.

Included in this repository are:
- 2DBinaryAlign
- HexProx

## 2DBinaryAlign
This a jupyter notebook file (python script) that aligns two binary images that are misaligned by an unknown amount of offset in the horizontal and/or vertical directions. This script will overlay the given two images in every possible way, pixel by pixel, and select the best aligned images. It assumes the images are in the same scale of units, in the same orientation, and expected to have some degree of overlap. The file has been modified so that it does not share patients' data. However, it has been shown in the study that the method effectively aligns collagen and cell images.

This script returns a dataframe of pixel coordinates of both images (labelled such that the pixel source is clear) and the aligned images in jpeg form. The dataframe can be used for the subsequent analysis used in HexProx

For the current version, the script is hard-coded such that one of the image is exactly 2408 pixels by 2408 pixels and named the two images to be 'cell' and 'collagen', but the script can be amended for a general case. This repository will further be improved such that it will include an example toy images and be more generalizable.

This python code was ran in version 3.7.4.

## HexProx
HexProx demonstrates spatial relationship of multi-level, two-dimensional datapoints respective to the categorical data of the input. For instance, using HexProx enables users to investigate the spatial proximity of immune cells and different types of fibroblasts. This dataset is considered multi-level as the cells come from multiple slides by various donors; requiring us to consider both cell-level and patient-level spatial relationship.

### Application on (study name)
To reflect the discrete nature of fibroblasts types, we overlay a tessellation of equal-sized hexagons on top of the range of data points and classify each hexagon by the contents of fibroblast cells. Specifically, for each hexagon that had at least one fibroblast cell, we classified each hexagon to be 'type A'-dominant if at least more than half of the fibroblast cells are 'type A'. 

After classifying each hexagon, we can then fit a genearlized linear mixed model (GLMM) to model the counts of immune cell by different fibroblasts types while accounting for random effects introduced by differences in immune cell content by different individuals.

We model the counts by using a negative binomial distribution as the mean-variance relationship is overdispersed and is non-linear. We account for random effects by slide-level and patient-level information of the hexagons.

This R code was ran in version 4.2.2.
