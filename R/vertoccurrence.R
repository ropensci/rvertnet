#' Retrieve occurrence records from VertNet v2 portals.
#' 
#' @param key API Key is required to run any query
#' @param grp VertNet group to query. Currently available oprions fish, bird and herp. Default fish.
#' @param t Taxon scientific and family names. It supports the 'OR' operator.
#' @param l Location country, continent, county, ocean, island, state, province and locality.
#'  It supports the 'OR' operator.
#' @param c Catalog Number and/or Institution Code. It supports the 'OR' operator.
#' @param d year or years the occurrence was collected. Date Ranges must be in yyyy-yyyy format.
#' @param q terms of interest that may be in the remarks, notes, scientific name, collector, 
#'  preparation type, location fields or elsewhere in the occurrence. It supports the 'OR' operator.
#' @param p geometric query in well-known text (WKT) format. Limited to 250 vertices or 10,000 characters. 
#'	Note that the Map parameter and the Geometry paramter are mutually exclusive. 
#'	If both are submitted, the Map parameter will be ignored.
#' @param m geographic area defined by one of the available maps. 
#' Maps are designated by MapIDs ref AvailableMaps function
#' @param cols Columns comma-delimited list of column names, 
#'	to specify the columns and order of columns to be returned. 
#'	All columns are returned by default. 
#'	Valid column names (in default order): InstitutionCode, CollectionCode, CatalogNumber, 
#'	IndividualCount, ScientificName, Family, PreparationType, Tissues, Latitude, Longitude, 
#'	CoordinateUncertaintyInMeters, HorizontalDatum, Country, StateProvince, County, Island, 
#'	IslandGroup, Locality, VerbatimElevation, VerbatimDepth, YearCollected, MonthCollected, 
#'	DayCollected, Collector, GeorefMethod, LatLongComments, BasisOfRecord, Remarks, DateLastModified
#' @param num limit the number of occurrences returned. A maximum value of 10000 is permitted. 
#'	By default all results will be returned, even if exceeds 10,000. 
#' @param set Start value for records. Default is 1. Can be used to control paging. 
#' @param url The VertNet url for the function (should be left to default).
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' vertoccurrence(t="notropis",num=100)
#' }
vertoccurrence <- function(key="r_B68F3", grp="fish", t = NA, l = NA, c = NA, d = NA, 
                           q = NA, p = NA, m = NA, cols = NA, num = NA, set = NA,  
                           url = "http://www.fishnet2.net/api/v1/occurrence/?") 
{
  if(grp=="bird")
    url = "http://ornis2.ornisnet.org/api/v1/occurrence/?"
  if(grp=="herp")
    url = "http://herpnet2.org/api/v1/occurrence/?"
  if((grp!="fish") && (grp!="bird") && (grp!="herp")) {
    print("grp has to be fish, bird or herp")
    return
  }
  qstr <- paste("api=",key,sep="")
  if(!is.na(t))
    qstr <- paste(qstr,"&t=",t,sep="")
  if(!is.na(l))
    qstr <- paste(qstr,"&l=",l,sep="")
  if(!is.na(c))
    qstr <- paste(qstr,"&c=",c,sep="")
  if(!is.na(d))
    qstr <- paste(qstr,"&d=",d,sep="")
  if(!is.na(q))
    qstr <- paste(qstr,"&q=",q,sep="")
  if(!is.na(p))
    qstr <- paste(qstr,"&p=",p,sep="")
  if(!is.na(m))
    qstr <- paste(qstr,"&m=",m,sep="")
  if(!is.na(cols))
    qstr <- paste(qstr,"&cols=",cols,sep="")
  if(!is.na(num))
    qstr <- paste(qstr,"&num=",num,sep="")
  if(!is.na(set))
    qstr <- paste(qstr,"&set=",set,sep="")
  qstr=gsub(" ","%20",qstr)
  qurl <- paste(url,qstr,sep="")
  out <- read.csv(qurl)
  if(dim(out)[1]==0){
    out <- NULL
    cat("No records found")
  }
  out
}
