#' Make a simple map to visualize VertNet data.
#' 
#' Basic function to plot your lat/long data on a map.
#' 
#' @import ggplot2 maps
#' @param input A data.frame, e.g. from calling vertoccurrence. The data.frame
#' 		has to have columns named "Latitude" and "Longitude".
#' @param mapdatabase The map database to use in mapping. What you choose here 
#' 		determines what you can choose in the region parameter. One of: county, 
#' 		state, usa, world, world2, france, italy, or nz. 
#' @param region The region of the world to map. From the maps package, run 
#' 		\code{sort(unique(map_data("world")$region))} to see region names for the
#' 		world database layer, or e.g., \code{sort(unique(map_data("state")$region))}
#' 		for the state layer.
#' @param geom The geom to use, one of geom_point or geom_jitter. Don't 
#' 		quote them. 
#' @param jitter If you use jitter, the amount by which to jitter points in width, 
#' 		height, or both. 
#' @return Map (using ggplot2 package) of points on a world map.
#' @details vertmap Takes care of cleaning up the data.frame (removing NA's, etc.) 
#' 		returned from other rvernet functions, and creating the map. This function
#' 		gives a simple map of your data.  You can look at the code behing the 
#' 		function itself if you want to build on it to make a map according 
#' 		to your specfications.
#' @examples \dontrun{
#' # example 1
#' out <- vertoccurrence(t="Junco hyemalis", grp="bird", num=100)
#' vertmap(input = out) # make a map using vertmap
#' 
#' # example 2
#' out <- vertoccurrence(q="larva",num=100)
#' vertmap(input = out) # make a map using vertmap
#' 
#' # Many species
#' splist <- splist <- c("Accipiter erythronemius", "Junco hyemalis", "Aix sponsa", "Haliaeetus leucocephalus",
#' 		"Corvus corone", "Threskiornis molucca", "Merops malimbicus")
#' out <- lapply(splist, function(x) vertoccurrence(t=x, grp="bird", num=500))
#' vertmap(out)
#' }
#' @export
vertmap <- function(input = NULL, mapdatabase = "world", region = ".", geom = geom_point, jitter = NULL)
{
	if(is(input, "list"))
		input <- ldply(input, data.frame)
		
	if(inherits(input$Latitude, "NULL")){
		stop("need columns named 'Latitude' and 'Longitude'")} else {NULL}
	if(inherits(input$Longitude, "NULL")){
		stop("need columns named 'Latitude' and 'Longitude'")} else {NULL}
	
	tomap <- input[complete.cases(input$Latitude, input$Longitude), ]
	tomap <- input[-(which(tomap$Latitude <=90 || tomap$Longitude <=180)), ]
	world <- map_data(map=mapdatabase, region=region) # get world map data	
	world <- map_data("world") # get world map data
	message(paste("Rendering map...plotting ", nrow(tomap), " points", sep=""))
	ggplot(world, aes(long, lat)) + # make the plot
		geom_polygon(aes(group=group), fill="white", color="gray40", size=0.2) +
		geom(data=tomap, aes(Longitude, Latitude, colour=spqueried), 
				 alpha=0.4, size=3, position=jitter) +
		labs(x="", y="") +
		theme_bw(base_size=14)
}