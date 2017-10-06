# Wrapper for search functions vertsearch, searchbyterm, spatialsearch and bigsearch

vertwrapper <- function(fxn = "", args = NULL, lim = NULL, rfile = NULL, 
                        email = NULL, compact = TRUE, messages = TRUE, 
                        only_dwc = TRUE, callopts = list(), ...) {
  mssg(messages, "Processing request...")
  if (fxn == "bigsearch") {
    #tt <- GET(vdurl(), query = list(q = make_bigq(args, email, rfile)), ...)
    cli <- crul::HttpClient$new(url = vdurl(), opts = callopts)
    tt <- cli$get('api/download', query = list(q = make_bigq(args, email, rfile)), ...)
    tt$raise_for_status()
    mssg(messages, "\nThank you! Download instructions will be sent by email.")
  } else {
    ress <- vert_GET(fxn, args, lim, messages, only_dwc, callopts, ...)
    
    # Remove columns populated fully by NAs
    if (compact) { 
      r <- ress$data
      ress$data <- r[,!sapply(r, function(x) all(is.na(x)))]
    }
    
    # Return results
    if (NROW(ress$data) == 0) {
      NULL
      mssg(messages, "No records match this search request")
      if (fxn == "spatialsearch") { 
        mssg(messages, "Check signs on decimal longitude and latitude") 
      }
    } else {
      ress
    }
  }
}

mssg <- function(v, ...) if (v) message(...)

get_terms <- function(){
  url <- "https://raw.githubusercontent.com/tdwg/dwc/master/dist/simple_dwc_horizontal.csv"
  res <- crul::HttpClient$new(url)$get()$parse("UTF-8")
  tolower(strsplit(res, split = ",")[[1]])
}

vert_GET <- function(fxn="searchbyterm", args, limit = 1000, messages = TRUE, 
                     only_dwc = TRUE, callopts = list(), ...) {
  cursor <- NULL
  allres <- 0
  result <- list()
  i <- 0
  cli <- crul::HttpClient$new(url = vurl(), opts = callopts)
  while (allres < limit) {
    # increment iterator
    i <- i + 1
  
    # http  
    tt <- cli$get('api/search', query = list(q = make_q(fxn, args, cursor, getlim(limit, allres))), ...)
    tt$raise_for_status()
    txt <- tt$parse("UTF-8")
    
    out <- jsonlite::fromJSON(txt)
    avail <- out$matching_records
    cursor <- out$cursor
    result[[i]] <- out$recs
    allres <- sum(vapply(result, NROW, 1))
    if (char2num(avail) <= allres) allres <- limit
  }
  df <- if (sum(sapply(result, NROW)) == 0) data.frame(NULL, stringsAsFactors = FALSE) else bind_rows(result)
  names(df) <- tolower(names(df))
  if (only_dwc) {
    res <- get_terms()
    df <- df[ , names(df) %in% res ]
  }
  mssg(messages, paste("\nLast Query URL: \"", tt$url, "\"", sep = ""))
  mssg(messages, paste("\nMatching records:", NROW(df), "returned,", avail, "available", sep = " "))
  list(meta = make_meta(out), data = tbl_df(df))
}

make_q <- function(fxn, x, cursor = NULL, limit=1000){
  qry <- ""
  if (fxn == "vertsearch") x <- strtrim(paste0(unname(unlist(x)), collapse = " "))
  if (fxn == "spatialsearch") x <- sprintf("distance(location,geopoint(%s,%s))<%s", x$lat, x$long, x$radius)
  # if query param present, remove named param
  if ("query" %in% names(x)) {
    qry <- x$query
    x <- pop(x, "query")
  }
  if (!is.null(limit)) {
    if (!is.null(cursor)) {
      ff <- sprintf(
        '{"q":"%s","l":%s,"c":"%s"}', 
        strtrim(noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), fxn)), 
        limit, 
        cursor
      )
    } else {
      ff <- sprintf(
        '{"q":"%s","l":%s}', 
        strtrim(paste(
          qry,
          noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), fxn)
        )),
        limit
      )
    }
  } else {
    ff <- sprintf(
      '{"q":"%s"}',
      strtrim(paste(
        qry,
        noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), fxn)
      ))
    )
  }
  
  tmp <- gsub(":>", ">", gsub(":<", "<", gsub(":=", "=", ff)))
  gsub("year\\.[0-9]", "year", tmp)
}

vurl <- function() "http://api.vertnet-portal.appspot.com"
vdurl <- function() "http://api.vertnet-portal.appspot.com"

make_meta <- function(x){
  tmp <- x[ !names(x) %in% "recs" ]
  names(tmp)[which(names(tmp) == "cursor")] <- "last_cursor"
  tmp
}

getlim <- function(x, y){
  stopifnot(is.numeric(x), is.numeric(y))
  toget <- x - y
  if (toget < 0) 0 else toget
}

char2num <- function(x) as.numeric(strextract(x, "[0-9]+"))
strextract <- function(str, pattern) regmatches(str, regexpr(pattern, str))
strtrim <- function(str) gsub("^\\s+|\\s+$", "", str)

noc <- function(x, fxn){
  if (fxn == "spatialsearch") {
    x
  } else {
    gsub(",", " ", x)
  }
}

make_bigq <- function(x, email, rfile){
  ff <- sprintf('{"q":"%s","n":"%s","e":"%s"}', noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), ""), rfile, email)
  tmp <- gsub(":>", ">", gsub(":<", "<", gsub(":=", "=", ff)))
  gsub("year\\.[0-9]", "year", tmp)
}

combyr <- function(x) {
  if (!is.null(x) && length(x) > 1) {
    stats::setNames(as.list(x), rep("year", length(x)))
  } else {
    list(year = x)
  } 
}
  
pop <- function(x, nms) {
  x[!names(x) %in% nms]
}

rvc <- function(x) Filter(Negate(is.null), x)

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ", 
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
