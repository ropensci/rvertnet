#' Retrieve institution and the number of occurences served by institution from 
#' 		VertNet v2 portals.
#' 
#' @import httr
#' @inheritParams vertoccurrence
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' # Taxon
#' vertproviders(t="notropis")
#' vertproviders(t="notropis or nezumia")
#' vertproviders(t="Blenniidae")
#' 
#' # Location
#' vertproviders(l="country:canada")
#' vertproviders(l="alabama or gulf of mexico")
#' vertproviders(l="africa",grp="bird")
#' 
#' # Catalog Number/Institution Code
#' vertproviders(c="TU 1")
#' vertproviders(c="mnhn or usnm")
#' vertproviders(c="ku 29288 or tu 66762")
#' 
#' # Date Range
#' vertproviders(d="2000-2000")
#' vertproviders(d="1950-1975")
#' 
#' # Other keywords
#' vertproviders(q="larva")
#' vertproviders(q="ethanol or EtOH")
#' 
#' # Geometry
#' vertproviders(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))")
#' 
#' # Map
#' vertproviders(m=14)
#' 
#' # Wrong name
#' vertproviders(t="notropisz")
#' }
vertproviders <- function(key = "r_B68F3", grp = "fish",  t = NULL, l = NULL,
              c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{
  vertwrapper(fxn = "providers", key = key, grp = grp, t = t, l = l, c = c, 
  						d = d, q = q, p = p, m = m)
}