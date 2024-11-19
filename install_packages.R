# install_packages.R

# List of required packages
packages <- c(
  "glue",
  "MASS",
  "dplyr",
  "purrr",
  "stringr",
  "tidyr",
  "tidyverse",
  "spatstat",
  "modeest",
  "ggplot2",
  "reshape2",
  "gridExtra",
  "grid",
  "ggpubr"
)

# Function to check and install missing packages
install_if_missing <- function(p) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p, dependencies = TRUE)
  }
}

# Install missing packages
invisible(sapply(packages, install_if_missing))
