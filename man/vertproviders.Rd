\name{vertproviders}
\alias{vertproviders}
\title{Retrieve institution, institution code, and the number of occurences of the institution from VertNet v2 portals.}
\usage{
  vertproviders(key = "r_B68F3", grp = "fish", t = NA,
    l = NA, c = NA, d = NA, q = NA, p = NA, m = NA,
    url = "http://www.fishnet2.net/api/v1/providers/?")
}
\arguments{
  \item{key}{API Key is required to run any query}

  \item{grp}{VertNet group to query. Currently available
  oprions fish, bird and herp. Default fish.}

  \item{t}{Taxon scientific and family names. It supports
  the 'OR' operator.}

  \item{l}{Location country, continent, county, ocean,
  island, state, province and locality.  It supports the
  'OR' operator.}

  \item{c}{Catalog Number and/or Institution Code. It
  supports the 'OR' operator.}

  \item{d}{year or years the occurrence was collected. Date
  Ranges must be in yyyy-yyyy format.}

  \item{q}{terms of interest that may be in the remarks,
  notes, scientific name, collector, preparation type,
  location fields or elsewhere in the occurrence. It
  supports the 'OR' operator.}

  \item{p}{geometric query in well-known text (WKT) format.
  Limited to 250 vertices or 10,000 characters.  Note that
  the Map parameter and the Geometry paramter are mutually
  exclusive.  If both are submitted, the Map parameter will
  be ignored.}

  \item{m}{geographic area defined by one of the available
  maps. Maps are designated by MapIDs ref AvailableMaps
  function}

  \item{url}{The VertNet url for the function (should be
  left to default).}
}
\value{
  Dataframe of search results OR prints "No records found"
  if no matches.
}
\description{
  Retrieve institution, institution code, and the number of
  occurences of the institution from VertNet v2 portals.
}
\examples{
\dontrun{
vertproviders(t="notropis")
}
}

