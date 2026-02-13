
# EsoralPrint

<!-- badges: start -->
<!-- badges: end -->

The goal of EsoralPrint is to provide proof-of-concept evidence for a computationally robust, single-sample transcriptomic biomarker framework for squamous cell carcinoma of the upper aerodigestive tract.

## Installation

You can install the EsoralPrint by:

``` r
install.packages("remotes")
remotes::install_github("aiphaqua/EsoralPrint")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(EsoralPrint)

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

