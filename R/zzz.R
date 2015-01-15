# Wrapper for search functions vertsearch, searchbyterm, spatialsearch and bigsearch

vertwrapper <- function(fxn = "", args = NULL, lim = NULL, rfile = NULL, email = NULL,
                        compact = TRUE, verbose = TRUE)
  
{
  
  # Create query object
  
  if(fxn == "vertsearch"){
    qstr <- paste(args, collapse = "%20")
  } else if(fxn == "searchbyterm" | fxn == "bigsearch"){
    qstr <- paste(names(args), args, sep = ":", collapse = "%20")
    qstr <- gsub(":>", ">", qstr <- gsub(":<", "<", qstr <- gsub(":=", "=", qstr))) # Numerical query
  } else if(fxn == "spatialsearch"){
    qstr <- paste("distance(location,geopoint(", 
                  paste(args$lat, args$long, sep = ","), "))<", args$radius, sep = "")
  } else{ # Additional functions
  } 
  qstr <- gsub(" ", "%20", qstr) # Allow for AND/OR constructions and multi-word values
  qstr <- paste("%22q%22:%22", qstr, "%22", sep = "") 
  if(!is.null(lim)){ # Add a limit on results returned
    lstr <- paste("%22l%22", as.numeric(lim), sep = ":")
    query.str <- paste("q=%7B", paste(qstr, lstr, sep = ","), "%7D", sep = "")
  } else if(fxn == "bigsearch"){ # Add a results.file name and email address
    nstr <- paste("%22n%22:%22", rfile, "%22", sep = "")
    estr <- paste("%22e%22:%22", email, "%22", sep = "")
    query.str <- paste("q=%7B", paste(qstr, nstr, estr, sep = ","), "%7D", sep = "")
  } else{
    query.str <- paste("q=%7B", qstr, "%7D", sep = "")
  }
  
  # Get results
  
  mssg(verbose, "Processing request...")
  if(fxn == "bigsearch"){
    url <- paste("http://api.vertnet-portal.appspot.com/api/download?", query.str, sep = "")
    mssg(verbose, paste("\nDownload of records file '", rfile, "' requested for '", email, "'", sep = ""))
    mssg(verbose, paste("\nQuery/URL: \"", url, "\"", sep = ""))
    r <- GET(url)
    warn_for_status(r)
    message("\nThank you! Download instructions will be sent by email.")
  } else{
    url <- paste("http://api.vertnet-portal.appspot.com/api/search?", query.str, sep = "")
    out <- fromJSON(url)
    r <- out$recs
      
    # Print query and stats
    mssg(verbose, paste("\nQuery/URL: \"", url, "\"", sep = ""))
    mssg(verbose, paste("\n\nQuery date:", unlist(out[1]), sep = " "))
    mssg(verbose, paste("\n\nMatching records:", unlist(out[2]), "returned,", unlist(out[8]), "available", sep = " "))
    
    # Sort dataframe columns as in dwc term list
    url <- "https://raw.githubusercontent.com/tdwg/dwc/master/downloads/SimpleDwCTermsList.txt"
    termlist <- read.table(text = content(GET(url), as = "text"), stringsAsFactors = FALSE)
    # Strip embedded header from termlist and deal with upper vs. lower case in termlist vs. out$recs
    if (grep("term", tolower(termlist[1,1]))) termlist <- as.data.frame(termlist[-1,1], stringsAsFactors = F)
    fullr <- as.data.frame(matrix(NA, 1, length(termlist[,1]))) # Create a full data frame to populate
    colnames(fullr) <- tolower(termlist[,1]) # Sync case to facilitate merge
    r <- merge(fullr, r, all = TRUE)[,tolower(termlist[,1])] # Order columns as in termlist
    
    # Remove columns populated fully by NAs
    
    if (compact) { 
      r <- as.data.table(r)
      r <- r[,which(unlist(lapply(r, function(x) !all(is.na(x))))), with=FALSE]
    }
    
    # Return results
    
    if (nrow(r) == 0) {
      NULL
      mssg(verbose, "No records match this search request")
      if (fxn == "spatialsearch") { 
        mssg(verbose, "Check signs on decimal longitude and latitude") 
      }
    } else {
      data.frame(r[-dim(r)[1],], stringsAsFactors = FALSE) # Omit a row of NAs generated for the merge above
    }
    
  }
  
}

mssg <- function(v, ...) if(v) message(...)
