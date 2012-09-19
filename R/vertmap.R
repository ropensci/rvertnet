#' Make a simple map to visualize VertNet data.
#' 
#' Basic function to plot your lat/long data on a map.
#' 
#' @import ggplot2 maps
#' @param input A data.frame, e.g. from calling vertoccurrence. The data.frame
#' 		has to have columns named "Latitude" and "Longitude".
#' @return Map (using ggplot2 package) of points on a world map.
#' @details vertmap takes care of cleaning up the data.frame (removing NA's, etc.) 
#' 		returned from other rvernet functions, and creating the map. This function
#' 		gives a simple map of your data.  You can look at the code behing the 
#' 		function itself if you want to build on it to make a map according 
#' 		to your specfications.
#' @examples \dontrun{
#' # example 1
#' out <- vertoccurrence(t="Aquila", num=100) # get some data on golden 
#' vertmap(input = out) # make a map using vertmap
#' 
#' # example 2
#' out <- vertoccurrence(q="larva",num=100) # get some data
#' vertmap(input = out) # make a map using vertmap
#' }
#' @export
vertmap <- function(input = NULL)
{
	if(inherits(input, "NULL")){stop("Please provide a data.frame")} else {NULL}
	if(inherits(input$Latitude, "NULL")){
		stop("need columns named 'Latitude' and 'Longitude'")} else {NULL}
	if(inherits(input$Longitude, "NULL")){
		stop("need columns named 'Latitude' and 'Longitude'")} else {NULL}
	input_ <- input[!is.na(input$Latitude) & !is.na(input$Longitude),] # remove NA's
	input_ <- input_[abs(input_$Latitude) <= 90, ] # remove impossible values of lat
	input_ <- input_[abs(input_$Longitude) <= 180, ] # remove impossible values of long
	world <- map_data("world") # get world map data
	message(paste("Rendering map...plotting ", nrow(input_), " points", sep=""))
	ggplot(world, aes(long, lat)) + # make the plot
		geom_polygon(aes(group=group), fill="white", color="gray40", size=0.2) +
		geom_jitter(data=input_, aes(Longitude, Latitude), alpha=0.6, size=3, colour="darkblue") +
		labs(x="", y="") +
		theme_bw(base_size=14)
}