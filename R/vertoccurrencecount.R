#' Retrieve locations and number of occurrence records from VertNet v2 portals.
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
#'  Note that the Map parameter and the Geometry paramter are mutually exclusive. 
#'  If both are submitted, the Map parameter will be ignored.
#' @param m geographic area defined by one of the available maps. 
#' Maps are designated by MapIDs ref AvailableMaps function
#' @param url The VertNet url for the function (should be left to default).
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' vertoccurrencecount(t="notropis")
#' }
vertoccurrencecount <- function(key="r_B68F3", grp="fish", t = NA, l = NA, c = NA, d = NA, 
                          q = NA, p = NA, m = NA, 
                          url = "http://www.fishnet2.net/api/v1/occurrencecount/?") 
{
  if(grp=="bird")
    url = "http://ornis2.ornisnet.org/api/v1/occurrencecount/?"
  if(grp=="herp")
    url = "http://herpnet2.org/api/v1/occurrencecount/?"
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
  qstr=gsub(" ","%20",qstr)
  qurl <- paste(url,qstr,sep="")
  out <- read.csv(qurl)
  out
}
