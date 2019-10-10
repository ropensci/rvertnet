#' Find records within some distance of a point given latitude and longitude.
#'
#' Searches by decimal latitude and longitude to return any occurrence record
#' within the input distance (radius) of the input point.
#'
#' @export
#' @param lat (numeric) Latitude of the central point, in decimal degrees
#' required.
#' @param long (numeric) Longitude of the central point, in decimal degrees
#' required.
#' @param radius (numeric) Radius to search, in meters. There is no default
#' value for this parameter. required.
#' @param limit (integer) Limit on the number of records returned. If >1000
#' results, we use a cursor internally, but you should still get up to the
#' results you asked for. See also [bigsearch()] to get larger result
#' sets in a text file via email.
#' @param compact (logical) Return a compact data frame. default: `TRUE`
#' @param messages (logical) Print progress and information messages.
#' Default: `TRUE`
#' @param ... Curl arguments passed on to [crul::HttpClient]
#' @details [spatialsearch()] finds all records of any taxa having
#' decimal lat/long coordinates within a given radius (in meters) of
#' your coordinates.
#' @return A list with two slots:
#' 
#' - meta: a named list of metadata for the search results
#' - data: a data frame of search results, columns vary
#' 
#' @references
#' https://github.com/VertNet/webapp/wiki/The-API-search-function
#' @examples \dontrun{
#' res <- spatialsearch(lat = 33.529, long = -105.694, radius = 2000,
#'   limit = 10)
#'
#' # Pass in curl options for curl debugging
#' out <- spatialsearch(lat = 33.529, long = -105.694, radius = 2000,
#'   limit = 10, verbose = TRUE)
#' }

spatialsearch <- function(lat, long, radius, limit = 1000, compact = TRUE,
                          messages = TRUE, ...) {
  args <- list(lat = lat, long = long, radius = radius)
  vertwrapper(fxn = "spatialsearch", args = args, lim = limit,
              compact = compact, messages = messages, ...)
}
