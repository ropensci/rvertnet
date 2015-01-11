#' Find records within some distance of a point given latitude and longitude.
#' 
#' Searches by decimal latitude and longitude to return any occurrence record
#' within the input distance (radius) of the input point.
#'
#' @import plyr jsonlite httr data.table
#' @param lat Latitude of the central point, in decimal degrees (numeric)
#' @param long Longitude of the central point, in decimal degrees (numeric)
#' @param radius Radius to search, in meters (numeric)
#' @param lim Limit on the number of records returned (numeric)
#' @param compact Return a compact data frame (boolean)
#' @details \code{spatialsearch} finds all records of any taxa having decimal lat/long
#'    coordinates within a given radius (in meters) of your coordinates.
#' @return A data frame of search results
#' @export
#' @examples \dontrun{
#'
#' res <- spatialsearch(lat = 33.529, lon = -105.694, rad = 2000, lim = 10)
#' }

spatialsearch <- function(lat = NULL, long = NULL, radius = NULL, lim = 1000,
                          compact = TRUE)

{

  args <- list(lat = lat, long = long, radius = radius)

  r <- vertwrapper(fxn = "spatialsearch", args = args, lim = lim, compact = compact)

}
