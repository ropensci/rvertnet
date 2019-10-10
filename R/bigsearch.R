#' Request to download a large number of VertNet records.
#'
#' Specifies a term-wise search (like \code{\link{searchbyterm}}) and requests
#' that all available  records be made available for download as a
#' tab-delimited text file.
#'
#' @export
#' @param ... arguments, must be named, see [searchbyterm()] for details
#' @param rfile A name for the results file that you will download (character).
#' Required.
#' @param email An email address where you can be contacted when your records
#' are ready for download (character). Required.
#' @param messages (logical) Print progress and information messages.
#' Default: `TRUE`
#' @param callopts (named list) Curl arguments passed on to [crul::verb-GET]
#' @details \code{\link{bigsearch}} allows you to request records as a
#' tab-delimited text file. This is the best way to access a large number of
#' records, such as when your search results indicate that >1000 records are
#' available. You will be notified by email when your records are ready
#' for download.
#'
#' @section Reading data:
#' We suggest reading data in with `data.table::fread()` - as it's very
#' fast for the sometimes large datasets
#' you will get from using this function, and is usually robust to
#' formatting issues.
#'
#' @return Prints messages on progress, but returns NULL
#' @references
#' https://github.com/VertNet/webapp/wiki/The-API-search-function
#' @examples \dontrun{
#' # replace "big@@search.luv" with your own email address
#' bigsearch(genus = "ochotona", rfile = "pikaRecords", email = "big@@search.luv")
#'
#' # Pass in curl options for curl debugging
#' bigsearch(genus = "ochotona", rfile = "pikaRecords",
#'   email = "big@@search.luv", verbose = TRUE)
#'
#' # Use more than one year query
#' bigsearch(class = "aves", year = c(">=1976", "<=1986"),
#'           rfile = "test-bigsearch1", email = "big@@search.luv")
#' }
bigsearch <- function(..., rfile, email, messages = TRUE, callopts = list()) {
  args <- process_args(list(...))
  if (length(args) == 0) {
    stop("You must use at least one parameter to specify your query",
         call. = FALSE)
  }
  vertwrapper(fxn = "bigsearch", args = args, lim = NULL, rfile = rfile,
              email = email, compact = FALSE, messages = messages,
              callopts = callopts)
}
