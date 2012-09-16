\name{vertoccurrence}
\alias{vertoccurrence}
\title{Retrieve occurrence records from VertNet v2 portals.}
\usage{
  vertoccurrence(key = "r_B68F3", grp = "fish", t = NULL,
    l = NULL, c = NULL, d = NULL, q = NULL, p = NULL,
    m = NULL, cols = NULL, num = NULL, set = NULL,
    url = NULL)
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

  \item{cols}{Columns comma-delimited list of column names,
  to specify the columns and order of columns to be
  returned.  All columns are returned by default.  Valid
  column names (in default order): InstitutionCode,
  CollectionCode, CatalogNumber, IndividualCount,
  ScientificName, Family, PreparationType, Tissues,
  Latitude, Longitude, CoordinateUncertaintyInMeters,
  HorizontalDatum, Country, StateProvince, County, Island,
  IslandGroup, Locality, VerbatimElevation, VerbatimDepth,
  YearCollected, MonthCollected, DayCollected, Collector,
  GeorefMethod, LatLongComments, BasisOfRecord, Remarks,
  DateLastModified}

  \item{num}{limit the number of occurrences returned. A
  maximum value of 10000 is permitted.  By default all
  results will be returned, even if exceeds 10,000.}

  \item{set}{Start value for records. Default is 1. Can be
  used to control paging.}

  \item{url}{The VertNet url for the function (should be
  left to default).}
}
\value{
  Dataframe of search results OR prints "No records found"
  if no matches.
}
\description{
  Retrieve occurrence records from VertNet v2 portals.
}
\examples{
\dontrun{
# Taxon
vertoccurrence(t="notropis",num=100)
vertoccurrence(t="notropis or nezumia",num=100)
vertoccurrence(t="Blenniidae",num=100)

# Location
vertoccurrence(l="country:india",num=100)
vertoccurrence(l="alabama or gulf of mexico",num=100)
vertoccurrence(l="africa",num=100,grp="bird")

# Catalog Number/Institution Code
vertoccurrence(c="TU 1")
vertoccurrence(c="mnhn or usnm",num=100)
vertoccurrence(c="ku 29288 or tu 66762")

# Date Range
vertoccurrence(d="2000-2000",num=100)
vertoccurrence(d="1950-1975",num=100)

# Other keywords
vertoccurrence(q="larva",num=100)
vertoccurrence(q="ethanol or EtOH",num=100)

# Geometry
vertoccurrence(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))",num=100)

# Map
vertoccurrence(m=14,num=100)

# Columns
vertoccurrence(t="notropis",num=100, cols="Latitude,Longitude,Family,ScientificName,IndividualCount,Remarks")

# Start Value
vertoccurrence(t="notropis",set=1,num=10)
vertoccurrence(t="notropis",set=11,num=10)

# Wrong name
vertoccurrence(t="notropisz",num=100)
}
}

