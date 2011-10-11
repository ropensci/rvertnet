# vertsearch_testing.R

vertsearch_testing <- 
# Args:
#   ...: any search terms, run dcnames() to find out available search terms
#   limit: search return limit (numeric)
# Examples:
#   vertsearch_testing("ave", "california", 10)
#   vertsearch_testing("aves", "california", 10)
# Returns:
#   dataframe of search results OR no match

function(..., limit = NA,
  url = "http://canary.vert-net.appspot.com/api/search",
  ...,
  curl = getCurlHandle()) 
{
  args <- list()
  if(!is.na(limit))
    args$limit <- limit
  temp <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- fromJSON(I(temp))
  ldply(out$records, function(x) as.data.frame(x))
}

# http://canary.vert-net.appspot.com/api/search?cl=aves&sp=california&limit=1



################################################################################
vertsearch_testing <-  
function(args = list(), 
  url = "http://canary.vert-net.appspot.com/api/search",
  ...,
  curl = getCurlHandle()) 
{
  temp <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- fromJSON(I(temp))
  ldply(out$records, function(x) as.data.frame(x))
}

# E.g.
# vertsearch_testing(list(cl = 'aves', sp = 'california', limit = 5))
# vertsearch_testing(list(y = '2008', sp = 'california', limit = 5))





################################################################################
vertsearch_testing2 <-  

function(genquery = NA, args = list(), offset = NA, bb = NA,
  url = "http://canary.vert-net.appspot.com/api/search",
  ...,
  curl = getCurlHandle()) 
{
  temp <- getForm(url,
    .params = args,
    ...,
    curl = curl)
  out <- fromJSON(I(temp))
  ldply(out$records, function(x) as.data.frame(x))
}

# E.g.
# vertsearch_testing2()