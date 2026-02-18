#' Predict Method for EsoralPrint
#' @param object EsoralPrint model
#' @param newdata Numeric matrix with genes as rows, samples as columns
#' @param type "prob" or "class"
#' @param cutoff numeric threshold for classification
#' @param ... Optional additional arguments (currently unused)
#'
#' @return Data.frame with Likelihood (the degree to which a sample is likely to be malignant) and, optionally, Malignant (Yes or No).
#' @export
predict.EsoralPrint <- function(object, newdata,
                                type = c("prob","class"),
                                cutoff = 0.5, ...) {

  type <- match.arg(type)

  if (is.vector(newdata)) {
    if (is.null(names(newdata))) {
      stop(
        "Single-sample mode detected: ",
        "'newdata' must be a named numeric vector with gene symbols as names."
      )
    }
    gene_names <- names(newdata)
    newdata <- matrix(newdata, ncol = 1)

    # Assign names back to the rows
    rownames(newdata) <- gene_names
    colnames(newdata) <- "Submitted_Sample"
  }

  if (is.null(rownames(newdata))) {
    stop("Row names (or vector names) must be gene symbols.")
  }

  required_genes <- unique(c(object$isoPairs$gene_h,
                             object$isoPairs$gene_k))

  missing_genes <- setdiff(required_genes, rownames(newdata))
  if (length(missing_genes) > 0)
    stop(paste("Missing genes:",
               paste(missing_genes, collapse = ", ")))

  Z <- rep(as.numeric(object$intercept), ncol(newdata))

  for (i in seq_len(nrow(object$isoPairs))) {

    g1 <- object$isoPairs$gene_h[i]
    g2 <- object$isoPairs$gene_k[i]
    beta <- object$isoPairs$beta[i]

    x1 <- as.numeric(newdata[g1, , drop = TRUE])
    x2 <- as.numeric(newdata[g2, , drop = TRUE])

    iso_value <- ifelse(x1 > x2, 1,
                        ifelse(x1 < x2, -1, 0))

    Z <- Z + beta * iso_value
  }

  MP <- 1 / (1 + exp(-Z))

  results <- data.frame(
    Sample = colnames(newdata),
    Likelihood = MP,
    row.names = NULL
  )

  if (type == "class")
    results$Malignant <- ifelse(MP >= cutoff,
                                "Yes",
                                "No")

  return(results)
}
