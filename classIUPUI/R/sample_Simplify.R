#' @title Simplifies Phenotype Data
#' @description
#' Simplifies Phenotype Data via selecting and renaming the phenotype data from the gse object.
#'
#' @param sampleInfo the Phenotype_data from the gse object out_list from GEO_data.
#'
#' @return returns the same sampleInfo Phenotype_data object but altered to be simplified.
#' @export
#' @importFrom dplyr rename
#' @examples sample_Simplify(subj)
sample_Simplify <- function(sampleInfo){


  sampleInfo <- select(sampleInfo, source_name_ch1,characteristics_ch1.1)


  sampleInfo <- rename(sampleInfo,group = source_name_ch1, patient=characteristics_ch1.1)

  return(sampleInfo)
}
