rvertnet
=======



`rvertnet` allows users to search over many taxonomic data sources for species names (scientific and common) and download up and downstream taxonomic hierarchical information - among other things.

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
#>       type                                   institutionid
#> 1 specimen http://biocol.org/urn:lsid:biocol.org:col:34940
#> 2 specimen http://biocol.org/urn:lsid:biocol.org:col:34940
#> 3 specimen http://biocol.org/urn:lsid:biocol.org:col:34940
#> 4 specimen http://biocol.org/urn:lsid:biocol.org:col:34940
#> 5 specimen http://biocol.org/urn:lsid:biocol.org:col:34940
#> 6 specimen http://biocol.org/urn:lsid:biocol.org:col:34940
#>                      collectionid institutioncode collectioncode
#> 1 http://grbio.org/cool/ywsm-eq6q            DMNH           Bird
#> 2 http://grbio.org/cool/ywsm-eq6q            DMNH           Bird
#> 3 http://grbio.org/cool/ywsm-eq6q            DMNH           Bird
#> 4 http://grbio.org/cool/ywsm-eq6q            DMNH           Bird
#> 5 http://grbio.org/cool/ywsm-eq6q            DMNH           Bird
#> 6 http://grbio.org/cool/ywsm-eq6q            DMNH           Bird
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "mustela nigripes", state = "(wyoming OR south dakota)", limit = 20, verbose=FALSE)
head(res[,1:5])
#>       type                 institutionid institutioncode collectioncode
#> 1 specimen urn:lsid:biocol.org:col:34495             MSB    MSB Mammals
#> 2 specimen urn:lsid:biocol.org:col:35013            DMNS   DMNS Mammals
#> 3 specimen urn:lsid:biocol.org:col:35013            DMNS   DMNS Mammals
#> 4 specimen urn:lsid:biocol.org:col:35013            DMNS   DMNS Mammals
#>       basisofrecord
#> 1 PreservedSpecimen
#> 2 PreservedSpecimen
#> 3 PreservedSpecimen
#> 4 PreservedSpecimen
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
#>   institutioncode collectioncode
#> 1             MSB      MSB Birds
#> 2             MSB    MSB Mammals
#> 3             MSB    MSB Mammals
#> 4             MSB    MSB Mammals
#> 5             MSB    MSB Mammals
#> 6             MSB    MSB Mammals
```

## Meta

* Please [report any issues or bugs](https://github.com/ropensci/rvertnet/issues).
* License: MIT
* Get citation information for `rvertnet` in R doing `citation(package = 'rvertnet')`

[![ropensci](http://ropensci.org/public_images/github_footer.png)](http://ropensci.org)
