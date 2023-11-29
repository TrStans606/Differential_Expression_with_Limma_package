#' @title Collect Phenotype, Annotation, and Expression Data From a GSE Object
#' @description
#' Extracts the necessary Phenotype, Annotation, and Expression data from the GSE object and outputs them in a list for further use.
#' The phenotype data is stored under out_list['Phenotype_data']. The expression data is stored under out_list['Expression_data'].
#' The annotation data is stored under out_list['Annotation_data'].
#'
#' @param gse The gse object generated from import_GEO
#'
#' @return Returns a list containing the Phenotype, Annotation, and Expression Data
#' @export
#' @import GEOquery
#' @import Biobase
#' @examples GEO_data(gse)
GEO_data <- function(gse) {
  subj <- pData(gse)
  annot <- fData(gse)
  expr <- exprs(gse)

  out_list = list('Phenotype_data' = subj,
                  'Expression_data' = expr,
                  'Annotation_data' = annot)

  return(out_list)
}
