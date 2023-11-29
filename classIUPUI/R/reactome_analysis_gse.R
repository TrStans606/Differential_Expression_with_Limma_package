#' @title GSE Pathway Analysis of Differently Expressed Genes Using ReactomePA
#' @description
#' Uses the top gene frame and coverts it to a gene list for GSE pathway analysis.
#'
#' @param top_genes_frame the top genes data from annotate_fit
#' @param p_val_cutoff the p value cut off for determining significance default = 0.05
#'
#' @return returns the gsePathway results object
#' @export
#' @importFrom ReactomePA gsePathway
#' @examples reactome_analysis_enrich(top_genes_frame, 0.05)
reactome_analysis_gse <- function(top_genes_frame,p_val_cutoff=0.05){

  top_genes_frame_sorted <- top_genes_frame[order(top_genes_frame$logFC, decreasing = TRUE),]
  de = top_genes_frame_sorted$Entrez_Gene_ID
  de = as.character(de)

  geneList <- as.double(top_genes_frame_sorted$logFC)
  names(geneList) <- de



  y <- gsePathway(geneList,
                  pvalueCutoff = p_val_cutoff,
                  pAdjustMethod = "BH",
                  verbose = FALSE)

  return(y)

}
