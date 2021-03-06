% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vertsummary.R
\name{vertsummary}
\alias{vertsummary}
\title{Summarize a set of records downloaded from VertNet.}
\usage{
vertsummary(input, verbose = TRUE)
}
\arguments{
\item{input}{Output from \code{\link{vertsearch}},
\code{\link{searchbyterm}}, or \code{\link{spatialsearch}}. Required.}

\item{verbose}{Print progress and information messages. Default: TRUE}
}
\value{
A list of summary statistics
}
\description{
Creates a simple summary of data returned by a VertNet search.
}
\details{
\code{\link{vertsummary}} provides information on the sources,
types and extent of data returned by a VertNet search.
}
\examples{
\dontrun{
# get occurrence records
recs <- vertsearch("Junco hyemalis", limit = 10)

# summarize occurrence records
vertsummary(recs)

vertsummary(vertsearch("Oncorhynchus clarki henshawi"))
}
}
