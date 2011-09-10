# darwincorenames.R
# Reads in the data so that it can be loaded with data()
dcnames <- function() {
  read.csv("darwincorenames.csv")
}

# E.g., dcnames()