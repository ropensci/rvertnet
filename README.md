rvertnet
=======



[![Build Status](https://travis-ci.org/ropensci/rvertnet.svg?branch=master)](https://travis-ci.org/ropensci/rvertnet)
[![Build status](https://ci.appveyor.com/api/projects/status/duyrffhdrstu840v?svg=true)](https://ci.appveyor.com/project/sckott/rvertnet)
[![codecov.io](https://codecov.io/github/ropensci/rvertnet/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rvertnet?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/rvertnet?color=2ECC71)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/rvertnet)](https://cran.r-project.org/package=rvertnet)


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
#> [1] "2016-09-23T18:55:14.650960"
#> 
#> $response_records
#> [1] 10
#> 
#> $request_origin
#> [1] "45.523452,-122.676207"
#> 
#> $last_cursor
#> [1] "False:CqAFCuwCCr4C9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87L0s_N0s7Onv8AAP90baCgmYuMoKD_AAD_XZ6Pj5qRmJaRmv8AAP9zdG2WkZuah_8AAP9dm4ic_wAA_3N0bZuQnKCWm_8AAP9dnIqSidCdlo2b0oyPmpyWkpqRjNDKz8zPx_8AAP9zf5yKkonQnZaNm9KMj5qclpKakYzQys_Mz8f_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzsvSz83Szs6e_wB0baCgmYuMoKD_AF2ej4-akZiWkZr_AHN0bZaRm5qH_wBdm4ic_wBzdG2bkJyglpv_AF2cipKJ0J2WjZvSjI-anJaSmpGM0MrPzM_H_wBzf5yKkonQnZaNm9KMj5qclpKakYzQys_Mz8f_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJaEr43cr5mgoQAmD9lv66BBINRG9jdW1lbnRJbmRleBr9AShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxNC0wMi0xMWEiKSAoSVMgImluZGV4X25hbWUiICJkd2MiKSAoQU5EIChRVCAiQXZlcyIgInJ0ZXh0X2NsYXNzIikgKE9SIChJUyAicmF0b21fc3RhdGVwcm92aW5jZSIgImNhbGlmb3JuaWEiKSAoUVQgIkNhbGlmb3JuaWEiICJydGV4dF9zdGF0ZXByb3ZpbmNlIikpKSk6GQoMKE4gb3JkZXJfaWQpEAEZAAAAAAAA8P9KBQgAQOgH"
#> 
#> $limit
#> [1] 10
#> 
#> $query_version
#> [1] "search.py 2015-08-29T21:04:44+02:00"
#> 
#> $matching_records
#> [1] ">10000"
#> 
#> $api_version
#> [1] "api.py 2015-09-02T11:09:38+02:00"
```

Inspect data. A `dplyr` data.frame is given back, so you get a nice brief data summary:


```r
res$data[,1:5]
#> # A tibble: 10 × 5
#>                 modified language                            accessrights
#>                    <chr>    <chr>                                   <chr>
#> 1             2015-01-06       en                                    <NA>
#> 2             2015-01-06       en                                    <NA>
#> 3  2015-05-11 07:55:08.0       en http://vertnet.org/resources/norms.html
#> 4  2015-05-11 07:55:08.0       en http://vertnet.org/resources/norms.html
#> 5  2015-08-26 13:10:07.0       en http://vertnet.org/resources/norms.html
#> 6  2015-08-26 13:10:07.0       en http://vertnet.org/resources/norms.html
#> 7  2015-08-26 13:10:07.0       en http://vertnet.org/resources/norms.html
#> 8  2015-08-26 13:10:07.0       en http://vertnet.org/resources/norms.html
#> 9  2015-08-26 13:10:07.0       en http://vertnet.org/resources/norms.html
#> 10 2015-08-26 13:10:07.0       en http://vertnet.org/resources/norms.html
#> # ... with 2 more variables: references <chr>, institutionid <chr>
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", state = "(wyoming OR south dakota)", limit = 20, verbose = FALSE)
res$data[,1:5]
#> # A tibble: 19 × 5
#>                 modified language
#>                    <chr>    <chr>
#> 1  2010-01-14 13:06:23.0       en
#> 2  2011-11-17 12:02:57.0       en
#> 3             2013-08-07       en
#> 4  2015-04-14 15:45:27.0       en
#> 5  2015-04-17 17:39:57.0       en
#> 6  2015-08-18 10:24:17.0       en
#> 7             2016-06-02       en
#> 8                   <NA>     <NA>
#> 9                   <NA>     <NA>
#> 10                  <NA>     <NA>
#> 11                  <NA>     <NA>
#> 12                  <NA>     <NA>
#> 13                  <NA>     <NA>
#> 14                  <NA>     <NA>
#> 15                  <NA>     <NA>
#> 16                  <NA>     <NA>
#> 17                  <NA>     <NA>
#> 18                  <NA>     <NA>
#> 19                  <NA>     <NA>
#> # ... with 3 more variables: accessrights <chr>, references <chr>,
#> #   institutionid <chr>
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
#> # A tibble: 25 × 2
#>                   scientificname count
#>                            <chr> <int>
#> 1              Ochotona princeps   287
#> 2    Ochotona princeps saxatilis   169
#> 3               Ochotona pallasi   114
#> 4        Ochotona princeps muiri   107
#> 5            Ochotona hyperborea    30
#> 6     Ochotona princeps figginsi    18
#> 7              Ochotona dauurica    14
#> 8     Ochotona princeps princeps     9
#> 9  Ochotona princeps brunnescens     8
#> 10      Ochotona princeps cuppes     8
#> # ... with 15 more rows
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
#> # A tibble: 10 × 5
#>                 modified language
#>                    <chr>    <chr>
#> 1  2013-09-10 12:55:00.0       en
#> 2  2013-09-10 12:55:00.0       en
#> 3  2013-09-10 12:55:00.0       en
#> 4  2014-01-14 16:04:11.0       en
#> 5  2014-06-03 17:37:34.0       en
#> 6  2014-09-09 14:04:14.0       en
#> 7  2014-09-09 14:04:14.0       en
#> 8  2015-08-03 19:48:08.0       en
#> 9  2015-09-08 00:33:35.0       en
#> 10                  <NA>       en
#> # ... with 3 more variables: accessrights <chr>, references <chr>,
#> #   institutionid <chr>
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
