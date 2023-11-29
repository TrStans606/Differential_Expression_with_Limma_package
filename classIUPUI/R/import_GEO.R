#' @title Import GEO object from given ID
#' @description
#' Collects the GSE data of a given GEO ID from the gene expression omnibus.
#'
#' @param GEO_id The GEO ID you want to collected for analysis
#'
#' @return Returns gse the object which contains all the data from the GEO of your given ID.
#' @export
#' @importFrom GEOquery getGEO
#' @examples import_GEO("GSE33126")
import_GEO <- function(GEO_id) {
  gse <- getGEO(GEO_id)
  ## check how many platforms used
  length(gse)
  gse <- gse[[1]]
  gse


  return(gse)
}
