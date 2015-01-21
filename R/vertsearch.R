#' Find records using a global full-text search of VertNet archives.
#' 
#' Returns any record containing your target text in any field of the record.
#'
#' @export
#' @param taxon Taxonomic identifier or other text to search for (character)
#' @param ... Additional search terms (character)
#' @param limit Limit on the number of records returned. If you use a number with 5 zeros or more 
#' (e.g., 100000), you need to pass it as \code{100000L}. Default: 1000.  (numeric)
#' @param compact Return a compact data frame (boolean)
#' @param verbose Print progress and information messages. Default: TRUE
#' @return A data frame of search results
#' @details \code{\link{vertsearch}} performs a nonspecific search for your input within
#'    every record and field of the VertNet archives. For a more specific
#'    search, try searchbyterm().
#' @references \url{https://github.com/VertNet/webapp/wiki/The-API-search-function}
#' @examples \dontrun{
#' out <- vertsearch(taxon = "aves", state = "california")
#'
#' # Limit the number of records returned (under 1000)
#' out <- vertsearch("(kansas state OR KSU)", lim = 200)
#' # Use bigsearch() to retrieve >1000 records
#'
#' # Find multiple species using searchbyterm():
#' # a) returns a specific result
#' out <- searchbyterm(gen = "mustela", sp = "(nivalis OR erminea)")
#' vertmap(out)
#'
#' # b) returns a non-specific result
#' out <- vertsearch(tax = "(mustela nivalis OR mustela erminea)")
#' vertmap(out)
#'
#' # c) returns a non-specific result
#' splist <- c("mustela nivalis", "mustela erminea")
#' out <- lapply(splist, function(x) vertsearch(t=x, lim=500))
#' vertmap(out)
#' }

vertsearch <- function(taxon = NULL, ..., limit = 1000, compact = TRUE, verbose = TRUE)

{

  args <- compact(list(taxon, ...))

  vertwrapper(fxn = "vertsearch", args = args, lim = limit, compact = compact, verbose = verbose)

}

