# Wrapper function is called from vertoccurrence, vertlocations, vertproviders and verttaxa
vertwrapper <- function(fxn = "", key = "r_B68F3", grp = "fish",  t = NULL, 
	l = NULL, c = NULL, d = NULL, q = NULL, p = NULL, m = NULL, cols = NULL,
	num = NULL, set = NULL,url = NULL)
{
	if(is.na(pmatch(grp, c("bird", "herp", "fish")))){
		message("Group has to be Bird, Herp or Fish")
		return(NULL)
	}
	url <- c(
		bird = paste("http://ornis2.ornisnet.org/api/v1/",fxn,"/",sep = ""),
		herp = paste("http://herpnet2.org/api/v1/",fxn,"/",sep = ""),
		fish = paste("http://www.fishnet2.net/api/v1/",fxn,"/",sep = "")
	)[grp]
	query <- as.list(c(api = key, t = t, l = l, c = c, d = d, q = q, p = p,
										 m = m, cols = cols, num = num, set = set))
	# must only use HTTP 1, HTTP 1.1 not working
	resp <- GET(url = url, query = query, config(http.version = 1L))
	stop_for_status(resp)
	out <- read.csv(text = content(resp))
	if (nrow(out) == 0){
		out <- NULL
		message("No records found")
	}
	out
}