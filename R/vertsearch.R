#' Retrieve all taxa names or TSNs downstream in hierarchy from given TSN.
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
#' vertsearch("aves", "california", 10)
#' }
vertsearch <- 
  
function(cl = NA, sp = NA, limit = NA,
  url = "http://canary.vert-net.appspot.com/api/search",
  ...,
  curl = getCurlHandle()) 
{
  args <- list()
  if(!is.na(cl))
    args$cl <- cl
  if(!is.na(sp))
    args$sp <- sp
  if(!is.na(limit))
    args$limit <- limit
  temp <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- fromJSON(I(temp))
  ldply(out$records, function(x) as.data.frame(x))
}

# http://canary.vert-net.appspot.com/api/search?cl=aves&sp=california&limit=1