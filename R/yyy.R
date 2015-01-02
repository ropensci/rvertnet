# Wrapper for vertsummary function

vertsumwrapper <- function(input = NULL)
  
{

  if(is(input, "list"))  input <- ldply(input, data.frame)

  # recs <- number of records in the data frame
  recs <- nrow(input)
	cat("\nNumber of records ($recs): ", recs, sep = "")

  # coords <- number of records with viable lat and long data
  # errest <- number of "coords" records with viable coordinate uncertainty estimate
	if(inherits(input$decimallatitude, "NULL") & 
    inherits(input$decimallongitude, "NULL")){coords <- 0} else{coords <- NULL}
  if(inherits(input$coordinateuncertaintyinmeters, "NULL")){errest <- 0} else{errest <- NULL}
  if(is.null(coords)){
    coords <- sum(complete.cases(input[,list(input$decimallatitude, 
                                             input$decimallongitude)]))
    # checking for good lat/long data (if not, use only the above line)
    input$decimallatitude <- as.numeric(as.character(input$decimallatitude))
    input$decimallongitude <- as.numeric(as.character(input$decimallongitude))
    if(is.null(errest)){input$coordinateuncertaintyinmeters <-
      as.numeric(as.character(input$coordinateuncertaintyinmeters))}
    mappable <- input[complete.cases(input[,list(input$decimallatitude, 
                                                 input$decimallongitude)]),]
    mappable <- subset(mappable, input$decimallatitude < 90 & input$decimallatitude > -90)
    mappable <- subset(mappable, input$decimallongitude < 180 & input$decimallongitude > -180)
    if(nrow(mappable) < coords){
      bad <- coords - nrow(mappable)
      message(bad, " record(s) with bad coordinates")
      coords <- coords - bad
    }
    if(is.null(errest)){
      mappable <- subset(mappable, input$coordinateuncertaintyinmeters > 0 &
                         input$coordinateuncertaintyinmeters < 20020000)
      if((errest <- nrow(mappable)) < coords){bad <- coords - errest}
    }
  }
	cat("\n\nRecords with decimal lat/long ($coords): ", coords, sep = "")
  message("(-90<lat<90, -180<long<180)")
  cat("\n\nRecords with lat/long and coordinate uncertainty estimate ($errest): ", errest)
  message("(0<errest<20020000)")

  # instcoll <- number of records from each institution+collection
  removeDups <- function(x) {paste(unique(unlist(strsplit(x, split=" "))), collapse = " ")}
  if(inherits(input$institutioncode, "NULL") & inherits(input$collectioncode, "NULL")){
    instcoll <- NA} else{
      instcoll <- as.matrix(paste(input[,input$institutioncode], 
                                  input[,input$collectioncode], sep = " "))
      instcoll <- table(apply(instcoll, 1, removeDups))
  }
  cat("\n\nRecord count by institution/collection ($instcoll): ")
  print(instcoll)
  
  # country <- number of records from each country
  if(inherits(input$country, "NULL")){country <- NA} else{country <- table(input$country)}
  cat("\n\nRecord count by country ($country): ")
  print(country)

  # year <- number of records by year
  if(inherits(input$year, "NULL")){year <- NA} else{year <- table(input$year)}
  cat("\n\nRecord count by year ($year): ")
  print(year)

  # taxon <- number of records by taxonomic name
  taxon <- as.matrix(paste(input[,input$genus], input[,input$specificepithet], sep = " "))
  if(!inherits(input$infraspecificepithet, "NULL")){
    taxon <- as.matrix(paste(taxon, input[,input$infraspecificepithet], sep = " "))}
  taxon <- gsub(" NA", "", taxon) # remove unknowns - usually infrasp.ep
  taxon <- table(apply(taxon, 1, removeDups))
  cat("\n\nRecord count by taxon ($taxon): ")
  print(taxon)
  
  # return summary
  s <- list("recs" = recs, "coords" = coords, "errest" = errest, "instcoll" = instcoll,
            "country" = country, "year" = year, "taxon" = taxon)

}
