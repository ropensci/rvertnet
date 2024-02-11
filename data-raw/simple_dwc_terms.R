simple_dwc_terms <-
  tolower(
    readLines(
      'https://raw.githubusercontent.com/tdwg/dwc/master/dist/simple_dwc_vertical.csv'))

usethis::use_data(simple_dwc_terms, overwrite = TRUE)
