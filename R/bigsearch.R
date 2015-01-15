#' Request to download a large number of VertNet records.
#' 
#' Specifies a termwise search (like \code{\link{searchbyterm}}) and requests that all available 
#' records be made available for download as a tab-delimited text file.
#'
#' @export
#' @inheritParams searchbyterm
#' @param rfile A name for the results file that you will download (character)
#' @param email An email address where you can be contacted when your records are
#'    ready for download (character)
#' @details \code{\link{bigsearch}} allows you to request records as a tab-delimited text file.
#'    This is the best way to access a large number of records, such as when your search
#'    results indicate that >1000 records are available. You will be notified by email
#'    when your records are ready for download.
#' @references \url{https://github.com/VertNet/webapp/wiki/The-API-search-function}
#' @examples \dontrun{
#' # replace "big@@search.luv" with your own email address
#' bigsearch(genus = "ochotona", rf = "pikaRecords", email = "big@@search.luv")
#' }

bigsearch <- function(species = NULL, genus = NULL, family = NULL, order = NULL,
                      class = NULL, compact = FALSE, year = NULL, date = NULL,
                      mappable = NULL, error = NULL, continent = NULL, cntry = NULL,
                      stateprovince = NULL, county = NULL, island = NULL, igroup = NULL,
                      inst = NULL, id = NULL, catalognumber = NULL, collector = NULL, 
                      type = NULL, hastypestatus = NULL, media = NULL, rank = NULL, 
                      tissue = NULL, resource = NULL, rfile = NULL, email = NULL, verbose = TRUE)
  
{

  args <- compact(list(specificepithet = species, genus = genus, family = family,
                            order = order, class = class, year = year, eventdate = date,
                            mappable = mappable, coordinateuncertaintyinmeters = error,
                            continent = continent, country = cntry, stateprovince = stateprovince,
                            county = county, island = island, islandgroup = igroup,
                            institutioncode = inst, occurrenceid = id, catalognumber = catalognumber,
                            recordedby = collector, type = type, hastypestatus = hastypestatus,
                            media = media, rank = rank, tissue = tissue, resource = resource))
  
  vertwrapper(fxn = "bigsearch", args = args, lim = NULL, rfile = rfile, email = email,
              compact = FALSE, verbose = verbose)
  
}
