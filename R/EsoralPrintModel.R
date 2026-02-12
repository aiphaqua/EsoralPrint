#' Create EsoralPrint S3 Model
#' @export
EsoralPrintModel <- function() {
  model <- list(
    intercept = esoral_model$intercept,
    isoPairs = esoral_model$isoPairs,
    n_isoPairs = nrow(esoral_model$isoPairs),
    description = "EsoralPrint: 34 isoPairs-based malignancy classifier"
  )
  class(model) <- "EsoralPrint"
  return(model)
}
