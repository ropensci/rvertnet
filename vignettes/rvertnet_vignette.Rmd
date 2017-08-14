<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{rvertnet introduction}
%\VignetteEncoding{UTF-8}
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
#> [1] "2017-08-14T22:00:59.132690"
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
#> [1] "False:Cu8GCsoECpwE9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87M0s_H0s_H_wAA_3RtoKCZi4ygoP8AAP9dno-PmpGYlpGa_wAA_3N0bZaRm5qH_wAA_12biJz_AAD_c3Rtm5CcoJab_wAA_12cipKJ0J2WjZvSjI-anJaSmpGM0JeLi4_Sno2ci5CM0puei56dnoya0pKKjJqKktKYipab0pyKkonSnZaNm9LLy87JydKMmpab0s3Mz8zMxsj_AAD_c3-cipKJ0J2WjZvSjI-anJaSmpGM0JeLi4_Sno2ci5CM0puei56dnoya0pKKjJqKktKYipab0pyKkonSnZaNm9LLy87JydKMmpab0s3Mz8zMxsj_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzszSz8fSz8f_AHRtoKCZi4ygoP8AXZ6Pj5qRmJaRmv8Ac3RtlpGbmof_AF2biJz_AHN0bZuQnKCWm_8AXZyKkonQnZaNm9KMj5qclpKakYzQl4uLj9KejZyLkIzSm56Lnp2ejJrSkoqMmoqS0piKlpvSnIqSidKdlo2b0svLzsnJ0oyalpvSzczPzMzGyP8Ac3-cipKJ0J2WjZvSjI-anJaSmpGM0JeLi4_Sno2ci5CM0puei56dnoya0pKKjJqKktKYipab0pyKkonSnZaNm9LLy87JydKMmpab0s3Mz8zMxsj_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJ4h5N-19FzJ8QAmDRs6XyARINRG9jdW1lbnRJbmRleBruAShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxMy0wOC0wOCIpIChJUyAiaW5kZXhfbmFtZSIgImR3YyIpIChBTkQgKE9SIChRVCAiQXZlcyIgInJ0ZXh0X2NsYXNzIikgKElTICJyYXRvbV9jbGFzcyIgImF2ZXMiKSkgKFFUICJDYWxpZm9ybmlhIiAicnRleHRfc3RhdGVwcm92aW5jZSIpKSk6GQoMKE4gb3JkZXJfaWQpEAEZAAAAAAAA8P9KBQgAQOgH"
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

The data


