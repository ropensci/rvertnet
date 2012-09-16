#' Retrieve locations and number of occurrence records from VertNet v2 portals.
#' 
#' @import httr
#' @inheritParams vertoccurrence
#' @return Dataframe of search results OR prints "No records found" if no matches.
#' @export
#' @examples \dontrun{
#' # Taxon
#' vertoccurrencecount(t="notropis")
#' vertoccurrencecount(t="notropis or nezumia")
#' vertoccurrencecount(t="Blenniidae")
#' 
#' # Location
#' vertoccurrencecount(l="country:india")
#' vertoccurrencecount(l="alabama or gulf of mexico")
#' vertoccurrencecount(l="africa", grp="bird")
#' 
#' # Catalog Number/Institution Code
#' vertoccurrencecount(c="TU 1")
#' vertoccurrencecount(c="mnhn or usnm")
#' vertoccurrencecount(c="ku 29288 or tu 66762")
#' 
#' # Date Range
#' vertoccurrencecount(d="2000-2000")
#' vertoccurrencecount(d="1950-1975")
#' 
#' # Other keywords
#' vertoccurrencecount(q="larva")
#' vertoccurrencecount(q="ethanol or EtOH")
#' 
#' # Geometry
#' vertoccurrencecount(p="POLYGON((-93.998292265615 32.615318339629,-92.471192656236 32.606063985828,-92.635987578112 31.235349580893,-90.988038359361 31.19776691287,-90.955079374988 30.395621231989,-93.94336062499 30.386144489302,-93.998292265615 32.615318339629))")
#' 
#' # Map
#' vertoccurrencecount(m=14)
#' 
#' # Wrong name
#' vertoccurrencecount(t="notropisz")
#' }
vertoccurrencecount <- function(key = "r_B68F3", grp = "fish",  t = NULL, 
			l = NULL, c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, url = NULL)
{
  vertwrapper(fxn = "occurrencecount", key = key, grp = grp, t = t, l = l, 
  						c = c, d = d, q = q, p = p, m = m)
}