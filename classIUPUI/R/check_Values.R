#' @title Check and Normalize Expression Values
#' @description
#' Creates summary results of expression data, log normalizes it, and creates a box plot of the log normalized data.
#'
#' @param Expression_data the Expression_data from exprs(gse) from GEO_data
#'
#' @return returns the log normalized expression data
#' @export
#' @import GEOquery
#' @examples check_Values(gse)
check_Values <- function(Expression_data) {

  summary(Expression_data)
  Expression_data <- log2(Expression_data)
  boxplot(Expression_data,outline=FALSE)

  return(Expression_data)
}
