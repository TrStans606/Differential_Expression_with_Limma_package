#' @title Generate MA Plot from Limma Differential Expression
#' @description
#' A function which generates a MA Plot from the fit2 object
#'
#' @param fit2 the limma results object from differential_Expression_limma
#' @param top_genes_frame the top genes frame from annotate_fit
#' @param xlabel the label of x axis default = "Average log-expression"
#' @param ylabel the label of y axis default = "Expression log-ratio (this vs that)"
#'
#' @return creates an MA plot of the limma object
#' @export
#' @importFrom limma plotMA
#' @examples MA_plot(fit2, top_genes_frame,"Log expression", "cancer vs normal")
MA_plot <- function(fit2, top_genes_frame, xlabel = "Average log-expression", ylabel = "Expression log-ratio (this vs that)") {
  plotMA(fit2, xlab = xlabel,
         ylab = ylabel,
         main = colnames(top_genes_frame)[1], status=NULL)
}
