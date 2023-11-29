#' @title Creates a Scatter Plot of the PCA Vectors
#' @description
#' Creates a PCA analysis of the gse object and produces a scatter plot from them.
#'
#' @param Expression_data the Expression_data from exprs(gse) from GEO_data
#' @param sampleInfo the phenotype data from sample_simplify
#'
#' @return Returns the scatter plot of the PCA object.
#' @export
#' @import ggplot2
#' @import ggrepel
#' @importFrom dplyr %>%
#' @examples PCA(gse,sampleInfo)
PCA <- function(Expression_data, sampleInfo){


  pca <- prcomp(t(Expression_data))



  cbind(sampleInfo, pca$x) %>%
    ggplot(aes(x = PC1, y=PC2, col=group,label=paste("Patient", patient))) + geom_point() + geom_text_repel()


}
