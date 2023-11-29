#' @title Pathway Enrichment Analysis of Differently Expressed Genes Using ReactomePA
#' @description
#' Uses the top gene frame to preform overly enriched differently expressed genes.
#'
#' @param top_genes_frame the top genes data from annotate_fit
#' @param p_val_cutoff the p value cut off for determining significance default = 0.05
#'
#' @return returns the enrichPathway results object
#' @export
#' @importFrom ReactomePA enrichPathway
#' @examples reactome_analysis_enrich(top_genes_frame,0.01)
reactome_analysis_enrich <- function(top_genes_frame,p_val_cutoff=0.05){
  de = top_genes_frame$Entrez_Gene_ID
  de = as.character(de)
  head(de)

  x <- enrichPathway(gene=de, pvalueCutoff = p_val_cutoff, readable=TRUE)
  head(x)

  return(x)


}
