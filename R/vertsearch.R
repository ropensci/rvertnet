#' Find records using a global full-text search of VertNet archives.
#' 
#' Returns any record containing your target text in any field of the record.
#'
#' @export
#' @param taxon (character) Taxonomic identifier or other text to search for 
#' @param ... (character) Additional search terms. These must be unnamed 
#' @param limit (numeric) Limit on the number of records returned. If >1000 
#' results, we use a cursor internally, but you should still get up to the 
#' results you asked for. See also 
#' \code{\link{bigsearch}} to get larger result sets in a text file via email.
#' @param compact Return a compact data frame (boolean)
#' @param messages Print progress and information messages. Default: TRUE
#' @param only_dwc (logical) whether or not to return only Darwin Core term
#' fields. Default: \code{TRUE}
#' @param callopts curl options in a list passed on to 
#' \code{\link[crul]{HttpClient}}, see examples
#' 
#' @return A data frame of search results
#' @details \code{\link{vertsearch}} performs a nonspecific search for your 
#' input within every record and field of the VertNet archives. For a more 
#' specific search, try \code{\link{searchbyterm}}
#' @references 
#' \url{https://github.com/VertNet/webapp/wiki/The-API-search-function}
#' 
#' @examples \dontrun{
#' out <- vertsearch(taxon = "aves", "california", limit=3)
#'
#' # Limit the number of records returned (under 1000)
#' out <- vertsearch("(kansas state OR KSU)", limit = 200)
#' # Use bigsearch() to retrieve >1000 records
#'
#' # Find multiple species using searchbyterm():
#' # a) returns a specific result
#' out <- searchbyterm(genus = "mustela", species = "(nivalis OR erminea)")
#' vertmap(out)
#'
#' # b) returns a non-specific result
#' out <- vertsearch(taxon = "(mustela nivalis OR mustela erminea)")
#' vertmap(out)
#'
#' # c) returns a non-specific result
#' splist <- c("mustela nivalis", "mustela erminea")
#' out <- lapply(splist, function(x) vertsearch(taxon = x, lim = 500))
#' out <- dplyr::bind_rows(lapply(out, "[[", "data"))
#' vertmap(out)
#' 
#' # curl options
#' vertsearch(taxon = "Aves", limit = 10, callopts = list(verbose = TRUE))
#' # vertsearch(taxon = "Aves", limit = 10, callopts = list(timeout_ms = 10))
#' }

vertsearch <- function(taxon = NULL, ..., limit = 1000, compact = TRUE, 
                       messages = TRUE, only_dwc = TRUE, callopts = list()) {
  args <- rvc(list(taxon, ...))
  vertwrapper(fxn = "vertsearch", args = args, lim = limit,
              compact = compact, messages = messages, only_dwc = only_dwc, 
              callopts = callopts)
}
