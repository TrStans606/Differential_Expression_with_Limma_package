#' @title Preforms Differential Gene Expression Using Limma
#' @description
#' Preforms differential gene expression on the gse object using Limma package.
#'
#' @param gse the gse object from import_GEO
#' @param sampleInfo the phenotype data from sample_simplify
#' @param threshold_genes the threshold for the number of times a gene needs to be expressed default = 2
#' @param col1 the name the user wants for column 1 default = "col1"
#' @param col2 the name the user wants for column 2 default = "col2"
#'
#' @return returns the fit2 object which contains the results of the differential expression for further plotting
#' @export
#' @import limma
#' @import GEOquery
#' @examples differential_Expression_limma(gse,sampleInfo, 3, "tumor", "normal")
differential_Expression_limma <- function(gse,sampleInfo, threshold_genes = 2,
                                          col1 = "col1", col2="col2"){
  design <- model.matrix(~0+sampleInfo$group)



  colnames(design) <- c(col1,col2)

  cutoff <- median(exprs(gse))

  is_expressed <- exprs(gse) > cutoff


  keep <- rowSums(is_expressed) > threshold_genes

  table(keep)

  gse <- gse[keep,]

  fit <- lmFit(exprs(gse), design)
  head(fit$coefficients)

  contrasts <- makeContrasts(col2 - col1, levels=design)


  fit2 <- contrasts.fit(fit, contrasts)

  fit2 <- eBayes(fit2)
  return(fit2)
}
