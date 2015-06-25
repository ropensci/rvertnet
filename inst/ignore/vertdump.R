#' Retrieves dump from KNB
#' 
#' @export
#' @param group (character) Taxonomic group. One of mammals, reptiles, amphibians, 
#' fishes, or birds
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @references 
#' \url{http://blog.vertnet.org/post/115875718156/the-data-one-thing-about-vertnet-and-big-data}
#' @examples \dontrun{
#' out <- vertdump(group = "amphibians")
#' }
vertdump <- function(group, ...){
  library("dplyr") 
  library("RSQLite")
  con <- dbConnect(RSQLite::SQLite(), dbname = "amphibians.sqlite")
  dbWriteTable(con, "amphibians", "/Users/sacmac/Downloads/urn-uuid-afc58110-b9c1-4cf7-b46c-837bdc930a21", 
               row.names = FALSE, header = TRUE, sep = ",")
}

dump_links <- list(
  mammals = list(
    doi = "10.5063/F1GQ6VPM",
    data = "1d09e64b-d25a-46e7-bdc1-0a91fb7bf8bb",
    view = "https://knb.ecoinformatics.org/#view/doi:10.5063/F1GQ6VPM",
    eml = ""
  ),
  reptiles = list(
    doi = "10.5063/F10P0WX6",
    data = "14a66a88-592e-4459-ae8a-b114165106c3",
    view = "https://knb.ecoinformatics.org/#view/doi:10.5063/F10P0WX6",
    eml = ""
  ),
  amphibians = list(
    doi = "10.5063/F1VX0DF9",
    data = "afc58110-b9c1-4cf7-b46c-837bdc930a21",
    view = "https://knb.ecoinformatics.org/#view/doi:10.5063/F1VX0DF9",
    eml = ""
  ),
  fishes = list(
    doi = "10.5063/F1R49NQB",
    data = paste0(dump_base("data"), "74f312ce-de6f-4cae-b5f7-26d4d0ffc781"),
    view = paste0(dump_base("view"), "10.5063/F1R49NQB"),
    eml = paste0(dump_base("eml"), "10.5063/F1R49NQB")
  ),
  birds = list(
    doi = "10.5063/F1MG7MDB",
    data = paste0(dump_base("data"), "cca85e21-6647-491c-aa57-89a7c552e564"),
    view = paste0(dump_base("view"), "10.5063/F1MG7MDB"),
    eml = paste0(dump_base("eml"), "10.5063/F1MG7MDB")
  )
)

dump_base <- function(x) {
  switch(x, 
         data = "https://knb.ecoinformatics.org/knb/d1/mn/v1/object/urn:uuid:",
         view = "https://knb.ecoinformatics.org/#view/doi:",
         eml = "https://knb.ecoinformatics.org/knb/d1/mn/v1/object/doi:"
  )
}
