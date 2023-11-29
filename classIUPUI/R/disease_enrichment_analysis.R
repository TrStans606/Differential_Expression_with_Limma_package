#' @title Disease Enrichment Analysis of Differently Expressed Genes Using DOSE
#' @description
#' Uses the top gene frame and coverts it to a gene list for disease enrichment analysis.
#'
#' @param top_genes_frame the top genes data from annotate_fit
#' @param p_val_cutoff the p value cut off for determining significance default = 0.05
#'
#' @return returns an enrichDO results object
#' @export
#' @importFrom DOSE enrichDO
#' @examples disease_enrichment_analysis(top_genes_frame,0.01)
disease_enrichment_analysis <- function(top_genes_frame,p_val_cutoff=0.05) {

  top_genes_frame_sorted <- top_genes_frame[order(top_genes_frame$logFC, decreasing = TRUE),]
  de = top_genes_frame_sorted$Entrez_Gene_ID
  de = as.character(de)

  geneList <- as.double(top_genes_frame_sorted$logFC)
  names(geneList) <- de

  gene <- names(geneList)[abs(geneList) > 1.5]
  head(gene)

  z <- enrichDO(gene= gene,
                                   ont           = "DO",
                                   pvalueCutoff  = 0.05,
                                   pAdjustMethod = "BH",
                                   universe      = names(geneList),
                                   minGSSize     = 5,
                                   maxGSSize     = 500,
                                   qvalueCutoff  = 0.05,
                                   readable      = FALSE)

  return(z)
}
