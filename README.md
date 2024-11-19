# Hex Aligner
This tool has two main functions: (1) to align equally-scaled 2D images (2DBinaryAlign), and (2) to tesselate image into non-overlapping, equally-sized hexagons for downstream analysis (HexTess). Users can clone the attached jupyter notebook files to adopt the code for their own use.

## 2DBinaryAlign
2DBinaryAlign aligns two binary images that are misaligned by an unknown amount of offset in the horizontal and/or vertical directions. This script will overlay the given two images in every possible way (i.e. sliding the image horizontally and vertically), pixel by pixel, and select the best aligned images. It assumes the images are in the same scale of units, in the same orientation, and expected to have some degree of overlap. The file has been modified so that it does not share patients' data. 

This script returns a dataframe of pixel coordinates of both images (labelled such that the pixel source is clear) and the aligned images in jpeg form. The dataframe can be used for the subsequent analysis used in HexTess. If the number of possible offsets is too large (greater than 10,000), the computational burden is too big. Hence, 10,000 random possibilities would be sampled and the one with the highest number of overlap would be selected.

## HexTess
HexTess tesselates an image into non-overlapping, equally-sized hexagon to summarize information at the hexagon-level. This reduction of image resolution may help with downstream analysis. For this example, each hexagon was categorized into different groups based on the dominant type of cells within each hexagon. This is helpful for our study team in investigating the spatial relationship between collagen-positive pixels and different types of fibroblast cells.

# Background
This work was inspired from my spatial analysis of pancreatic tissue in which I was tasked to investigate the relationship between collagen and various types of fibroblasts. Through this GitHub repository, the study team aims to make the analysis more transparent and reproducible, and any comments of the method or the study are greatly appreciated. In addition, the study team hopes to iteratively improve this repository such that this analysis framework can be applied in other image analyses.

## Application on the fibroblast study
To reflect the discrete nature of fibroblasts types, we overlay a tessellation of equal-sized hexagons on top of the range of data points and classify each hexagon by the contents of fibroblast cells. Specifically, for each hexagon that had at least one fibroblast cell, we classified each hexagon to be 'type A'-dominant if at least more than half of the fibroblast cells are 'type A'. 

After classifying each hexagon, we can then fit a genearlized linear mixed model (GLMM) to model the counts of immune cell by different fibroblasts types while accounting for random effects introduced by differences in immune cell content by different individuals.

We model the counts by using a negative binomial distribution as the mean-variance relationship is overdispersed and is non-linear. We account for random effects by slide-level and patient-level information of the hexagons.

# system requirements
- Python code was ran in version 3.7.4.
- R code was ran in version 4.2.2.
