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
res <- searchbyterm(class = "Aves", state = "California", lim = 10, messages = FALSE)
```

Inspect metadata


```r
res$meta
#> $request_date
#> [1] "2018-04-17T06:11:10.584520"
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
#> [1] "False:Cq8FCooDCtwC9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87M0s_H0s_H_wAA_3RtoKCZi4ygoP8AAP9dno-PmpGYlpGa_wAA_3N0bZaRm5qH_wAA_12biJz_AAD_c3Rtm5CcoJab_wAA_12cnozQkI2R0IqNkdKcnouek5CY0pyejNKQjZHSzs_Pzs7_AAD_c3-cnozQkI2R0IqNkdKcnouek5CY0pyejNKQjZHSzs_Pzs7_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzszSz8fSz8f_AHRtoKCZi4ygoP8AXZ6Pj5qRmJaRmv8Ac3RtlpGbmof_AF2biJz_AHN0bZuQnKCWm_8AXZyejNCQjZHQio2R0pyei56TkJjSnJ6M0pCNkdLOz8_Ozv8Ac3-cnozQkI2R0IqNkdKcnouek5CY0pyejNKQjZHSzs_Pzs7_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJdSRwg5uy6lIQAmDOz46YAhINRG9jdW1lbnRJbmRleBruAShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxMy0wOC0wOCIpIChJUyAiaW5kZXhfbmFtZSIgImR3YyIpIChBTkQgKE9SIChRVCAiQXZlcyIgInJ0ZXh0X2NsYXNzIikgKElTICJyYXRvbV9jbGFzcyIgImF2ZXMiKSkgKFFUICJDYWxpZm9ybmlhIiAicnRleHRfc3RhdGVwcm92aW5jZSIpKSk6GQoMKE4gb3JkZXJfaWQpEAEZAAAAAAAA8P9KBQgAQOgH"
#> 
#> $query_version
#> [1] "search.py 2016-08-15T16:43+02:00"
#> 
#> $matching_records
#> [1] ">10000"
#> 
#> $api_version
#> [1] "api.py 2017-11-24T12:16-03:00"
```

Inspect data. A `dplyr` data.frame is given back, so you get a nice brief data summary:


```r
res$data[,1:5]
#> # A tibble: 10 x 5
#>    higherclassification stateprovince basisofrecord month decimallongitude
#>    <chr>                <chr>         <chr>         <chr> <chr>           
#>  1 Animalia | Chordata… California    PreservedSpe… 2     -121.7833       
#>  2 Animalia | Chordata… California    PreservedSpe… 6     -122.15         
#>  3 Animalia | Chordata… California    PreservedSpe… 5     -120.9014       
#>  4 Animalia; Chordata;… California    PreservedSpe… 1     -121.93300      
#>  5 Animalia; Chordata;… California    PreservedSpe… 1     -121.93300      
#>  6 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#>  7 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#>  8 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#>  9 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#> 10 Animalia; Chordata;… California    PreservedSpe… 6     -121.85760
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", state = "(wyoming OR south dakota)", limit = 20, messages = FALSE)
res$data[,1:5]
#> # A tibble: 19 x 5
#>    month decimallongitude startdayofyear accessrights              kingdom
#>    <chr> <chr>            <chr>          <chr>                     <chr>  
#>  1 12    -100.8276541162  336            http://vertnet.org/resou… Animal…
#>  2 03    -100.9827        64             http://vertnet.org/resou… Animal…
#>  3 1     -100.759483      1              http://www.vertnet.org/r… Animal…
#>  4 3     -100.7373        67             http://biodiversity.ku.e… Animal…
#>  5 11    <NA>             305            http://vertnet.org/resou… Animal…
#>  6 10    <NA>             282            <NA>                      Animal…
#>  7 8     <NA>             234            <NA>                      Animal…
#>  8 12    <NA>             342            <NA>                      Animal…
#>  9 12    <NA>             358            http://www.vertnet.org/r… Animal…
#> 10 1     <NA>             1              http://vertnet.org/resou… Animal…
#> 11 11    <NA>             313            <NA>                      Animal…
#> 12 9     <NA>             272            <NA>                      Animal…
#> 13 12    <NA>             335            <NA>                      Animal…
#> 14 9     <NA>             259            <NA>                      Animal…
#> 15 10    <NA>             297            <NA>                      Animal…
#> 16 12    <NA>             339            <NA>                      Animal…
#> 17 11    <NA>             305            <NA>                      Animal…
#> 18 11    <NA>             315            <NA>                      Animal…
#> 19 <NA>  <NA>             <NA>           <NA>                      Animal…
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
#> # A tibble: 23 x 2
#>    scientificname                            count
#>    <chr>                                     <int>
#>  1 Ochotona princeps                           428
#>  2 Ochotona pallasi                            129
#>  3 Ochotona princeps saxatilis                 103
#>  4 Ochotona hyperborea                          30
#>  5 Ochotona dauurica                            21
#>  6 Ochotona (Pika) princeps Richardson, 1828    20
#>  7 Ochotona collaris                            15
#>  8 Ochotona princeps figginsi                   14
#>  9 Ochotona princeps schisticeps                 6
#> 10 Ochotona princeps taylori                     5
#> # ... with 13 more rows
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
res <- spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, messages = FALSE)
res$data[,1:5]
#> # A tibble: 10 x 5
#>    month decimallongitude startdayofyear minimumelevation… accessrights   
#>    <chr> <chr>            <chr>          <chr>             <chr>          
#>  1 07    -105.68633       193            2182.368          http://vertnet…
#>  2 07    -105.705479      196            2023.872          http://vertnet…
#>  3 07    -105.705479      196            2023.872          http://vertnet…
#>  4 07    -105.705479      196            2023.872          http://vertnet…
#>  5 07    -105.705479      196            2023.872          http://vertnet…
#>  6 07    -105.705479      196            2023.872          http://vertnet…
#>  7 07    -105.705479      196            2023.872          http://vertnet…
#>  8 07    -105.705479      196            2023.872          http://vertnet…
#>  9 07    -105.705479      196            2023.872          http://vertnet…
#> 10 07    -105.705479      196            2023.872          http://vertnet…
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
