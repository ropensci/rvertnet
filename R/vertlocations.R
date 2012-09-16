#' Retrieve locations and number of occurrence records for an organism from VertNet v2 portals.
#' 
#' @import httr
#' @inheritParams vertoccurrence
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' # Taxon
#' vertlocations(t="notropis")
#' vertlocations(t="notropis or nezumia")
#' vertlocations(t="Blenniidae")
#' 
#' # Location
#' vertlocations(l="country:india")
#' vertlocations(l="alabama or gulf of mexico")
#' vertlocations(l="africa", grp="bird")
#' 
#' # Catalog Number/Institution Code
#' vertlocations(c="TU 1")
#' vertlocations(c="mnhn or usnm")
#' vertlocations(c="ku 29288 or tu 66762")
#' 
#' # Date Range
#' vertlocations(d="2000-2000")
#' vertlocations(d="1950-1975")
#' 
#' # Other keywords
#' vertlocations(q="larva")
#' vertlocations(q="ethanol or EtOH")
#' 
#' # Geometry
#' vertlocations(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))")
#' 
#' # Map
#' vertlocations(m=14)
#' 
#' # Wrong name
#' vertlocations(t="notropisz")
#' }
vertlocations <- function(key = "r_B68F3", grp = "fish",  t = NULL, l = NULL,
             c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{
  vertwrapper(fxn = "locations", key = key, grp = grp, t = t, l = l, c = c, 
  						d = d, q = q, p = p, m = m)
}