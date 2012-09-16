\name{vertoccurrencecount}
\alias{vertoccurrencecount}
\title{Retrieve locations and number of occurrence records from VertNet v2 portals.}
\usage{
  vertoccurrencecount(key = "r_B68F3", grp = "fish",
    t = NULL, l = NULL, c = NULL, d = NULL, q = NULL,
    p = NULL, m = NULL, url = NULL)
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
  Retrieve locations and number of occurrence records from
  VertNet v2 portals.
}
\examples{
\dontrun{
# Taxon
vertoccurrencecount(t="notropis")
vertoccurrencecount(t="notropis or nezumia")
vertoccurrencecount(t="Blenniidae")

# Location
vertoccurrencecount(l="country:india")
vertoccurrencecount(l="alabama or gulf of mexico")
vertoccurrencecount(l="africa", grp="bird")

# Catalog Number/Institution Code
vertoccurrencecount(c="TU 1")
vertoccurrencecount(c="mnhn or usnm")
vertoccurrencecount(c="ku 29288 or tu 66762")

# Date Range
vertoccurrencecount(d="2000-2000")
vertoccurrencecount(d="1950-1975")

# Other keywords
vertoccurrencecount(q="larva")
vertoccurrencecount(q="ethanol or EtOH")

# Geometry
vertoccurrencecount(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))")

# Map
vertoccurrencecount(m=14)

# Wrong name
vertoccurrencecount(t="notropisz")
}
}

