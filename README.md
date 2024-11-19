# HexAligner

Hex Aligner is a tool for spatial image analysis with two main functions:

1. **2DBinaryAlign**: Align equally-scaled 2D binary images with unknown offsets.
2. **HexTess**: Tessellate images into non-overlapping, equally-sized hexagons for downstream analysis.

This tool was developed to facilitate spatial analysis in image data, particularly in biomedical research. By aligning images and summarizing information at the hexagon level, researchers can investigate spatial relationships within the data more effectively.

## Features
### 1. 2DBinaryAlign
- **Automatic Image Alignment**: Aligns two binary images that may have unknown horizontal and/or vertical offsets.
- **Exhaustive Search**: Overlays images in all possible positions by sliding one image over the other pixel by pixel.
- **Optimized for Large Offsets**: When the number of possible offsets exceeds 10,000, the script samples 10,000 random offset positions to reduce computational burden.
- **Output**:
  - Aligned images saved as JPEG files.
  - A DataFrame containing pixel coordinates from both images, labeled by source.

### 2. HexTess
- **Hexagonal Tessellation**: Divides an image into non-overlapping, equally-sized hexagons.
- **Data Summarization**: Summarizes pixel-level information at the hexagon level.
- **Cell Classification**: Assigns each hexagon to a group based on the dominant type of cells within it.
- **Facilitates Spatial Analysis**: Useful for investigating spatial relationships between different cell types.

## Installation
To use the Hex Aligner tool, follow these steps:
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/hex-aligner.git
   ```

2. **Set Up the Python Environment**:
   - Ensure you have Python 3.7.4 installed.
   - Install the required Python packages:
     ```bash
     pip install -r requirements.txt
     ```
   - if you have a different version of Python, you can refer to the **requirements.txt** to create your own working environment  

3. **Set Up the R Environment** (optional, if using R scripts):
   - Ensure you have R version 4.2.2 installed.
   - Install the required R packages by running the following in R:
     ```R
     source("install_packages.R")
     ```
   - if you have a different version of R, you can refer to the **install_packages.R** to create your own working environment  
## Usage
### 1. 2DBinaryAlign
#### Input Requirements
- **Binary Images**: Two equally-scaled binary images in the same orientation (e.g., PNG or JPEG format).
- **Overlap Expectation**: Images are expected to have some degree of overlap.
#### Running the Alignment
- Open the `2DBinaryAlign.ipynb` Jupyter Notebook.
- Update the file paths to point to your input images.
- Update the script to cater to your data specifications and needs.
- Execute the notebook cells to perform the alignment.
#### Output
- **Aligned Images**: Saved in JPEG format in the specified output directory.
- **DataFrame**: Contains pixel coordinates from both images, labeled to indicate the source image.

### 2. HexTess
#### Input Requirements
- **Aligned Image**: Typically, the output from `2DBinaryAlign`.
- **Hexagon Parameters**: Size and dimensions for the hexagonal grid.
#### Running the Tessellation
- Open the `HexTess.ipynb` Jupyter Notebook.
- Configure the hexagon size and any classification criteria based on your analysis needs.
- Update the script to classify hexagons and/or retain information at the hexagon-level
- Execute the notebook cells to perform the tessellation and classification.
#### Output
- **Hexagon Grid Image**: The original image overlaid with a hexagonal grid.
- **Classification Results**: Data indicating the classification of each hexagon.
- **Summary DataFrame**: Aggregated information at the hexagon level for further analysis.
## Example
An example dataset and corresponding notebooks are provided in the `examples` directory. These demonstrate:
- Aligning two sample images using `2DBinaryAlign`.
- Tessellating the aligned image and classifying hexagons using `HexTess`.
- Performing downstream analysis on the hexagon-level data.
## System Requirements
- **Python**: Version 3.7.4
- **R**: Version 4.2.2 (if using R scripts)
- **Operating System**: Platform-independent (tested on Windows, macOS, and Linux)
## Background
This work was inspired by spatial analysis of pancreatic tissue, where the goal was to investigate the relationship between collagen and various types of fibroblasts. By making this tool available, we aim to enhance transparency and reproducibility in image analysis. We welcome any comments or contributions to improve this repository for broader applications.
## Application in Fibroblast Study
In our fibroblast study, we applied HexAligner as follows:
1. **Hexagonal Tessellation**: Overlaid a hexagonal grid on the spatial data to reflect the discrete nature of fibroblast types.
2. **Hexagon Classification**:
   - For each hexagon containing at least one fibroblast cell, we determined the dominant cell type.
   - A hexagon was classified as 'Type A'-dominant if more than half of the fibroblast cells within it were 'Type A'.
3. **Statistical Modeling**:
   - Fitted a Generalized Linear Mixed Model (GLMM) to model immune cell counts by fibroblast types.
   - Used a negative binomial distribution due to overdispersion in the data.
   - Accounted for random effects at the slide and patient levels.
4. **Results Interpretation**:
   - Investigated spatial relationships between collagen-positive pixels and different fibroblast cell types.
   - Provided insights into the spatial distribution and interaction of cells in pancreatic tissue.
## Contributing
We welcome contributions to enhance Hex Aligner:
- **Bug Reports & Feature Requests**: Please open an issue on GitHub.
- **Pull Requests**: Fork the repository and submit a pull request with your proposed changes.
When contributing, please ensure:
- Compliance with data privacy regulations.
- Patient data is anonymized and de-identified.
- Code is well-documented and adheres to existing coding standards.
## License
This project is licensed under the MIT License.

Copyright <2023> (Sung Chul Hong)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Acknowledgments
We thank the members of our study team for their contributions. 
