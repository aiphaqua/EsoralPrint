#' TCGA OSCC Expression Dataset
#'
#' Gene expression matrix derived from The Cancer Genome Atlas (TCGA)
#' Oral Squamous Cell Carcinoma (OSCC) cohort and used in the
#' validation of the EsoralPrint model.
#'
#' @format A numeric matrix with:
#' \describe{
#'   \item{Rows}{Gene symbols}
#'   \item{Columns}{Sample identifiers}
#' }
#'
#' @details
#' Expression values were obtained from TCGA RNA-seq data.
#'
#' @source
#' The Cancer Genome Atlas (TCGA) Head and Neck Squamous Cell Carcinoma (HNSC) project.
#' Available from the Genomic Data Commons (GDC) Data Portal:
#' https://portal.gdc.cancer.gov/
#'
"expr_matrix"
