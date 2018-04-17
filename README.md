rvertnet
=======



[![Build Status](https://travis-ci.org/ropensci/rvertnet.svg?branch=master)](https://travis-ci.org/ropensci/rvertnet)
[![Build status](https://ci.appveyor.com/api/projects/status/duyrffhdrstu840v?svg=true)](https://ci.appveyor.com/project/sckott/rvertnet)
[![codecov.io](https://codecov.io/github/ropensci/rvertnet/coverage.svg?branch=master)](https://codecov.io/github/ropensci/rvertnet?branch=master)
[![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/rvertnet?color=2ECC71)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/rvertnet)](https://cran.r-project.org/package=rvertnet)


`rvertnet` is a client for interacting with [VertNet.org](http://vertnet.org/).

VertNet.org API docs: <https://github.com/VertNet/webapp/wiki/The-API-search-function>

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
#> [1] "2017-08-14T21:55:09.833740"
#>
#> $response_records
#> [1] 10
#>
#> $submitted_query
#> [1] "class:Aves stateprovince:California"
#>
#> $request_origin
#> [1] "45.523452,-122.676207"
#>
#> $limit
#> [1] 10
#>
#> $last_cursor
#> [1] "False:Cu8GCsoECpwE9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87M0s_H0s_H_wAA_3RtoKCZi4ygoP8AAP9dno-PmpGYlpGa_wAA_3N0bZaRm5qH_wAA_12biJz_AAD_c3Rtm5CcoJab_wAA_12cipKJ0J2WjZvSjI-anJaSmpGM0JeLi4_Sno2ci5CM0puei56dnoya0pKKjJqKktKYipab0pyKkonSnZaNm9LLy87JydKMmpab0s3Mz8zMxsj_AAD_c3-cipKJ0J2WjZvSjI-anJaSmpGM0JeLi4_Sno2ci5CM0puei56dnoya0pKKjJqKktKYipab0pyKkonSnZaNm9LLy87JydKMmpab0s3Mz8zMxsj_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzszSz8fSz8f_AHRtoKCZi4ygoP8AXZ6Pj5qRmJaRmv8Ac3RtlpGbmof_AF2biJz_AHN0bZuQnKCWm_8AXZyKkonQnZaNm9KMj5qclpKakYzQl4uLj9KejZyLkIzSm56Lnp2ejJrSkoqMmoqS0piKlpvSnIqSidKdlo2b0svLzsnJ0oyalpvSzczPzMzGyP8Ac3-cipKJ0J2WjZvSjI-anJaSmpGM0JeLi4_Sno2ci5CM0puei56dnoya0pKKjJqKktKYipab0pyKkonSnZaNm9LLy87JydKMmpab0s3Mz8zMxsj_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJ4h5N-19FzJ8QAmDc4-iNBRINRG9jdW1lbnRJbmRleBruAShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxMy0wOC0wOCIpIChJUyAiaW5kZXhfbmFtZSIgImR3YyIpIChBTkQgKE9SIChRVCAiQXZlcyIgInJ0ZXh0X2NsYXNzIikgKElTICJyYXRvbV9jbGFzcyIgImF2ZXMiKSkgKFFUICJDYWxpZm9ybmlhIiAicnRleHRfc3RhdGVwcm92aW5jZSIpKSk6GQoMKE4gb3JkZXJfaWQpEAEZAAAAAAAA8P9KBQgAQOgH"
#>
#> $query_version
#> [1] "search.py 2016-08-15T16:43+02:00"
#>
#> $matching_records
#> [1] ">10000"
#>
#> $api_version
#> [1] "api.py 2017-01-12T20:08-03:00"
```

Inspect data. A `dplyr` data.frame is given back, so you get a nice brief data summary:


```r
res$data[,1:5]
#> # A tibble: 10 x 5
#>                 modified language license
#>                    <chr>    <chr>   <chr>
#>  1            2015-01-06       en    CCBY
#>  2            2015-01-06       en    CCBY
#>  3            2015-01-06       en    CCBY
#>  4 2015-08-26 13:10:07.0       en     CC0
#>  5 2015-08-26 13:10:07.0       en     CC0
#>  6 2015-08-26 13:10:07.0       en     CC0
#>  7 2015-08-26 13:10:07.0       en     CC0
#>  8 2016-05-18 09:27:29.0       en     CC0
#>  9 2016-05-18 09:27:29.0       en     CC0
#> 10 2016-05-18 09:27:29.0       en     CC0
#> # ... with 2 more variables: accessrights <chr>,
#> #   bibliographiccitation <chr>
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", state = "(wyoming OR south dakota)", limit = 20, verbose = FALSE)
res$data[,1:5]
#> # A tibble: 19 x 5
#>                 modified language license
#>                    <chr>    <chr>   <chr>
#>  1 2010-01-14 13:06:23.0       en   CC-BY
#>  2 2011-11-17 12:02:57.0       en     CC0
#>  3            2013-08-07       en    <NA>
#>  4 2015-11-23 09:17:09.0       en     CC0
#>  5 2016-02-01 17:40:23.0       en     CC0
#>  6 2016-04-12 00:24:00.0       en     CC0
#>  7            2016-11-15       en     CC0
#>  8                  <NA>     <NA>     CC0
#>  9                  <NA>     <NA>     CC0
#> 10                  <NA>     <NA>     CC0
#> 11                  <NA>     <NA>     CC0
#> 12                  <NA>     <NA>     CC0
#> 13                  <NA>     <NA>     CC0
#> 14                  <NA>     <NA>     CC0
#> 15                  <NA>     <NA>     CC0
#> 16                  <NA>     <NA>     CC0
#> 17                  <NA>     <NA>     CC0
#> 18                  <NA>     <NA>     CC0
#> 19                  <NA>     <NA>     CC0
#> # ... with 2 more variables: accessrights <chr>,
#> #   bibliographiccitation <chr>
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
#> # A tibble: 28 x 2
#>                               scientificname count
#>                                        <chr> <int>
#>  1                         Ochotona princeps   284
#>  2               Ochotona princeps saxatilis   202
#>  3                          Ochotona pallasi   132
#>  4                   Ochotona princeps muiri    43
#>  5                       Ochotona hyperborea    39
#>  6                         Ochotona dauurica    21
#>  7 Ochotona (Pika) princeps Richardson, 1828    20
#>  8                Ochotona princeps figginsi    13
#>  9              Ochotona princeps nevadensis     8
#> 10                           Ochotona alpina     4
#> # ... with 18 more rows
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
#> # A tibble: 10 x 5
#>                 modified language                            accessrights
#>                    <chr>    <chr>                                   <chr>
#>  1 2014-09-09 14:04:14.0       en http://vertnet.org/resources/norms.html
#>  2 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  3 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  4 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  5 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  6 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  7 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  8 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#>  9 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#> 10 2015-08-03 19:48:08.0       en http://vertnet.org/resources/norms.html
#> # ... with 2 more variables: bibliographiccitation <chr>, references <chr>
```

## Contributors

* Scott Chamberlain [@sckott](https://github.com/sckott)
* Chris Ray [@Pika8tona](https://github.com/Pika8tona)
* Vijay Barve [@vijaybarve](https://github.com/vijaybarve)

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rvertnet/issues).
* License: MIT
* Get citation information for `rvertnet` in R doing `citation(package = 'rvertnet')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
