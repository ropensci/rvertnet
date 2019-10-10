#' Search by term
#'
#' Flexible search for records using keywords/terms
#'
#' @export
#' @param ... arguments, must be named, see section `Parameters` for details.
#' Multiple inputs to a single parameter are supported, but you have to
#' construct that string yourself with `AND` or `OR` operators; see 
#' examples below.
#' @param limit (numeric) Limit on the number of records returned. If >1000
#' results, we use a cursor internally, but you should still get up to the
#' results you asked for. See also [bigsearch()] to get larger
#' result sets in a text file via email.
#' @param compact (logical) Return a compact data frame
#' @param messages (logical) Print progress and information messages.
#' Default: `TRUE`
#' @param only_dwc (logical) whether or not to return only Darwin Core term
#' fields. Default: `TRUE`
#' @param callopts (named list) Curl arguments passed on to [crul::verb-GET]
#'
#' @section Parameters:
#' 
#' All these parameters can be passed in to `searchbyterm()`. All others
#' will be silently dropped.
#' 
#' See https://github.com/VertNet/webapp/wiki/The-API-search-function
#' for more details
#'
#' **taxon**
#' 
#' - kingdom (character) Taxonomic kingdom
#' - phylum (character) Taxonomic phylum
#' - class (character) Taxonomic class
#' - order (character) Taxonomic order
#' - family (character) Taxonomic family
#' - genus (character) Taxonomic genus
#' - specificepithet (character) Taxonomic specific epithet, e.g. (sapiens
#' in Homo sapiens)
#' - infraspecificepithet (character) Taxonomic infraspecific epithet
#' - scientificname (character) scientific name
#' - vernacularname (character) a verncular name
#'
#' **event**
#' 
#' - year (numeric) Year or range of years designated by comparison
#'  operators "<", ">", "<=" or ">=". You can pass in more than one of these
#'  queries, in a vector. See example below
#' - month (numeric) month or range of months designated by comparison
#'  operators "<", ">", "<=" or ">=". You can pass in more than one of these
#'  queries, in a vector. See example below
#' - day (numeric) day or range of days designated by comparison
#'  operators "<", ">", "<=" or ">=". You can pass in more than one of these
#'  queries, in a vector. See example below
#' - eventdate Event date associated with this occurrence record; yyyy-mm-dd
#'  or the range yyyy-mm-dd/yyyy-mm-dd (character)
#'
#' **record level**
#' 
#' - institutioncode (character) Code name for the provider/institution
#' of record
#' - occurrenceid (character) Provider's unique identifier for this
#' occurrence record
#' - catalognumber (character) Provider's catalog number or other ID for
#' this record
#' - collectioncode (character) collection code
#' - license (dcterms:license) license string
#' - iptlicense (eml:intellectualRights) license string
#' - basisofrecord (character) one of PreservedSpecimen, FossilSpecimen,
#' MaterialSample, Occurrence, MachineObservation, HumanObservation
#' - hasmedia (logical) Record also references associated media, such as a
#' film or video
#' - isfossil (logical) `dwc:basisOfRecord` is FossilSpecimen or collection
#' is a paleo collection
#' - haslicense (logical) `dcterms:license` or `eml:intellectualRights` has a
#' license designated
#'
#' **identification**
#' 
#' - typestatus (character) a type status
#' - hastypestatus (logical) type status known or not
#'
#' **occurrence**
#' 
#' - iptrecordid (character) (same as `dwc:occurrenceID`)
#' - recordedby (character) Collector name
#' - recordnumber (character) record number
#' - fieldnumber (character) field number 
#' - establishmentmeans (character) establishment means
#' - wascaptive (logical) (`dwc:establishmentMeans` or occurrenceRemarks suggests
#' it was captive)
#' - wasinvasive (logical) (was the organism recorded to be invasive where
#' and when it occurred)
#' - sex (character) standardized sex from original sex field or extracted
#' from elsewhere in the record
#' - lifestage (character) lifeStage from original sex field or extracted
#' from elsewhere in the record
#' - preparations (not sure what this means)
#' - hastissue (logical) Record is likely to reference tissues
#' - reproductivecondition (not sure what this means)
#'
#' **location**
#' 
#' - continent (character) Continent to search for occurrence
#' - country (character) Country to search for occurrence
#' - stateprovince (character) State or province to search for occurrence
#' - county (character) County to search for occurrence
#' - island (character) Island to search for occurrence
#' - igroup (character) Island group to search for occurrence
#' - municipality (character) 
#' - waterbody (character) 
#' - geodeticdatum (character) 
#' - georeferencedby (character) 
#' - georeferenceverificationstatus (character) 
#' - location a Google GeoField of the `dwc:decimalLatitude`,
#' `dwc:decimalLongitude`
#' - mappable (logical) Record includes valid coordinates in decimal latitude
#' and decimal longitude
#'
#' **geological context**
#' 
#' - bed (character) geological bed
#' - formation (character) geological formation
#' - group (character) geological group
#' - member (character) geological member
#'
#' **traits**
#' 
#' - haslength (logical) (was a value for length extracted?)
#' - hasmass (logical) (was a value for mass extraccted?)
#' - hassex (logical) (does the record have sex?)
#' - haslifestage (logical) (does the record have life stage?)
#' - lengthtype (character) type of length measurement extracted from the
#' record, can refer to a number or to a range) ('total length',
#' 'standard length', 'snout-vent length','head-body length', 'fork length',
#' 'total length range', 'standard length range', 'snout-vent length range',
#' 'head-body length range', 'fork length range'
#' - lengthinmm (numeric) length measurement extracted from the record
#' - massing (numeric) mass measurement extracted from the record (For
#' detailed information about trait extraction and aggregation and querying
#' via the VertNet portal, see http://vertnet.org/resources/traitsguide.html
#'
#' **data set**
#' 
#' - gbifdatasetid (character) GBIF identifier for the data set
#' - gbifpublisherid (character) GBIF identifier for the data publishing
#' organization
#' - lastindexed (character) date (YYYY-MM-DD) the record was most recently
#' indexed into VertNet
#' - networks (character) one of MaNIS, ORNIS, HerpNET, FishNet, VertNet,
#' Arctos, Paleo
#' - migrator (character) the version of the migrator used to process the
#' data set, a date of form (YYYY-MM-DD) 
#' - orgcountry (character) the country where the organization is located
#' - orgstateprovince (character) the first-level administrative unit where
#' the organization is located
#'
#' **index**
#' 
#' - rank (character) a higher number means the record is more complete
#' with respect to georeferences, scientific names, and event dates
#' - vntype (character) Type of record; "specimen" or "observation"
#' - hashid (integer) a value to distribute records in 10k bins; 0-9998
#'
#' **other**
#' 
#' - coordinateuncertaintyinmeters (character) Coordinate uncertainty
#' in meters (numeric) or range of uncertainty values designated by
#' comparison operators "<", ">", "<=", or ">="
#' 
#' @section No results?:
#' 
#' It's possible to get no results with a call to `searchbyterm()`,
#' then run it again 10 seconds later, and you do get a result.
#' I'm not sure why this is, something having to do with Vertnet's
#' infrastucture that I'm not aware of. Point is, if you are sure
#' you haven't made any mistakes with the parameters, etc., then 
#' simply run the function call again.
#'
#' @return A list with two slots:
#' 
#' - meta: a named list of metadata for the search results
#' - data: a data frame of search results, columns vary
#' 
#' @references
#' https://github.com/VertNet/webapp/wiki/The-API-search-function
#' 
#' @details `searchbyterm()` builds a query from input parameters
#' based on Darwin Core (dwc) terms (for the full list of terms, see
#' https://code.google.com/p/darwincore/wiki/DarwinCoreTerms).
#'
#' @examples \dontrun{
#' # Find multiple species
#' out <- searchbyterm(genus = "ochotona",
#'   specificepithet = "(princeps OR collaris)", limit=10)
#' 
#' # iptrecordid
#' searchbyterm(iptrecordid = "7108667e-1483-4d04-b204-6a44a73a5219")
#' 
#' # you can pass more than one, as above, in a single string in parens
#' records <- "(7108667e-1483-4d04-b204-6a44a73a5219 OR 1efe900e-bde2-45e7-9747-2b2c3e5f36c3)"
#' searchbyterm(iptrecordid = records, callopts = list(verbose = TRUE))
#'
#' # Specifying a range (in meters) for uncertainty in spatial location
#' # (use quotes)
#' out <- searchbyterm(class = "aves", stateprovince = "nevada", 
#'   coordinateuncertaintyinmeters = "<25")
#' out <- searchbyterm(class = "aves", stateprovince = "california", year = 1976,
#'   coordinateuncertaintyinmeters = "<=1000")
#'
#' # Specifying records by event date (use quotes)
#' out <- searchbyterm(class = "aves", stateprovince = "california",
#'   eventdate = "2009-03-25")
#' # ...but specifying a date range may not work
#' out <- searchbyterm(specificepithet = "nigripes",
#'   eventdate = "1935-09-01/1935-09-30")
#'
#' # Pass in curl options for curl debugging
#' out <- searchbyterm(class = "aves", limit = 10,
#'  callopts = list(verbose = TRUE))
#'
#' # Use more than one year query
#' searchbyterm(genus = "mustela", specificepithet = "nigripes",
#'    year = c('>=1900', '<=1940'))
#'
#' searchbyterm(sex  = "male", limit = 30)$data$sex
#' searchbyterm(lifestage  = "juvenile", limit = 30)$data$lifestage
#' }
searchbyterm <- function(..., limit = 1000, compact = TRUE, messages = TRUE,
  only_dwc = TRUE, callopts = list()) {

  args <- process_args(list(...))
  vertwrapper(fxn = "searchbyterm", args = args, lim = limit,
              compact = compact, messages = messages, only_dwc = only_dwc,
              callopts = callopts)
}

