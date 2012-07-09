#' Retrieve outputs metadata about the maps currently available for querying against the &m= parameter from VertNet v2 portals.
#' 
#' @param key API Key is required to run any query
#' @param grp VertNet group to query. Currently available oprions fish, bird and herp. Default fish.
#' @param q terms of interest that may be in the remarks, notes, scientific name, collector, 
#'  preparation type, location fields or elsewhere in the occurrence. It supports the 'OR' operator.
#' @param url The VertNet url for the function (should be left to default).
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' vertavailablemaps()
#' vertavailablemaps(q="May or June")
#' }
vertavailablemaps <- function(key="r_B68F3", grp="fish", q = NA, 
                          url = "http://www.fishnet2.net/api/v1/availablemaps/?") 
{
  if(grp=="bird")
    url = "http://ornis2.ornisnet.org/api/v1/availablemaps/?"
  if(grp=="herp")
    url = "http://herpnet2.org/api/v1/availablemaps/?"
  if((grp!="fish") && (grp!="bird") && (grp!="herp")) {
    print("grp has to be fish, bird or herp")
    return
  }
  qstr <- paste("api=",key,sep="")
  if(!is.na(q))
    qstr <- paste(qstr,"&q=",q,sep="")
  qstr=gsub(" ","%20",qstr)
  qurl <- paste(url,qstr,sep="")
  out <- read.csv(qurl)
  out
}
