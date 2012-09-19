#' Search for occurrences for a given taxonomic name.
#' 
#' @import RJSONIO RCurl plyr
#' @param cl Taxonomic search term (character).
#' @param sp State or province (character).
#' @param limit Search return limit (numeric).
#' @param url The VertNet url for the function (should be left to default).
#' @param ... optional additional curl options (debugging tools mostly).
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Dataframe of search results OR prints "no search match" if no matches.
#' @export
#' @examples \dontrun{
#' vertsearch(cl = "aves", sp = "california", limit = 10)
#' }
vertsearch <- function(cl = NULL, sp = NULL, limit = NULL,
  url = "http://canary.vert-net.appspot.com/api/search") 
{
  args <- compact(list(cl = cl, sp = sp, limit = limit))
  out <- content(GET(url, query = args))
  ldply(out$records, function(x) as.data.frame(x))
}