process_args <- function(x) {
  args_out <- list()
  for (i in seq_along(x)) {
    # as is
    mtch_a <- asis_args %in% names(x)[i]
    if (any(mtch_a))
      args_out[[ asis_args[which(mtch_a)] ]] <- x[[i]]
    # boolean
    mtch_b <- boolean_args %in% names(x)[i]
    if (any(mtch_b))
      args_out[[ boolean_args[which(mtch_b)] ]] <- ab(x[[i]])
  }
  if ("stateprovince" %in% names(x))
    args_out$stateprovince <- sp_paren(x$stateprovince)
  z <- x
  x$year <- x$month <- x$day <- NULL
  args_out <- rvc(c(args_out,
    comb_var(z$year, "year"),
    comb_var(z$month, "month"),
    comb_var(z$day, "day")))
  return(args_out)
}

asis_args <- c(
  "kingdom", "phylum", "class", "order", "family", "genus", 
  "specificepithet", "infraspecificepithet", "scientificname", 
  "vernacularname", "eventdate", "institutioncode", "occurrenceid", 
  "catalognumber", "collectioncode", "license", "iptlicense", 
  "basisofrecord", "typestatus", "iptrecordid", "recordedby",
  "recordnumber", "fieldnumber", "establishmentmeans", "sex",
  "lifestage", "preparations", "reproductivecondition",
  "continent", "country", "county",
  "island", "igroup", "municipality", "waterbody", "geodeticdatum", 
  "georeferencedby", "georeferenceverificationstatus", "location", 
  "bed", "formation", "group", "member", "lengthtype", "lengthinmm", 
  "massing", "gbifdatasetid", "gbifpublisherid", "lastindexed", 
  "networks", "migrator", "orgcountry", "orgstateprovince", 
  "rank", "vntype", "hashid", "coordinateuncertaintyinmeters"
)
boolean_args <- c(
  "hasmedia", "isfossil", "haslicense", "hastypestatus", "wascaptive",
  "wasinvasive", "hastissue", "mappable", "haslength", "hasmass",
  "hassex", "haslifestage"
)

sp_paren <- function(x) {
  if (!is.null(x)) {
    if (grepl("\\sAND\\s|\\sOR\\s|\\sNOT\\s", x)) {
      sprintf("(%s)", x)
    } else {
      x
    }
  } else {
    NULL
  }
}

ab <- function(x) {
  assert(x, "logical")
  if (is.null(x)) {
    NULL
  } else {
    if (x) 1 else 0
  }
}
