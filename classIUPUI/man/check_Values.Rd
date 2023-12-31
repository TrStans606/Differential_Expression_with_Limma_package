% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check_Values.R
\name{check_Values}
\alias{check_Values}
\title{Check and Normalize Expression Values}
\usage{
check_Values(Expression_data)
}
\arguments{
\item{Expression_data}{the Expression_data from exprs(gse) from GEO_data}
}
\value{
returns the log normalized expression data
}
\description{
Creates summary results of expression data, log normalizes it, and creates a box plot of the log normalized data.
}
\examples{
check_Values(gse)
}
