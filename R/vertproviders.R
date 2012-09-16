#' Retrieve institution and the number of occurences served by institution from 
#' 		VertNet v2 portals.
#' 
#' @import httr
#' @inheritParams vertoccurrence
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' vertproviders(t="notropis")
#' }
vertproviders <- function(key = "r_B68F3", grp = "fish",  t = NULL, l = NULL,
              c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{
  vertwrapper(fxn = "providers", key = key, grp = grp, t = t, l = l, c = c, 
  						d = d, q = q, p = p, m = m)
}
