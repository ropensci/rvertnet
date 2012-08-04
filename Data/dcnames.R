# dcnames.R
# Reads in the Darwin Core Names
# Example w/o using data(): 
#   setwd("/Users/ScottMac/rvertnet/Data")
#   dcnames()
dcnames <- function() {
  read.csv("darwincorenames.csv")
}