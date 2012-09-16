#' Retrieve locations and number of occurrence records for an organism from VertNet v2 portals.
#' 
#' @import httr
#' @inheritParams vertoccurrence
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' vertlocations(t="notropis")
#' }
vertlocations <- function(key = "r_B68F3", grp = "fish",  t = NULL, l = NULL,
             c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{
  vertwrapper(fxn = "locations", key = key, grp = grp, t = t, l = l, c = c, 
  						d = d, q = q, p = p, m = m)
}
