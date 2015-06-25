rvertnet
=======



[![Build Status](https://travis-ci.org/ropensci/rvertnet.svg?branch=master)](https://travis-ci.org/ropensci/rvertnet)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/rvertnet?color=2ECC71)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/rvertnet)](http://cran.rstudio.com/web/packages/rvertnet)


`rvertnet` is a client for interacting with [VertNet.org](http://vertnet.org/).

VertNet.org API docs: [github.com/VertNet/webapp/wiki/The-API-search-function](https://github.com/VertNet/webapp/wiki/The-API-search-function)

## Installation

Stable CRAN version


```r
install.packages("rvertnet")
```

Or development version from GitHub


```r
install.packages("devtools")
devtools::install_github("ropensci/rvertnet")
```


```r
library('rvertnet')
```

## Search by term

Search for _Aves_ in the state of _California_, limit to 10 records


```r
res <- searchbyterm(class = "Aves", state = "California", lim = 10, verbose = FALSE)
```

Inspect metadata


```r
res$meta
#> $request_date
#> [1] "2015-06-25T22:39:55.663390"
#> 
#> $response_records
#> [1] 10
#> 
#> $request_origin
#> [1] "44.983334,-93.266670"
#> 
#> $last_cursor
#> [1] "False:CuYECuACCrgC9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87L0s_M0s7N_wAA_3RtoKCZi4ygoP8AAP9dno-PmpGYlpGa_wAA_3N0bZaRm5qH_wAA_12biJz_AAD_c3Rtm5CcoJab_wAA_12cipKJ0J2WjZuMj5qclpKakYzQys_Mzsz_AAD_c3-cipKJ0J2WjZuMj5qclpKakYzQys_Mzsz_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzsvSz8zSzs3_AHRtoKCZi4ygoP8AXZ6Pj5qRmJaRmv8Ac3RtlpGbmof_AF2biJz_AHN0bZuQnKCWm_8AXZyKkonQnZaNm4yPmpyWkpqRjNDKz8zOzP8Ac3-cipKJ0J2WjZuMj5qclpKakYzQys_Mzsz_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJskbMcm_DyqEQARINRG9jdW1lbnRJbmRleBrPAShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxNC0wMy0xMiIpIChJUyAiaW5kZXhfbmFtZSIgImR3YyIpIChBTkQgKFFUICJBdmVzIiAicnRleHRfY2xhc3MiKSAoUVQgIkNhbGlmb3JuaWEiICJydGV4dF9zdGF0ZXByb3ZpbmNlIikpKToZCgwoTiBvcmRlcl9pZCkQARkAAAAAAADw_0oFCABA6Ac"
#> 
#> $limit
#> [1] 10
#> 
#> $query_version
#> [1] "feature/api:search.query():2015-01-26T11:29"
#> 
#> $matching_records
#> [1] ">10000"
#> 
#> $api_version
#> [1] "SearchAPI:2015-01-26T11:29"
```

Inspect data. A `dplyr` data.frame is given back, so you get a nice brief data summary:


```r
res$data[,1:5]
#> Source: local data frame [10 x 5]
#> 
#>        type                   institutionid institutioncode collectioncode
#> 1  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 2  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 3  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 4  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 5  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 6  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 7  specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 8  specimen                              NA            ANWC          Birds
#> 9  specimen                              NA            ANWC          Birds
#> 10 specimen                              NA            ANWC           Eggs
#> Variables not shown: basisofrecord (chr)
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", state = "(wyoming OR south dakota)", limit = 20, verbose = FALSE)
res$data[,1:5]
#> Source: local data frame [18 x 5]
#> 
#>        type                   institutionid institutioncode
#> 1  specimen http://grbio.org/cool/iakn-125z              KU
#> 2  specimen   urn:lsid:biocol.org:col:34495             MSB
#> 3  specimen   urn:lsid:biocol.org:col:34925            AMNH
#> 4  specimen   urn:lsid:biocol.org:col:35013            DMNS
#> 5  specimen   urn:lsid:biocol.org:col:35013            DMNS
#> 6  specimen   urn:lsid:biocol.org:col:35013            DMNS
#> 7  specimen                              NA            USNM
#> 8  specimen                              NA            USNM
#> 9  specimen                              NA            USNM
#> 10 specimen                              NA            USNM
#> 11 specimen                              NA            USNM
#> 12 specimen                              NA            USNM
#> 13 specimen                              NA            USNM
#> 14 specimen                              NA            USNM
#> 15 specimen                              NA            USNM
#> 16 specimen                              NA            USNM
#> 17 specimen                              NA            USNM
#> 18 specimen                              NA            USNM
#> Variables not shown: collectioncode (chr), datasetname (chr)
```

### dplyr downstream

You can pass the data object directly on to `dplyr` functions. Here, we get a table of record counts by species in descending order.


```r
library("dplyr")
out <- searchbyterm(genus = "Ochotona", limit = 800)
out$data %>%
  group_by(scientificname) %>%
  summarise(count = length(scientificname)) %>%
  arrange(desc(count))
#> Source: local data frame [29 x 2]
#> 
#>                   scientificname count
#> 1              Ochotona princeps   271
#> 2    Ochotona princeps saxatilis   146
#> 3        Ochotona princeps muiri   135
#> 4               Ochotona pallasi   112
#> 5            Ochotona hyperborea    20
#> 6       Ochotona princeps albata    19
#> 7              Ochotona dauurica    16
#> 8     Ochotona princeps figginsi    14
#> 9     Ochotona princeps princeps    10
#> 10 Ochotona princeps brunnescens     9
#> ..                           ...   ...
```


## Big data

Specifies a termwise search (like `searchbyterm()`), but requests that all available records be made available for download as a tab-delimited text file.


```r
bigsearch(genus = "ochotona", rf = "pikaRecords", email = "big@@search.luv")
#> Processing request...
#>
#> Download of records file 'mydata' requested for 'you@gmail.com'
#>
#> Query/URL: "http://api.vertnet-portal.appspot.com/api/download?q=%7B%22q%22:%22genus:ochotona%22,%22n%22:%22mydata%22,%22e%22:%22you@gmail.com%22%7D"
#>
#> Thank you! Download instructions will be sent by email.
```

## Spatial search


```r
res <- spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, verbose = FALSE)
res$data[,1:5]
#> Source: local data frame [10 x 5]
#> 
#>        type                 institutionid                  collectionid
#> 1  specimen urn:lsid:biocol.org:col:34495 urn:lsid:biocol.org:col:34950
#> 2  specimen urn:lsid:biocol.org:col:34495                            NA
#> 3  specimen urn:lsid:biocol.org:col:34495                            NA
#> 4  specimen urn:lsid:biocol.org:col:34495                            NA
#> 5  specimen urn:lsid:biocol.org:col:34495                            NA
#> 6  specimen urn:lsid:biocol.org:col:34495                            NA
#> 7  specimen urn:lsid:biocol.org:col:34777 urn:lsid:biocol.org:col:34904
#> 8  specimen urn:lsid:biocol.org:col:34777 urn:lsid:biocol.org:col:34904
#> 9  specimen urn:lsid:biocol.org:col:34777 urn:lsid:biocol.org:col:34904
#> 10 specimen urn:lsid:biocol.org:col:34777 urn:lsid:biocol.org:col:34904
#> Variables not shown: institutioncode (chr), collectioncode (chr)
```

## Contributors

* Scott Chamberlain [@sckott](https://github.com/sckott)
* Chris Ray [@Pika8tona](https://github.com/Pika8tona)
* Vijay Barve [@vijaybarve](https://github.com/vijaybarve)

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rvertnet/issues).
* License: MIT
* Get citation information for `rvertnet` in R doing `citation(package = 'rvertnet')`

[![ropensci_footer](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