```r
res$data
#> # A tibble: 10 x 70
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
#> # ... with 67 more variables: accessrights <chr>,
#> #   bibliographiccitation <chr>, references <chr>, institutionid <chr>,
#> #   institutioncode <chr>, collectioncode <chr>, basisofrecord <chr>,
#> #   dynamicproperties <chr>, occurrenceid <chr>, catalognumber <chr>,
#> #   recordedby <chr>, individualcount <chr>, sex <chr>,
#> #   occurrencestatus <chr>, preparations <chr>, associatedmedia <chr>,
#> #   othercatalognumbers <chr>, occurrenceremarks <chr>, organismid <chr>,
#> #   previousidentifications <chr>, eventdate <chr>, startdayofyear <chr>,
#> #   enddayofyear <chr>, year <chr>, month <chr>, day <chr>,
#> #   verbatimeventdate <chr>, samplingprotocol <chr>,
#> #   highergeography <chr>, continent <chr>, country <chr>,
#> #   countrycode <chr>, stateprovince <chr>, county <chr>, locality <chr>,
#> #   verbatimlocality <chr>, locationaccordingto <chr>,
#> #   locationremarks <chr>, decimallatitude <chr>, decimallongitude <chr>,
#> #   geodeticdatum <chr>, coordinateuncertaintyinmeters <chr>,
#> #   coordinateprecision <chr>, verbatimcoordinates <chr>,
#> #   verbatimcoordinatesystem <chr>, georeferencedby <chr>,
#> #   georeferenceddate <chr>, georeferenceprotocol <chr>,
#> #   georeferencesources <chr>, georeferenceverificationstatus <chr>,
#> #   identificationqualifier <chr>, identifiedby <chr>,
#> #   dateidentified <chr>, identificationverificationstatus <chr>,
#> #   scientificname <chr>, higherclassification <chr>, kingdom <chr>,
#> #   phylum <chr>, class <chr>, order <chr>, family <chr>, genus <chr>,
#> #   specificepithet <chr>, infraspecificepithet <chr>, taxonrank <chr>,
#> #   vernacularname <chr>, nomenclaturalcode <chr>
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", genus = "Mustela", state = "(wyoming OR south dakota)", limit = 20, verbose = FALSE)
res$data
#> # A tibble: 19 x 73
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
#> # ... with 70 more variables: accessrights <chr>,
#> #   bibliographiccitation <chr>, references <chr>, institutionid <chr>,
#> #   institutioncode <chr>, collectioncode <chr>, datasetname <chr>,
#> #   basisofrecord <chr>, dynamicproperties <chr>, occurrenceid <chr>,
#> #   catalognumber <chr>, recordnumber <chr>, recordedby <chr>,
#> #   individualcount <chr>, sex <chr>, occurrencestatus <chr>,
#> #   preparations <chr>, othercatalognumbers <chr>,
#> #   occurrenceremarks <chr>, organismid <chr>,
#> #   previousidentifications <chr>, eventdate <chr>, eventtime <chr>,
#> #   startdayofyear <chr>, enddayofyear <chr>, year <chr>, month <chr>,
#> #   day <chr>, verbatimeventdate <chr>, samplingprotocol <chr>,
#> #   eventremarks <chr>, highergeography <chr>, continent <chr>,
#> #   country <chr>, countrycode <chr>, stateprovince <chr>, county <chr>,
#> #   locality <chr>, verbatimlocality <chr>,
#> #   minimumelevationinmeters <chr>, maximumelevationinmeters <chr>,
#> #   locationaccordingto <chr>, locationremarks <chr>,
#> #   decimallatitude <chr>, decimallongitude <chr>, geodeticdatum <chr>,
#> #   coordinateuncertaintyinmeters <chr>, verbatimcoordinates <chr>,
#> #   verbatimcoordinatesystem <chr>, georeferencedby <chr>,
#> #   georeferenceddate <chr>, georeferenceprotocol <chr>,
#> #   georeferencesources <chr>, georeferenceverificationstatus <chr>,
#> #   identificationqualifier <chr>, identifiedby <chr>,
#> #   dateidentified <chr>, identificationverificationstatus <chr>,
#> #   scientificname <chr>, higherclassification <chr>, kingdom <chr>,
#> #   phylum <chr>, class <chr>, order <chr>, family <chr>, genus <chr>,
#> #   specificepithet <chr>, taxonrank <chr>, vernacularname <chr>,
#> #   nomenclaturalcode <chr>
```

Search for class _Aves_, in the state of _Nevada_, with a coordinate uncertainty range (in meters) of less than 25 meters


```r
res <- searchbyterm(class = "Aves", stateprovince = "Nevada", error = "<25", verbose = FALSE)
res$data
#> # A tibble: 8 x 70
#>                modified language license
#>                   <chr>    <chr>   <chr>
#> 1 2013-01-05 17:46:29.0       en     CC0
#> 2 2015-06-22 12:58:04.0       en     CC0
#> 3 2016-05-18 11:06:12.0       en    <NA>
#> 4 2016-05-18 11:06:12.0       en    <NA>
#> 5 2016-05-18 11:06:12.0       en    <NA>
#> 6 2016-05-18 11:06:12.0       en    <NA>
#> 7 2016-05-18 11:06:12.0       en    <NA>
#> 8 2016-05-18 11:06:12.0       en    <NA>
#> # ... with 67 more variables: accessrights <chr>,
#> #   bibliographiccitation <chr>, references <chr>, institutionid <chr>,
#> #   collectionid <chr>, institutioncode <chr>, collectioncode <chr>,
#> #   basisofrecord <chr>, dynamicproperties <chr>, occurrenceid <chr>,
#> #   catalognumber <chr>, recordnumber <chr>, recordedby <chr>,
#> #   individualcount <chr>, sex <chr>, lifestage <chr>, preparations <chr>,
#> #   associatedmedia <chr>, othercatalognumbers <chr>,
#> #   occurrenceremarks <chr>, organismid <chr>,
#> #   previousidentifications <chr>, eventdate <chr>, startdayofyear <chr>,
#> #   enddayofyear <chr>, year <chr>, month <chr>, day <chr>,
#> #   verbatimeventdate <chr>, habitat <chr>, samplingprotocol <chr>,
#> #   highergeography <chr>, continent <chr>, country <chr>,
#> #   stateprovince <chr>, county <chr>, locality <chr>,
#> #   verbatimlocality <chr>, minimumelevationinmeters <chr>,
#> #   maximumelevationinmeters <chr>, locationaccordingto <chr>,
#> #   decimallatitude <chr>, decimallongitude <chr>, geodeticdatum <chr>,
#> #   coordinateuncertaintyinmeters <chr>, verbatimcoordinates <chr>,
#> #   verbatimcoordinatesystem <chr>, georeferencedby <chr>,
#> #   georeferenceddate <chr>, georeferenceprotocol <chr>,
#> #   georeferencesources <chr>, georeferenceverificationstatus <chr>,
#> #   identificationqualifier <chr>, identifiedby <chr>,
#> #   dateidentified <chr>, identificationverificationstatus <chr>,
#> #   scientificname <chr>, higherclassification <chr>, kingdom <chr>,
#> #   phylum <chr>, class <chr>, order <chr>, family <chr>, genus <chr>,
#> #   specificepithet <chr>, infraspecificepithet <chr>,
#> #   nomenclaturalcode <chr>
```

