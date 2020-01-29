#' Search VertNet archives using R
#'
#' There are a variety of ways to search VertNet
#' 
#' @section Search by term:
#' 
#' Search for _Aves_ in the state of _California_, limit to 10 records, e.g.:
#' 
#' \code{searchbyterm(class = "Aves", state = "California", lim = 10, 
#' verbose = FALSE)}
#' 
#' Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, 
#' limit to 20 records, e.g.:
#' 
#' \code{searchbyterm(genus = "Mustela", specificepithet = "nigripes", 
#'    state = "(wyoming OR south dakota)", limit = 20, verbose=FALSE)}
#' 
#' @section Big data:
#' Specifies a termwise search (like `searchbyterm()`), but requests that all 
#' available records  be made available for download as a tab-delimited 
#' text file.
#' 
#' \code{bigsearch(genus = "ochotona", rf = "pikaRecords", 
#' email = "big@@search.luv")}
#' 
#' @section Spatial search:
#' \code{spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, 
#' verbose = FALSE)}
#' 
#' @section Full text search:
#' Find records using a global full-text search of VertNet archives.
#' 
#' \code{vertsearch(taxon = "aves", state = "california")}
#' 
#' @section No results?:
#' 
#' It's possible to get no results when requesting data from VertNet,
#' then run the same function again 10 seconds later, and you do get a result.
#' I'm not sure why this is, something having to do with Vertnet's
#' infrastucture that I'm not aware of. Point is, if you are sure
#' you haven't made any mistakes with the parameters, etc., then 
#' simply run the function call again.
#' 
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom dplyr bind_rows tbl_df
#' @importFrom ggplot2 ggplot position_jitter aes geom_polygon 
#' geom_point labs theme_bw map_data
#' @importFrom utils URLdecode
#' @import maps
#' @name rvertnet-package
#' @aliases rvertnet
#' @docType package
#' @keywords package
NULL
