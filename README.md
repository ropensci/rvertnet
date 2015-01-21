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
head(res[,1:5])
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
head(res[,1:5])
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
head(res[,1:5])
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
