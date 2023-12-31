% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annotate_fit.R
\name{annotate_fit}
\alias{annotate_fit}
\title{Annotates the Fit Data from Limma}
\usage{
annotate_fit(Annotation_data, fit2, top_genes = 50)
}
\arguments{
\item{Annotation_data}{the Annotation_data from the fData(gse) GEO_data}

\item{fit2}{the fit object fom limma}

\item{top_genes}{the top number of genes you want to collect default = 50}
}
\value{
returns the top annotated genes as a data frame
}
\description{
Annotates the fit data and extracts the top genes for further analysis
}
\examples{
annotate_fit(Annotation_data, fit2,10)
}
