#' Search by Vertnet occurrence ID
#'
#' @export
#' @param ids (character) VertNet IDs, one or more. Required.
#' @param compact (logical) Return a compact data frame. That is, remove
#' empty columns. Default: \code{TRUE}
#' @param messages (logical) Print progress and information messages. 
#' Default: \code{TRUE}
#' @param ... Curl arguments passed on to \code{\link[crul]{HttpClient}}
#'
#' @return A list, with data frame of search results, and list of metadata
#' @references \url{http://bit.ly/vertnet-wiki}
#' @details VertNet IDs can be a variety of things, some URIs 
#' (i.e., with http://...), while others start with \code{urn}.
#' 
#' Internally in this function we filter data to darwin core terms only. To 
#' see what terms we use, do 
#' \code{readLines(
#' system.file("extdata", "simple_dwc_terms.txt", package = "rvertnet"))}. 
#' Get in touch with us if these terms need correcting/are out of date. The
#' terms are from 
#' https://github.com/tdwg/dwc/blob/master/dist/simple_dwc_horizontal.csv
#'
#' @examples \dontrun{
#' vert_id(ids = "urn:catalog:CM:Herps:116520")
#' ids <- c("http://arctos.database.museum/guid/MSB:Mamm:56979?seid=1643089", 
#'          "urn:catalog:CM:Herps:116520",
#'          "urn:catalog:AUM:Fish:13271")
#' res <- vert_id(ids)
#' res$data$occurrenceid
#' 
#' out <- vertsearch(taxon = "aves", state = "california", limit = 5)
#' (ids <- out$data$occurrenceid)
#' res <- vert_id(ids)
#' identical(sort(res$data$occurrenceid), sort(ids))
#' }

vert_id <- function(ids, compact = TRUE, messages = TRUE, ...) {
  cli <- crul::HttpClient$new(url = vurl())
  tt <- cli$get("api/search", query = list(q = make_id_q(ids)), ...)
  tt$raise_for_status()
  txt <- tt$parse("UTF-8")
  out <- jsonlite::fromJSON(txt)
  avail <- out$matching_records
  result <- out$recs
  df <- if (NROW(result) == 0) {
    data.frame(NULL, stringsAsFactors = FALSE) 
  } else {
    result
  }
  names(df) <- tolower(names(df))
  res <- get_terms()
  df <- df[ , names(df) %in% res ]
  if (compact) { 
    df <- df[ , !sapply(df, function(x) all(is.na(x))) ]
  }
  mssg(messages, paste("\nLast Query URL: \"", tt$url, "\"", sep = ""))
  mssg(messages, paste("\nMatching records:", NROW(df), "returned,", avail, 
                      "available", sep = " "))
  list(meta = make_meta(out), data = tibble::as_tibble(df))
}

make_id_q <- function(x) {
  x <- paste0(sprintf('\"%s\"', unname(unlist(x))), collapse = " OR ")
  x <- list(q = sprintf("iptrecordid:%s", x))
  jsonlite::toJSON(x, auto_unbox = TRUE)
}
