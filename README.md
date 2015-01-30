rvertnet
=======



[![Build Status](https://travis-ci.org/ropensci/rvertnet.svg?branch=master)](https://travis-ci.org/ropensci/rvertnet)

`rvertnet` is a client for interacting with [VertNet.org](http://vertnet.org/).

## Installation


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
#> [1] "2015-01-30T01:34:28.595250"
#> 
#> $response_records
#> [1] 10
#> 
#> $request_origin
#> [1] "45.523452,-122.676207"
#> 
#> $last_cursor
#> [1] "False:CuYECuACCrgC9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87L0s_M0s7N_wAA_3RtoKCZi4ygoP8AAP9dno-PmpGYlpGa_wAA_3N0bZaRm5qH_wAA_12biJz_AAD_c3Rtm5CcoJab_wAA_12cipKJ0J2WjZuMj5qclpKakYzQys_Mzsz_AAD_c3-cipKJ0J2WjZuMj5qclpKakYzQys_Mzsz_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzsvSz8zSzs3_AHRtoKCZi4ygoP8AXZ6Pj5qRmJaRmv8Ac3RtlpGbmof_AF2biJz_AHN0bZuQnKCWm_8AXZyKkonQnZaNm4yPmpyWkpqRjNDKz8zOzP8Ac3-cipKJ0J2WjZuMj5qclpKakYzQys_Mzsz_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJskbMcm_DyqEQARINRG9jdW1lbnRJbmRleBrPAShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxNC0wMy0xMiIpIChJUyAiaW5kZXhfbmFtZSIgImR3YyIpIChBTkQgKFFUICJBdmVzIiAicnRleHRfY2xhc3MiKSAoUVQgIkNhbGlmb3JuaWEiICJydGV4dF9zdGF0ZXByb3ZpbmNlIikpKToZCgwoTiBvcmRlcl9pZCkQARkAAAAAAADw_0oFCABA6Ac"
#> 
#> $limit
#> [1] 10
#> 
#> $query_version
#> [1] "feature/api:search.query():2015-01-08T19:56"
#> 
#> $matching_records
#> [1] ">10000"
#> 
#> $api_version
#> [1] "SearchAPI:2014-10-21T15:44"
```

Inspect data


```r
head(res$data[,1:5])
#>       type                   institutionid institutioncode collectioncode
#> 1 specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 2 specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 3 specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 4 specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 5 specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#> 6 specimen http://grbio.org/cool/i64g-wjcr            CUMV Bird specimens
#>       basisofrecord
#> 1 PreservedSpecimen
#> 2 PreservedSpecimen
#> 3 PreservedSpecimen
#> 4 PreservedSpecimen
#> 5 PreservedSpecimen
#> 6 PreservedSpecimen
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", state = "(wyoming OR south dakota)", limit = 20, verbose=FALSE)
head(res$data[,1:5])
#>       type                   institutionid institutioncode
#> 1 specimen http://grbio.org/cool/iakn-125z              KU
#> 2 specimen   urn:lsid:biocol.org:col:34495             MSB
#> 3 specimen   urn:lsid:biocol.org:col:34925            AMNH
#> 4 specimen   urn:lsid:biocol.org:col:35013            DMNS
#> 5 specimen   urn:lsid:biocol.org:col:35013            DMNS
#> 6 specimen   urn:lsid:biocol.org:col:35013            DMNS
#>     collectioncode
#> 1              KUM
#> 2 Mammal specimens
#> 3          Mammals
#> 4 Mammal specimens
#> 5 Mammal specimens
#> 6 Mammal specimens
#>                                                        datasetname
#> 1 University of Kansas Biodiversity Institute Mammalogy Collection
#> 2                                                             <NA>
#> 3                                                             <NA>
#> 4                                                             <NA>
#> 5                                                             <NA>
#> 6                                                             <NA>
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
head(res$data[,1:5])
#>       type                 institutionid                  collectionid
#> 1 specimen urn:lsid:biocol.org:col:34495 urn:lsid:biocol.org:col:34950
#> 2 specimen urn:lsid:biocol.org:col:34495                          <NA>
#> 3 specimen urn:lsid:biocol.org:col:34495                          <NA>
#> 4 specimen urn:lsid:biocol.org:col:34495                          <NA>
#> 5 specimen urn:lsid:biocol.org:col:34495                          <NA>
#> 6 specimen urn:lsid:biocol.org:col:34495                          <NA>
#>   institutioncode   collectioncode
#> 1             MSB   Bird specimens
#> 2             MSB Mammal specimens
#> 3             MSB Mammal specimens
#> 4             MSB Mammal specimens
#> 5             MSB Mammal specimens
#> 6             MSB Mammal specimens
```

## Contributors

* Scott Chamberlain [@sckott](https://github.com/sckott)
* Chris Ray [@Pika8tona](https://github.com/Pika8tona)
* Vijay Barve [@vijaybarve](https://github.com/vijaybarve)

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rvertnet/issues).
* License: MIT
* Get citation information for `rvertnet` in R doing `citation(package = 'rvertnet')`

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
