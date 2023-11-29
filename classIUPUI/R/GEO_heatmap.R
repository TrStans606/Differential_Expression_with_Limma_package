#' @title Generates a Pheatmap from the GSE Object
#' @description
#' This function generates a heatmap from the gs object. If sample_info is provided from sample_simplify then the heatmap will be annotated otherwise it will not be.
#'
#' @param Expression_data the Expression_data from exprs(gse) from GEO_data
#' @param sampleInfo optional simplified phenotype data from sample_simplify to annotate the heatmap.
#'
#' @return This produces a heatmap of the gene expression of the clusters. It can either be annotated of unannotated.
#' @export
#' @importFrom stats cor
#' @importFrom pheatmap pheatmap
#' @examples GEO_heatmap(gse), GEO_heatmap(gse,sampleInfo)
GEO_heatmap <- function(Expression_data, sampleInfo=NaN){
  corMatrix <- cor(Expression_data,use="c")
  if(is.nan(sampleInfo[[1]][1])){
    pheatmap(corMatrix)
  } else {
    pheatmap(corMatrix,
             annotation_col=sampleInfo)
  }

}
