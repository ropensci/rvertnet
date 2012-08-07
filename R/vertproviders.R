#' Retrieve institution and the number of occurences served by institution from VertNet v2 portals.
#' 
#' @import httr
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
#' vertproviders(t="notropis")
#' }
vertproviders <- function(key="r_B68F3", grp="fish",  t = NULL, l = NULL, 
                     c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{  
  if(is.na(pmatch(grp, c("bird", "herp", "fish")))){
    message("Group has to be Bird, Herp or Fish")
    return(NULL)
  }
  url <- c(
    bird = "http://ornis2.ornisnet.org/api/v1/providers/",
    herp = "http://herpnet2.org/api/v1/providers/",
    fish = "http://www.fishnet2.net/api/v1/providers/"
  )[grp]
  
  query <- as.list(c(api = key, t = t, l = l, c = c, d = d, q = q, p = p, m = m))
  # must only use HTTP 1, HTTP 1.1 not working
  resp <- GET(url = url, query = query, config(http.version = 1L))
  stop_for_status(resp)
  
  out <- read.csv(text = text_content(resp))
  if (nrow(out) == 0){
    out <- NULL
    message("No records found")
  }
  out
}
