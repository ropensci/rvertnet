<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{rvertnet introduction}
-->



rvertnet introduction
=====================

`rvertnet` is a client for interacting with [VertNet.org](http://vertnet.org/).

## Installation

You can install the stable version from CRAN:


```r
install.packages("rvertnet")
```

Or the development version from GitHub using the `devtools` package:


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
res <- searchbyterm(class = "Aves", state = "California", limit = 10, verbose = FALSE)
```

All major functions (`searchbyterm()`, `spatialsearch()`, `vertsearch()`) give back a `meta` (for metadata, in a list) and `data` (for data, in a data.frame) slot. The metadata:


```r
res$meta
#> $request_date
#> [1] "2015-06-25T21:28:42.327820"
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

The data


```r
res$data
#> Source: local data frame [10 x 63]
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
#> Variables not shown: basisofrecord (chr), dynamicproperties (chr),
#>   occurrenceid (chr), catalognumber (chr), recordedby (chr),
#>   individualcount (chr), sex (chr), establishmentmeans (chr),
#>   occurrencestatus (chr), preparations (chr), othercatalognumbers (chr),
#>   previousidentifications (chr), eventdate (chr), startdayofyear (chr),
#>   enddayofyear (chr), year (chr), month (chr), day (chr),
#>   verbatimeventdate (chr), samplingprotocol (chr), highergeography (chr),
#>   continent (chr), country (chr), countrycode (chr), stateprovince (chr),
#>   county (chr), locality (chr), verbatimlocality (chr),
#>   locationaccordingto (chr), locationremarks (chr), decimallatitude (chr),
#>   decimallongitude (chr), geodeticdatum (chr),
#>   coordinateuncertaintyinmeters (chr), coordinateprecision (chr),
#>   verbatimcoordinates (chr), verbatimcoordinatesystem (chr),
#>   georeferencedby (chr), georeferenceddate (chr), georeferenceprotocol
#>   (chr), georeferencesources (chr), georeferenceverificationstatus (chr),
#>   identificationqualifier (chr), identifiedby (chr), dateidentified (chr),
#>   identificationverificationstatus (chr), scientificname (chr),
#>   higherclassification (chr), kingdom (chr), phylum (chr), class (chr),
#>   order (chr), family (chr), genus (chr), specificepithet (chr),
#>   infraspecificepithet (chr), taxonrank (chr), vernacularname (chr),
#>   nomenclaturalcode (chr)
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", genus = "Mustela", state = "(wyoming OR south dakota)", limit = 20, verbose = FALSE)
res$data
#> Source: local data frame [18 x 67]
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
#> Variables not shown: collectioncode (chr), datasetname (chr),
#>   basisofrecord (chr), dynamicproperties (chr), occurrenceid (chr),
#>   catalognumber (chr), recordnumber (chr), recordedby (chr),
#>   individualcount (chr), sex (chr), establishmentmeans (chr),
#>   occurrencestatus (chr), preparations (chr), othercatalognumbers (chr),
#>   occurrenceremarks (chr), previousidentifications (chr), eventdate (chr),
#>   eventtime (chr), startdayofyear (chr), enddayofyear (chr), year (chr),
#>   month (chr), day (chr), verbatimeventdate (chr), samplingprotocol (chr),
#>   eventremarks (chr), highergeography (chr), continent (chr), country
#>   (chr), countrycode (chr), stateprovince (chr), county (chr), locality
#>   (chr), verbatimlocality (chr), minimumelevationinmeters (chr),
#>   maximumelevationinmeters (chr), locationaccordingto (chr),
#>   locationremarks (chr), decimallatitude (chr), decimallongitude (chr),
#>   geodeticdatum (chr), coordinateuncertaintyinmeters (chr),
#>   verbatimcoordinates (chr), verbatimcoordinatesystem (chr),
#>   georeferencedby (chr), georeferenceddate (chr), georeferenceprotocol
#>   (chr), georeferencesources (chr), georeferenceverificationstatus (chr),
#>   identificationqualifier (chr), identifiedby (chr), dateidentified (chr),
#>   identificationverificationstatus (chr), scientificname (chr),
#>   higherclassification (chr), kingdom (chr), phylum (chr), class (chr),
#>   order (chr), family (chr), genus (chr), specificepithet (chr), taxonrank
#>   (chr), nomenclaturalcode (chr)
```

Search for class _Aves_, in the state of _Nevada_, with a coordinate uncertainty range (in meters) of less than 25 meters


```r
res <- searchbyterm(class = "Aves", stateprovince = "Nevada", error = "<25", verbose = FALSE)
res$data
#> Source: local data frame [2 x 60]
#> 
#>          type                 institutionid                  collectionid
#> 1 observation urn:lsid:biocol.org:col:34777                            NA
#> 2    specimen urn:lsid:biocol.org:col:34777 urn:lsid:biocol.org:col:34952
#> Variables not shown: institutioncode (chr), collectioncode (chr),
#>   basisofrecord (chr), dynamicproperties (chr), occurrenceid (chr),
#>   catalognumber (chr), recordnumber (chr), recordedby (chr),
#>   individualcount (chr), sex (chr), establishmentmeans (chr), preparations
#>   (chr), associatedmedia (chr), othercatalognumbers (chr),
#>   occurrenceremarks (chr), eventdate (chr), enddayofyear (chr), year
#>   (chr), month (chr), day (chr), verbatimeventdate (chr), samplingprotocol
#>   (chr), highergeography (chr), continent (chr), country (chr),
#>   stateprovince (chr), county (chr), locality (chr), verbatimlocality
#>   (chr), minimumelevationinmeters (chr), maximumelevationinmeters (chr),
#>   locationaccordingto (chr), decimallatitude (chr), decimallongitude
#>   (chr), geodeticdatum (chr), coordinateuncertaintyinmeters (chr),
#>   verbatimcoordinates (chr), verbatimcoordinatesystem (chr),
#>   georeferencedby (chr), georeferenceddate (chr), georeferenceprotocol
#>   (chr), georeferencesources (chr), georeferenceverificationstatus (chr),
#>   identificationqualifier (chr), identifiedby (chr), dateidentified (chr),
#>   identificationverificationstatus (chr), scientificname (chr),
#>   higherclassification (chr), phylum (chr), class (chr), order (chr),
#>   family (chr), genus (chr), specificepithet (chr), infraspecificepithet
#>   (chr), nomenclaturalcode (chr)
```

## Spatial search

Spatial search service allows only to search on a point defined by latitude and longitude pair, with a radius (meters) from that point. All three parameters are required. 


```r
res <- spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, verbose = FALSE)
res$data
#> Source: local data frame [10 x 62]
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
#> Variables not shown: institutioncode (chr), collectioncode (chr),
#>   basisofrecord (chr), informationwithheld (chr), dynamicproperties (chr),
#>   occurrenceid (chr), catalognumber (chr), recordnumber (chr), recordedby
#>   (chr), individualcount (chr), sex (chr), establishmentmeans (chr),
#>   preparations (chr), othercatalognumbers (chr), occurrenceremarks (chr),
#>   previousidentifications (chr), eventdate (chr), enddayofyear (chr), year
#>   (chr), month (chr), day (chr), verbatimeventdate (chr), highergeography
#>   (chr), continent (chr), country (chr), stateprovince (chr), county
#>   (chr), locality (chr), verbatimlocality (chr), minimumelevationinmeters
#>   (chr), maximumelevationinmeters (chr), locationaccordingto (chr),
#>   locationremarks (chr), decimallatitude (chr), decimallongitude (chr),
#>   geodeticdatum (chr), coordinateuncertaintyinmeters (chr),
#>   verbatimcoordinates (chr), verbatimcoordinatesystem (chr),
#>   georeferencedby (chr), georeferenceddate (chr), georeferenceprotocol
#>   (chr), georeferencesources (chr), georeferenceverificationstatus (chr),
#>   identificationqualifier (chr), identifiedby (chr), dateidentified (chr),
#>   identificationverificationstatus (chr), scientificname (chr),
#>   higherclassification (chr), kingdom (chr), phylum (chr), class (chr),
#>   order (chr), family (chr), genus (chr), specificepithet (chr),
#>   infraspecificepithet (chr), nomenclaturalcode (chr)
```

## Global full text search

`vertsearch()` provides a simple full text search against all fields. For more info see [the docs](https://github.com/VertNet/webapp/wiki/The-API-search-function#global-full-text-search). An example:


```r
res <- vertsearch(taxon = "aves", state = "california", limit = 10)
res$data
#> Source: local data frame [10 x 55]
#> 
#>        type                 institutionid institutioncode collectioncode
#> 1  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 2  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 3  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 4  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 5  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 6  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 7  specimen urn:lsid:biocol.org:col:34938            CRCM          Birds
#> 8  specimen                            NA            ANWC          Birds
#> 9  specimen                            NA            ANWC          Birds
#> 10 specimen                            NA            ANWC           Eggs
#> Variables not shown: basisofrecord (chr), dynamicproperties (chr),
#>   occurrenceid (chr), catalognumber (chr), recordedby (chr), sex (chr),
#>   establishmentmeans (chr), occurrencestatus (chr), preparations (chr),
#>   othercatalognumbers (chr), occurrenceremarks (chr), eventdate (chr),
#>   startdayofyear (chr), enddayofyear (chr), year (chr), month (chr), day
#>   (chr), verbatimeventdate (chr), highergeography (chr), continent (chr),
#>   country (chr), countrycode (chr), stateprovince (chr), county (chr),
#>   locality (chr), verbatimlocality (chr), locationremarks (chr),
#>   decimallatitude (chr), decimallongitude (chr), geodeticdatum (chr),
#>   coordinateuncertaintyinmeters (chr), coordinateprecision (chr),
#>   georeferencedby (chr), georeferenceddate (chr), georeferenceprotocol
#>   (chr), georeferencesources (chr), georeferenceverificationstatus (chr),
#>   georeferenceremarks (chr), scientificname (chr), higherclassification
#>   (chr), kingdom (chr), phylum (chr), class (chr), order (chr), family
#>   (chr), genus (chr), specificepithet (chr), infraspecificepithet (chr),
#>   taxonrank (chr), vernacularname (chr), nomenclaturalcode (chr)
```

Limit the number of records returned (under 1000)


```r
res <- vertsearch("(kansas state OR KSU)", limit = 200)
res$data
#> Source: local data frame [200 x 69]
#> 
#>        type                   institutionid
#> 1  specimen                             CAS
#> 2  specimen http://grbio.org/cool/i64g-wjcr
#> 3  specimen http://grbio.org/cool/iakn-125z
#> 4  specimen http://grbio.org/cool/iakn-125z
#> 5  specimen http://grbio.org/cool/iakn-125z
#> 6  specimen http://grbio.org/cool/iakn-125z
#> 7  specimen http://grbio.org/cool/iakn-125z
#> 8  specimen http://grbio.org/cool/iakn-125z
#> 9  specimen http://grbio.org/cool/iakn-125z
#> 10 specimen http://grbio.org/cool/iakn-125z
#> ..      ...                             ...
#> Variables not shown: collectionid (chr), institutioncode (chr),
#>   collectioncode (chr), datasetname (chr), basisofrecord (chr),
#>   dynamicproperties (chr), occurrenceid (chr), catalognumber (chr),
#>   recordnumber (chr), recordedby (chr), individualcount (chr), sex (chr),
#>   lifestage (chr), establishmentmeans (chr), occurrencestatus (chr),
#>   preparations (chr), othercatalognumbers (chr), occurrenceremarks (chr),
#>   previousidentifications (chr), fieldnumber (chr), eventdate (chr),
#>   startdayofyear (chr), enddayofyear (chr), year (chr), month (chr), day
#>   (chr), verbatimeventdate (chr), highergeography (chr), continent (chr),
#>   country (chr), countrycode (chr), stateprovince (chr), county (chr),
#>   locality (chr), verbatimlocality (chr), minimumelevationinmeters (chr),
#>   maximumelevationinmeters (chr), verbatimelevation (chr),
#>   locationaccordingto (chr), decimallatitude (chr), decimallongitude
#>   (chr), geodeticdatum (chr), coordinateuncertaintyinmeters (chr),
#>   verbatimcoordinates (chr), verbatimcoordinatesystem (chr),
#>   georeferencedby (chr), georeferenceddate (chr), georeferenceprotocol
#>   (chr), georeferencesources (chr), georeferenceverificationstatus (chr),
#>   georeferenceremarks (chr), identificationqualifier (chr), identifiedby
#>   (chr), dateidentified (chr), identificationverificationstatus (chr),
#>   scientificname (chr), higherclassification (chr), kingdom (chr), phylum
#>   (chr), class (chr), order (chr), family (chr), genus (chr),
#>   specificepithet (chr), infraspecificepithet (chr), taxonrank (chr),
#>   nomenclaturalcode (chr)
```

Pass output of `vertsearch()` to a map


```r
out <- vertsearch(tax = "(mustela nivalis OR mustela erminea)")
vertmap(out)
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-1.png) 

## Lots of data

For `searchbyterm()`, `spatialsearch()`, and `vertsearch()`, you can request more than 1000 records. VertNet limits each request to 1000 records, but internally in this package, if you request more than 1000 records, we'll continue to send requests to get all the records you want. See the [VertNet docs](https://github.com/VertNet/webapp/wiki/The-API-search-function#retrieving-large-result-sets) for more information on this.

## Email dump of data

`bigsearch()` specifies a termwise search (like `searchbyterm()`), but requests that all available records be made available for download as a tab-delimited text file.


```r
bigsearch(genus = "ochotona", rfile = "mydata", email = "you@gmail.com")
#> Processing request...
#> 
#> Download of records file 'mydata' requested for 'you@gmail.com'
#> 
#> Query/URL: "http://api.vertnet-portal.appspot.com/api/download?q=%7B%22q%22:%22genus:ochotona%22,%22n%22:%22mydata%22,%22e%22:%22you@gmail.com%22%7D"
#> 
#> Thank you! Download instructions will be sent by email.
```

## Messages

In the previous examples, we've suppressed messages for more concise output, but you can set `verbose=TRUE` to get helpful messages - `verbose=TRUE` is also the default setting so if you don't specify that parameter messages will be printed to the console. 


```r
res <- searchbyterm(class = "Aves", state = "California", limit = 10, verbose = TRUE)
```
