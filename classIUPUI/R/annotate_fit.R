#' @title Annotates the Fit Data from Limma
#' @description
#' Annotates the fit data and extracts the top genes for further analysis
#'
#' @param Annotation_data the Annotation_data from the fData(gse) GEO_data
#' @param fit2 the fit object fom limma
#' @param top_genes the top number of genes you want to collect default = 50
#'
#' @return returns the top annotated genes as a data frame
#' @export
#' @importFrom dplyr select
#' @examples annotate_fit(Annotation_data, fit2,10)
annotate_fit <- function(Annotation_data, fit2, top_genes =50){
  anno <- Annotation_data
  anno

  anno <- select(anno,Symbol,Entrez_Gene_ID,Chromosome,Cytoband)
  fit2$genes <- anno
  top_genes_frame = topTable(fit2, number =top_genes)

  return(top_genes_frame)
}
