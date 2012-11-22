#' Retrieve metadata about the maps currently available for querying against 
#' 		the &m= parameter from VertNet v2 portals.
#' 
#' @param key API Key is required to run any query
#' @param grp VertNet group to query. Currently available oprions fish, bird 
#' 		and herp. Default fish.
#' @param q parameter can be used to query for selected maps It supports 
#' 		the 'OR' operator.
#' @param url The VertNet url for the function (should be left to default).
#' @return Dataframe of search results empty if no matches.
#' @export
#' @examples \dontrun{
#' # Search for maps with keywords
#' vertavailablemaps(q="May or June")
#' vertavailablemaps(q="Fishery Closure")
#' 
#' # List all 
#' vertavailablemaps()
#' }
vertavailablemaps <- function(key="r_B68F3", grp="fish", q = NA, url = NULL) 
{
  if(is.na(pmatch(grp, c("bird", "herp", "fish")))){
    message("Group has to be Bird, Herp or Fish")
    return(NULL)
  }
  url <- c(
    bird = "http://ornis2.ornisnet.org/api/v1/availablemaps/?",
    herp = "http://herpnet2.org/api/v1/availablemaps/?",
    fish = "http://www.fishnet2.net/api/v1/availablemaps/?"
  )[grp]
  qstr <- paste("api=",key,sep="")
  if(!is.na(q))
    qstr <- paste(qstr,"&q=",q,sep="")
  qstr<-gsub(" ","%20",qstr)
  qurl <- paste(url,qstr,sep="")
  message(qurl)
  out <- read.csv(qurl)
  if (nrow(out) == 0){
    out <- NULL
    message("No records found")
  }
  out
}