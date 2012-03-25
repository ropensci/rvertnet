\name{vertsearch}
\alias{vertsearch}
\title{Retrieve all taxa names or TSNs downstream in hierarchy from given TSN.}
\usage{
  vertsearch(cl = NA, sp = NA, limit = NA,
    url = "http://canary.vert-net.appspot.com/api/search",
    ..., curl = getCurlHandle())
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
  Retrieve all taxa names or TSNs downstream in hierarchy
  from given TSN.
}
\examples{
\dontrun{
vertsearch("aves", "california", 10)
}
}

