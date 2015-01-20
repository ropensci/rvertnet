#' Find records within some distance of a point given latitude and longitude.
#' 
#' Searches by decimal latitude and longitude to return any occurrence record
#' within the input distance (radius) of the input point.
#'
#' @export
#' @param lat Latitude of the central point, in decimal degrees (numeric) Required.
#' @param long Longitude of the central point, in decimal degrees (numeric) Required.
#' @param radius Radius to search, in meters (numeric). Required.
#' @param limit Limit on the number of records returned (numeric). Default: 1000
#' @param compact Return a compact data frame (logical)
#' @param verbose Print progress and information messages. Default: TRUE
#' @details \code{\link{spatialsearch}} finds all records of any taxa having decimal lat/long
#'    coordinates within a given radius (in meters) of your coordinates.
#' @return A data frame of search results
#' @references \url{https://github.com/VertNet/webapp/wiki/The-API-search-function}
#' @examples \dontrun{
#' res <- spatialsearch(lat = 33.529, long = -105.694, radius = 2000, limit = 10)
#' }

spatialsearch <- function(lat, long, radius, limit = 1000,
                          compact = TRUE, verbose = TRUE)

{

  args <- list(lat = lat, long = long, radius = radius)

  vertwrapper(fxn = "spatialsearch", args = args, lim = limit, compact = compact, verbose = verbose)

}
