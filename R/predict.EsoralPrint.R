#' Predict Method for EsoralPrint
#' @param object EsoralPrint model
#' @param newdata Numeric matrix with genes as rows, samples as columns
#' @param type "prob" or "class"
#' @param cutoff numeric threshold for classification
#' @export
predict.EsoralPrint <- function(object, newdata, type = c("prob","class"), cutoff=0.5, ...) {
  type <- match.arg(type)
  Z <- rep(object$intercept, ncol(newdata))
  for (i in seq_len(nrow(object$isoPairs))) {
    g1 <- object$isoPairs$gene_h[i]
    g2 <- object$isoPairs$gene_k[i]
    beta <- object$isoPairs$beta[i]
    x1 <- newdata[g1, ]
    x2 <- newdata[g2, ]
    iso_value <- ifelse(x1 > x2,1,ifelse(x1 < x2,-1,0))
    Z <- Z + beta * iso_value
  }
  MP <- 1/(1+exp(-Z))
  results <- data.frame(Sample=colnames(newdata), LinearScore=Z, MalignancyProbability=MP)
  if (type=="class") results$Class <- ifelse(MP>=cutoff,"Malignant","Benign")
  return(results)
}
