% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/disease_enrichment_analysis.R
\name{disease_enrichment_analysis}
\alias{disease_enrichment_analysis}
\title{Disease Enrichment Analysis of Differently Expressed Genes Using DOSE}
\usage{
disease_enrichment_analysis(top_genes_frame, p_val_cutoff = 0.05)
}
\arguments{
\item{top_genes_frame}{the top genes data from annotate_fit}

\item{p_val_cutoff}{the p value cut off for determining significance default = 0.05}
}
\value{
returns an enrichDO results object
}
\description{
Uses the top gene frame and coverts it to a gene list for disease enrichment analysis.
}
\examples{
disease_enrichment_analysis(top_genes_frame,0.01)
}