## Spatial search

Spatial search service allows only to search on a point defined by latitude and longitude pair, with a radius (meters) from that point. All three parameters are required. 


```r
res <- spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, verbose = FALSE)
res$data
#> # A tibble: 10 x 60
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
#> # ... with 57 more variables: bibliographiccitation <chr>,
#> #   references <chr>, institutionid <chr>, institutioncode <chr>,
#> #   collectioncode <chr>, basisofrecord <chr>, dynamicproperties <chr>,
#> #   occurrenceid <chr>, catalognumber <chr>, recordnumber <chr>,
#> #   recordedby <chr>, individualcount <chr>, sex <chr>,
#> #   preparations <chr>, othercatalognumbers <chr>,
#> #   occurrenceremarks <chr>, organismid <chr>,
#> #   previousidentifications <chr>, eventdate <chr>, startdayofyear <chr>,
#> #   enddayofyear <chr>, year <chr>, month <chr>, day <chr>,
#> #   verbatimeventdate <chr>, highergeography <chr>, continent <chr>,
#> #   country <chr>, stateprovince <chr>, county <chr>, locality <chr>,
#> #   verbatimlocality <chr>, minimumelevationinmeters <chr>,
#> #   maximumelevationinmeters <chr>, locationaccordingto <chr>,
#> #   decimallatitude <chr>, decimallongitude <chr>, geodeticdatum <chr>,
#> #   coordinateuncertaintyinmeters <chr>, georeferencedby <chr>,
#> #   georeferenceddate <chr>, georeferenceprotocol <chr>,
#> #   georeferencesources <chr>, georeferenceverificationstatus <chr>,
#> #   identificationqualifier <chr>, identifiedby <chr>,
#> #   identificationverificationstatus <chr>, scientificname <chr>,
#> #   higherclassification <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, specificepithet <chr>,
#> #   nomenclaturalcode <chr>
```

## Global full text search

