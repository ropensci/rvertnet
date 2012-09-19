\name{vertsearch}
\alias{vertsearch}
\title{Search for occurrences for a given taxonomic name.}
\usage{
  vertsearch(cl = NULL, sp = NULL, limit = NULL,
    url = "http://canary.vert-net.appspot.com/api/search")
}
\arguments{
  \item{cl}{Taxonomic search term (character).}

  \item{sp}{State or province (character).}

  \item{limit}{Search return limit (numeric).}

  \item{url}{The VertNet url for the function (should be
  left to default).}

  \item{...}{optional additional curl options (debugging
  tools mostly).}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Dataframe of search results OR prints "no search match"
  if no matches.
}
\description{
  Search for occurrences for a given taxonomic name.
}
\examples{
\dontrun{
vertsearch(cl = "aves", sp = "california", limit = 10)
}
}

