
# EsoralPrint

<!-- badges: start -->
<!-- badges: end -->

EsoralPrint aims to provide a plug-and-play, single-sample transcriptomic biomarker framework for squamous cell carcinoma of the upper aerodigestive tract that does not require standardized processing protocols or controls.

## Installation

You can install the EsoralPrint by:

``` r
install.packages("remotes")
remotes::install_github("aiphaqua/EsoralPrint")
```

## Example

This is a basic example which shows you how to run the genomic test:

``` r
library(EsoralPrint)

# Load example data
data("TCGA_OSCC")

# Create a model object
model <- EsoralPrintModel()

# Predict probabilities
prob_results <- predict(model, expr_matrix, type="prob")

# Predict classes
class_results <- predict(model, expr_matrix, type="class", cutoff=0.5)

## Note that:
# The input expression matrix (expr_matrix) should have gene symbols as rows and samples as columns.
# No cross-sample normalization, batch correction, or platform-specific adjustments are required.
```