`vertsearch()` provides a simple full text search against all fields. For more info see [the docs](https://github.com/VertNet/webapp/wiki/The-API-search-function#global-full-text-search). An example:


```r
res <- vertsearch(taxon = "aves", state = "california", limit = 10)
res$data
#> # A tibble: 10 x 60
#>      modified language license                            accessrights
#>         <chr>    <chr>   <chr>                                   <chr>
#>  1 2015-01-06       en    CCBY                                    <NA>
#>  2 2015-01-06       en    CCBY                                    <NA>
#>  3 2015-01-06       en    CCBY                                    <NA>
#>  4 2015-10-13       en     CC0 http://vertnet.org/resources/norms.html
#>  5 2015-10-13       en     CC0 http://vertnet.org/resources/norms.html
#>  6 2016-08-25       en     CC0 http://vertnet.org/resources/norms.html
#>  7 2016-08-25       en     CC0 http://vertnet.org/resources/norms.html
#>  8 2016-08-25       en     CC0 http://vertnet.org/resources/norms.html
#>  9 2016-08-25       en     CC0 http://vertnet.org/resources/norms.html
#> 10 2016-08-25       en     CC0 http://vertnet.org/resources/norms.html
#> # ... with 56 more variables: bibliographiccitation <chr>,
#> #   references <chr>, institutionid <chr>, institutioncode <chr>,
#> #   collectioncode <chr>, basisofrecord <chr>, dynamicproperties <chr>,
#> #   occurrenceid <chr>, catalognumber <chr>, recordedby <chr>, sex <chr>,
#> #   lifestage <chr>, occurrencestatus <chr>, preparations <chr>,
#> #   othercatalognumbers <chr>, occurrenceremarks <chr>, eventdate <chr>,
#> #   startdayofyear <chr>, enddayofyear <chr>, year <chr>, month <chr>,
#> #   day <chr>, verbatimeventdate <chr>, highergeography <chr>,
#> #   continent <chr>, country <chr>, countrycode <chr>,
#> #   stateprovince <chr>, county <chr>, locality <chr>,
#> #   verbatimlocality <chr>, locationremarks <chr>, decimallatitude <chr>,
#> #   decimallongitude <chr>, geodeticdatum <chr>,
#> #   coordinateuncertaintyinmeters <chr>, coordinateprecision <chr>,
#> #   georeferencedby <chr>, georeferenceddate <chr>,
#> #   georeferenceprotocol <chr>, georeferencesources <chr>,
#> #   georeferenceverificationstatus <chr>, georeferenceremarks <chr>,
#> #   scientificname <chr>, higherclassification <chr>, kingdom <chr>,
#> #   phylum <chr>, class <chr>, order <chr>, family <chr>, genus <chr>,
#> #   specificepithet <chr>, infraspecificepithet <chr>, taxonrank <chr>,
#> #   vernacularname <chr>, nomenclaturalcode <chr>
```

Limit the number of records returned (under 1000)


```r
res <- vertsearch("(kansas state OR KSU)", limit = 200)
res$data
#> # A tibble: 200 x 78
#>                 modified language license
#>                    <chr>    <chr>   <chr>
#>  1 2013-02-20 16:33:54.0       en     CC0
#>  2 2014-10-29 11:49:14.0       en   CC-BY
#>  3 2014-10-29 11:49:17.0       en   CC-BY
#>  4 2014-10-29 11:52:29.0       en   CC-BY
#>  5 2014-10-29 11:55:30.0       en   CC-BY
#>  6 2014-10-29 11:55:31.0       en   CC-BY
#>  7 2014-10-29 11:59:35.0       en   CC-BY
#>  8 2014-10-29 12:00:01.0       en   CC-BY
#>  9 2014-10-29 12:00:23.0       en   CC-BY
#> 10 2014-10-29 12:02:11.0       en   CC-BY
#> # ... with 190 more rows, and 75 more variables: accessrights <chr>,
#> #   bibliographiccitation <chr>, references <chr>, institutionid <chr>,
#> #   collectionid <chr>, institutioncode <chr>, collectioncode <chr>,
#> #   datasetname <chr>, basisofrecord <chr>, dynamicproperties <chr>,
#> #   occurrenceid <chr>, catalognumber <chr>, recordnumber <chr>,
#> #   recordedby <chr>, individualcount <chr>, sex <chr>, lifestage <chr>,
#> #   establishmentmeans <chr>, occurrencestatus <chr>, preparations <chr>,
#> #   disposition <chr>, othercatalognumbers <chr>, occurrenceremarks <chr>,
#> #   organismid <chr>, previousidentifications <chr>, fieldnumber <chr>,
#> #   eventdate <chr>, startdayofyear <chr>, enddayofyear <chr>, year <chr>,
#> #   month <chr>, day <chr>, verbatimeventdate <chr>,
#> #   samplingprotocol <chr>, highergeography <chr>, continent <chr>,
#> #   country <chr>, countrycode <chr>, stateprovince <chr>, county <chr>,
#> #   locality <chr>, verbatimlocality <chr>,
#> #   minimumelevationinmeters <chr>, maximumelevationinmeters <chr>,
#> #   locationaccordingto <chr>, decimallatitude <chr>,
#> #   decimallongitude <chr>, geodeticdatum <chr>,
#> #   coordinateuncertaintyinmeters <chr>, verbatimcoordinates <chr>,
#> #   verbatimcoordinatesystem <chr>, footprintwkt <chr>,
#> #   georeferencedby <chr>, georeferenceddate <chr>,
#> #   georeferenceprotocol <chr>, georeferencesources <chr>,
#> #   georeferenceverificationstatus <chr>, georeferenceremarks <chr>,
#> #   identificationqualifier <chr>, identifiedby <chr>,
#> #   dateidentified <chr>, identificationverificationstatus <chr>,
#> #   identificationremarks <chr>, scientificname <chr>,
#> #   higherclassification <chr>, kingdom <chr>, phylum <chr>, class <chr>,
#> #   order <chr>, family <chr>, genus <chr>, specificepithet <chr>,
#> #   infraspecificepithet <chr>, taxonrank <chr>, nomenclaturalcode <chr>
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
