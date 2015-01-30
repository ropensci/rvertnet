# Wrapper for search functions vertsearch, searchbyterm, spatialsearch and bigsearch

vertwrapper <- function(fxn = "", args = NULL, lim = NULL, rfile = NULL, email = NULL,
                        compact = TRUE, verbose = TRUE, ...)
  
{
  # check that limit < 1000
#   if(!is.null(lim))
#     if( lim > 1000 ) stop("For now, limit can't be greater than 1000", call. = FALSE)

  # Create query object
  
#   if(fxn == "vertsearch"){
#     qstr <- paste(args, collapse = "%20")
#   } else if(fxn == "searchbyterm" | fxn == "bigsearch"){
#     qstr <- paste(names(args), args, sep = ":", collapse = "%20")
#     qstr <- gsub(":>", ">", gsub(":<", "<", gsub(":=", "=", qstr))) # Numerical query
#   } else if(fxn == "spatialsearch"){
#     qstr <- paste("distance(location,geopoint(", 
#                   paste(args$lat, args$long, sep = ","), "))<", args$radius, sep = "")
#   }
#   
#   qstr <- gsub(" ", "%20", qstr) # Allow for AND/OR constructions and multi-word values
#   qstr <- paste("%22q%22:%22", qstr, "%22", sep = "") 
#   if(!is.null(lim)) { # Add a limit on results returned
#     lstr <- paste("%22l%22", as.numeric(lim), sep = ":")
#     query.str <- paste("q=%7B", paste(qstr, lstr, sep = ","), "%7D", sep = "")
#   } else if(fxn == "bigsearch"){ # Add a results.file name and email address
#     nstr <- paste("%22n%22:%22", rfile, "%22", sep = "")
#     estr <- paste("%22e%22:%22", email, "%22", sep = "")
#     query.str <- paste("q=%7B", paste(qstr, nstr, estr, sep = ","), "%7D", sep = "")
#   } else{
#     query.str <- paste("q=%7B", qstr, "%7D", sep = "")
#   }
  
  # Get results
  mssg(verbose, "Processing request...")
  if(fxn == "bigsearch"){
    url <- paste("http://api.vertnet-portal.appspot.com/api/download?", query.str, sep = "")
    mssg(verbose, paste("\nDownload of records file '", rfile, "' requested for '", email, "'", sep = ""))
    mssg(verbose, paste("\nQuery/URL: \"", url, "\"", sep = ""))
    r <- GET(url, ...)
    stop_for_status(r)
    mssg(verbose, "\nThank you! Download instructions will be sent by email.")
  } else {
    ress <- vert_GET(fxn, args, lim, verbose, ...)
    
    # Remove columns populated fully by NAs
    if (compact) { 
      r <- as.data.table(ress$data)
      ress$data <- data.frame(r[,which(unlist(lapply(r, function(x) !all(is.na(x))))), with=FALSE], stringsAsFactors = FALSE)
    }
    
    # Return results
    if (NROW(ress$data) == 0) {
      NULL
      mssg(verbose, "No records match this search request")
      if (fxn == "spatialsearch") { 
        mssg(verbose, "Check signs on decimal longitude and latitude") 
      }
    } else {
      ress
    }
  }
}

mssg <- function(v, ...) if(v) message(...)

get_terms <- function(){
  url <- "https://raw.githubusercontent.com/tdwg/dwc/master/downloads/SimpleDwCTermsList.txt"
  termlist <- read.table(text = content(GET(url), as = "text"), stringsAsFactors = FALSE)
  # Strip embedded header from termlist and deal with upper vs. lower case in termlist vs. out$recs
  if (grep("term", tolower(termlist[1,1]))) termlist <- as.data.frame(termlist[-1,1], stringsAsFactors = F)
  fullr <- as.data.frame(matrix(NA, 1, length(termlist[,1]))) # Create a full data frame to populate
  colnames(fullr) <- tolower(termlist[,1]) # Sync case to facilitate merge
  list(termlist=termlist, fullr=fullr)
}

vert_GET <- function(fxn="searchbyterm", args, limit = 1000, verbose = TRUE, ...){
  cursor <- NULL
  allres <- 0
  result <- list()
  i <- 0
  while(allres < limit){
    i <- i + 1
    tt <- GET(vurl(), query = list(q = make_q(fxn, args, cursor, getlim(limit, allres))), ...)
    stop_for_status(tt)
    txt <- content(tt, "text")
    out <- jsonlite::fromJSON(txt)
    avail <- out$matching_records
    cursor <- out$cursor
    result[[i]] <- out$recs
    allres <- sum(sapply(result, NROW))
    if(char2num(avail) < limit) allres <- limit
  }
  df <- data.frame(rbindlist(result), stringsAsFactors = FALSE)
  res <- get_terms()
  df <- merge(res$fullr, df, all = TRUE)[,tolower(res$termlist[,1])]
  df <- df[ -NROW(df), ]
  mssg(verbose, paste("\nLast Query URL: \"", tt$url, "\"", sep = ""))
  mssg(verbose, paste("\nMatching records:", NROW(df), "returned,", avail, "available", sep = " "))
  list(meta=make_meta(out), data=df)
}

make_q <- function(fxn, x, cursor = NULL, limit=1000){
  if(fxn == "vertsearch") x <- paste0(unname(unlist(x)), collapse = " ")
  if(fxn == "spatialsearch") x <- sprintf("distance(location,geopoint(%s,%s))<%s", x$lat, x$long, x$radius)
  if(!is.null(limit)){
    if(!is.null(cursor)){
      ff <- sprintf('{"q":"%s","l":%s,"c":"%s"}', noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), fxn), limit, cursor)
    } else {
      ff <- sprintf('{"q":"%s","l":%s}', noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), fxn), limit)
    }
  } else {
    ff <- sprintf('{"q":"%s"}', noc(gsub('\"|\\{|\\}', "", jsonlite::toJSON(x, auto_unbox = TRUE)), fxn))
  }
  gsub(":>", ">", gsub(":<", "<", gsub(":=", "=", ff)))
}

vurl <- function() "http://api.vertnet-portal.appspot.com/api/search"

make_meta <- function(x){
  tmp <- x[ !names(x) %in% "recs" ]
  rename(tmp, c(cursor = "last_cursor"))
}

getlim <- function(x, y){
  stopifnot(is.numeric(x), is.numeric(y))
  toget <- x-y
  if(toget < 0) 0 else toget
}

char2num <- function(x) as.numeric(strextract(x, "[0-9]+"))
strextract <- function(str, pattern) regmatches(str, regexpr(pattern, str))
strtrim <- function(str) gsub("^\\s+|\\s+$", "", str)

noc <- function(x, fxn){
  if(fxn == "spatialsearch")
    x
  else
    gsub(",", " ", x)
}