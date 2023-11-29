#' @title Generate Volcano Plot from Limma Differential Expression
#' @description
#' A function which generates a Volcano Plot from the fit2 object
#'
#' @param top_genes_frame the top genes frame from annotate_fit
#' @param fit2 the limma results object from differential_Expression_limma
#' @param p_val_cutoff the p value cut off for significance default = 0.05
#'
#' @return creates a volcano plot of the Limma data
#' @export
#' @import ggplot2
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr mutate
#' @importFrom dplyr %>%
#' @importFrom limma topTable
#' @examples volcano_plot(top_genes_frame, fit2,0.01)
volcano_plot <- function(top_genes_frame, fit2, p_val_cutoff=0.05){
  full_results <- topTable(fit2, number=Inf)
  full_results <- rownames_to_column(full_results,"ID")
  ggplot(full_results,aes(x = logFC, y=B)) + geom_point()

  ## change according to your needs
  fc_cutoff <- 1

  full_results %>%
    mutate(Significant = adj.P.Val < p_val_cutoff, abs(logFC) > fc_cutoff ) %>%
    ggplot(aes(x = logFC, y = B, col=Significant)) + geom_point()
}
