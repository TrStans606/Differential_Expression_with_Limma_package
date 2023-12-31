% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GEO_data.R
\name{GEO_data}
\alias{GEO_data}
\title{Collect Phenotype, Annotation, and Expression Data From a GSE Object}
\usage{
GEO_data(gse)
}
\arguments{
\item{gse}{The gse object generated from import_GEO}
}
\value{
Returns a list containing the Phenotype, Annotation, and Expression Data
}
\description{
Extracts the necessary Phenotype, Annotation, and Expression data from the GSE object and outputs them in a list for further use.
The phenotype data is stored under out_list\link{'Phenotype_data'}. The expression data is stored under out_list\link{'Expression_data'}.
The annotation data is stored under out_list\link{'Annotation_data'}.
}
\examples{
GEO_data(gse)
}
