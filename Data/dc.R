# dc.R
# Reads in the Darwin Core Names
# Example w/o using data(): 
#   setwd("/Users/ScottMac/rvertnet/Data")
#   dc()
#   dc()[dc()$name == 'county',] # for Darwin Core name 'county'
dc <- function() {
  read.csv("darwincore_namestypes.csv")
}