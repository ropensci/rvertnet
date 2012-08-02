# dcdatatypes.R
# Reads in the Darwin Core data types
# Example w/o using data():
#   setwd("/Users/ScottMac/rvertnet/Data")
#   dcdatatypes()
dcdatatypes <- function() {
  out <- read.csv("darwincore_datatypes.csv")
}