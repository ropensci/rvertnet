#' Retrieve scientific names and the number of occurences of the scientific 
#' 		name from VertNet v2 portals.
#' 
#' @import httr
#' @inheritParams vertoccurrence
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' # Taxon
#' verttaxa(t="notropis")
#' verttaxa(t="notropis or nezumia")
#' verttaxa(t="Blenniidae")
#' 
#' # Location
#' verttaxa(l="country:india",grp="bird")
#' verttaxa(l="alabama or gulf of mexico")
#' verttaxa(l="africa",grp="herp")
#' 
#' # Catalog Number/Institution Code
#' verttaxa(c="TU 1")
#' verttaxa(c="mnhn or usnm")
#' verttaxa(c="ku 29288 or tu 66762")
#' 
#' # Date Range
#' verttaxa(d="2000-2000")
#' verttaxa(d="1950-1975")
#' 
#' # Other keywords
#' verttaxa(q="larva")
#' verttaxa(q="ethanol or EtOH")
#' 
#' # Geometry
#' verttaxa(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))")
#' 
#' # Map
#' verttaxa(m=14)
#' 
#' # Wrong name
#' verttaxa(t="notropisz")
#' }
verttaxa <- function(key = "r_B68F3", grp = "fish",  t = NULL, l = NULL,
           			c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{
  vertwrapper(fxn = "taxa", key = key, grp = grp, t = t, l = l, c = c, d = d, 
  						q = q, p = p, m = m )
}