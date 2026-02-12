#' Compute EsoralPrint Malignancy Probability
#'
#' Computes malignancy probability using the EsoralPrint ISO34 model.
#' @param expr_matrix Numeric matrix with genes as rows and samples as columns.
#' @return Data.frame with LinearScore and MalignancyProbability
#' @export
compute_esoralprint <- function(expr_matrix) {
  if (is.null(rownames(expr_matrix))) stop("Row names must be gene symbols.")

  model <- esoral_model
  required_genes <- unique(c(model$isoPairs$gene_h, model$isoPairs$gene_k))
  missing_genes <- setdiff(required_genes, rownames(expr_matrix))
  if (length(missing_genes) > 0) stop(paste("Missing genes:", paste(missing_genes, collapse=", ")))

  Z <- rep(model$intercept, ncol(expr_matrix))
  for (i in seq_len(nrow(model$isoPairs))) {
    g1 <- model$isoPairs$gene_h[i]
    g2 <- model$isoPairs$gene_k[i]
    beta <- model$isoPairs$beta[i]
    x1 <- expr_matrix[g1, ]
    x2 <- expr_matrix[g2, ]
    iso_value <- ifelse(x1 > x2, 1, ifelse(x1 < x2, -1, 0))
    Z <- Z + beta * iso_value
  }
  MP <- 1 / (1 + exp(-Z))
  data.frame(Sample = colnames(expr_matrix), LinearScore = Z, MalignancyProbability = MP)
}
