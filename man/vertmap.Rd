\name{vertmap}
\alias{vertmap}
\title{Make a simple map to visualize VertNet data.}
\usage{
  vertmap(input = NULL)
}
\arguments{
  \item{input}{A data.frame, e.g. from calling
  vertoccurrence. The data.frame has to have columns named
  "Latitude" and "Longitude".}
}
\value{
  Map (using ggplot2 package) of points on a world map.
}
\description{
  Basic function to plot your lat/long data on a map.
}
\details{
  vertmap Takes care of cleaning up the data.frame
  (removing NA's, etc.)  returned from other rvernet
  functions, and creating the map. This function gives a
  simple map of your data.  You can look at the code behing
  the function itself if you want to build on it to make a
  map according to your specfications.
}
\examples{
\dontrun{
# example 1
out <- vertoccurrence(t="Aquila", num=100) # get some data on golden
vertmap(input = out) # make a map using vertmap

# example 2
out <- vertoccurrence(q="larva",num=100) # get some data
vertmap(input = out) # make a map using vertmap
}
}

