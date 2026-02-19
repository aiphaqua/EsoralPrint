
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

# Create the model object
model <- EsoralPrintModel()

# Multiple samples: prediction for the entire cohort
# Predict probabilities
prob_results <- predict(model, expr_matrix, type = "prob")
# Predict classes
class_results <- predict(model, expr_matrix, type = "class", cutoff = 0.5)

# Single sample: prediction for a submitted sample
single_sample_vector <- expr_matrix[, 1]
names(single_sample_vector) <- rownames(expr_matrix)
# Predict for just one patient
single_result <- predict(model, single_sample_vector, type = "class")

# View results
print(head(class_results))
print(single_result)

## Notes:
# 1. The input expression matrix (expr_matrix) should have genes as rows 
#    (row names as gene symbols) and samples as columns.
# 2. No cross-sample normalization, batch correction, or platform-specific adjustments are required.
# 3. For RNA-Seq data, we recommend using CPM, FPKM, or TPM units as gene expression values.
     Read Counts are not recommended.
# 4. For single-sample prediction, provide a named numeric vector where names are gene symbols.
```

