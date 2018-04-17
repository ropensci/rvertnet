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
res <- searchbyterm(class = "Aves", state = "California", limit = 10, messages = FALSE)
```

All major functions (`searchbyterm()`, `spatialsearch()`, `vertsearch()`) give back a `meta` (for metadata, in a list) and `data` (for data, in a data.frame) slot. The metadata:


```r
res$meta
#> $request_date
#> [1] "2018-04-17T06:14:32.384580"
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
#> [1] "False:Cq8FCooDCtwC9wAAABn_____jIGJmo2LkZqL0o-QjYuek96WkZuah9LNz87M0s_H0s_H_wAA_3RtoKCZi4ygoP8AAP9dno-PmpGYlpGa_wAA_3N0bZaRm5qH_wAA_12biJz_AAD_c3Rtm5CcoJab_wAA_12cnozQkI2R0IqNkdKcnouek5CY0pyejNKQjZHSzs_Pzs7_AAD_c3-cnozQkI2R0IqNkdKcnouek5CY0pyejNKQjZHSzs_Pzs7_AAD__wD-__6MgYmajYuRmovSj5CNi56T3paRm5qH0s3PzszSz8fSz8f_AHRtoKCZi4ygoP8AXZ6Pj5qRmJaRmv8Ac3RtlpGbmof_AF2biJz_AHN0bZuQnKCWm_8AXZyejNCQjZHQio2R0pyei56TkJjSnJ6M0pCNkdLOz8_Ozv8Ac3-cnozQkI2R0IqNkdKcnouek5CY0pyejNKQjZHSzs_Pzs7_AP_-EAohBN0EkB08Gxk5AAAAAOb___9IClAAWgsJdSRwg5uy6lIQAmDd8uOABxINRG9jdW1lbnRJbmRleBruAShBTkQgKElTICJjdXN0b21lcl9uYW1lIiAiYXBwZW5naW5lIikgKElTICJncm91cF9uYW1lIiAic352ZXJ0bmV0LXBvcnRhbCIpIChJUyAibmFtZXNwYWNlIiAiaW5kZXgtMjAxMy0wOC0wOCIpIChJUyAiaW5kZXhfbmFtZSIgImR3YyIpIChBTkQgKE9SIChRVCAiQXZlcyIgInJ0ZXh0X2NsYXNzIikgKElTICJyYXRvbV9jbGFzcyIgImF2ZXMiKSkgKFFUICJDYWxpZm9ybmlhIiAicnRleHRfc3RhdGVwcm92aW5jZSIpKSk6GQoMKE4gb3JkZXJfaWQpEAEZAAAAAAAA8P9KBQgAQOgH"
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

The data


```r
res$data
#> # A tibble: 10 x 57
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
#> # ... with 52 more variables: phylum <chr>, references <chr>, year <chr>,
#> #   startdayofyear <chr>, taxonrank <chr>, specificepithet <chr>,
#> #   bibliographiccitation <chr>, family <chr>, countrycode <chr>,
#> #   geodeticdatum <chr>, coordinateuncertaintyinmeters <chr>,
#> #   highergeography <chr>, continent <chr>, verbatimlocality <chr>,
#> #   day <chr>, kingdom <chr>, collectioncode <chr>,
#> #   occurrencestatus <chr>, coordinateprecision <chr>,
#> #   institutioncode <chr>, scientificname <chr>, locality <chr>,
#> #   class <chr>, vernacularname <chr>, county <chr>,
#> #   decimallatitude <chr>, occurrenceid <chr>, language <chr>,
#> #   license <chr>, country <chr>, georeferenceverificationstatus <chr>,
#> #   modified <chr>, eventdate <chr>, nomenclaturalcode <chr>,
#> #   verbatimeventdate <chr>, genus <chr>, order <chr>,
#> #   catalognumber <chr>, enddayofyear <chr>, locationremarks <chr>,
#> #   infraspecificepithet <chr>, georeferenceprotocol <chr>,
#> #   lifestage <chr>, verbatimlongitude <chr>, recordedby <chr>,
#> #   preparations <chr>, scientificnameauthorship <chr>,
#> #   georeferencesources <chr>, sex <chr>, verbatimlatitude <chr>,
#> #   dynamicproperties <chr>, georeferenceremarks <chr>
```

Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, limit to 20 records


```r
res <- searchbyterm(specificepithet = "nigripes", genus = "Mustela", state = "(wyoming OR south dakota)", limit = 20, messages = FALSE)
res$data
#> # A tibble: 19 x 74
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
#> # ... with 69 more variables: verbatimcoordinatesystem <chr>, day <chr>,
#> #   identificationverificationstatus <chr>, occurrenceid <chr>,
#> #   identificationqualifier <chr>, phylum <chr>, verbatimeventdate <chr>,
#> #   coordinateuncertaintyinmeters <chr>, higherclassification <chr>,
#> #   sex <chr>, year <chr>, specificepithet <chr>, basisofrecord <chr>,
#> #   geodeticdatum <chr>, occurrenceremarks <chr>, highergeography <chr>,
#> #   continent <chr>, scientificname <chr>, language <chr>,
#> #   institutionid <chr>, country <chr>, genus <chr>,
#> #   georeferenceprotocol <chr>, family <chr>, stateprovince <chr>,
#> #   county <chr>, georeferenceddate <chr>, references <chr>,
#> #   georeferencedby <chr>, verbatimlocality <chr>, institutioncode <chr>,
#> #   organismid <chr>, eventtime <chr>, preparations <chr>,
#> #   recordedby <chr>, license <chr>, dynamicproperties <chr>,
#> #   georeferenceverificationstatus <chr>, modified <chr>, eventdate <chr>,
#> #   individualcount <chr>, bibliographiccitation <chr>,
#> #   verbatimcoordinates <chr>, georeferencesources <chr>,
#> #   catalognumber <chr>, locationaccordingto <chr>, collectioncode <chr>,
#> #   class <chr>, previousidentifications <chr>, decimallatitude <chr>,
#> #   locality <chr>, othercatalognumbers <chr>, identifiedby <chr>,
#> #   nomenclaturalcode <chr>, order <chr>, enddayofyear <chr>,
#> #   minimumelevationinmeters <chr>, associatedoccurrences <chr>,
#> #   maximumelevationinmeters <chr>, samplingprotocol <chr>,
#> #   dateidentified <chr>, eventremarks <chr>, datasetname <chr>,
#> #   locationremarks <chr>, taxonrank <chr>, countrycode <chr>,
#> #   occurrencestatus <chr>, vernacularname <chr>, recordnumber <chr>
```

Search for class _Aves_, in the state of _Nevada_, with a coordinate uncertainty range (in meters) of less than 25 meters


```r
res <- searchbyterm(class = "Aves", stateprovince = "Nevada", error = "<25", messages = FALSE)
res$data
#> # A tibble: 10 x 71
#>    month decimallongitude startdayofyear minimumelevation… accessrights   
#>    <chr> <chr>            <chr>          <chr>             <chr>          
#>  1 10    -119.582         288            1780              http://vertnet…
#>  2 10    -119.582         288            1780              http://vertnet…
#>  3 06    -116.99451       159            1481.328          http://www.ver…
#>  4 10    -119.582         288            1780              http://vertnet…
#>  5 10    -119.582         288            1780              http://vertnet…
#>  6 10    -119.582         288            1780              http://vertnet…
#>  7 10    -119.582         288            1780              http://vertnet…
#>  8 06    -114.09658       165            2072.64           http://www.ver…
#>  9 09    -118.57885       248            1786.128          http://www.ver…
#> 10 06    -116.99451       159            1481.328          http://www.ver…
#> # ... with 66 more variables: kingdom <chr>,
#> #   verbatimcoordinatesystem <chr>, day <chr>,
#> #   identificationverificationstatus <chr>, occurrenceid <chr>,
#> #   identificationqualifier <chr>, phylum <chr>, verbatimeventdate <chr>,
#> #   coordinateuncertaintyinmeters <chr>, higherclassification <chr>,
#> #   lifestage <chr>, modified <chr>, year <chr>, specificepithet <chr>,
#> #   basisofrecord <chr>, geodeticdatum <chr>, highergeography <chr>,
#> #   continent <chr>, scientificname <chr>, catalognumber <chr>,
#> #   language <chr>, institutionid <chr>, country <chr>, genus <chr>,
#> #   georeferenceprotocol <chr>, family <chr>, stateprovince <chr>,
#> #   county <chr>, georeferenceddate <chr>, references <chr>,
#> #   georeferencedby <chr>, verbatimlocality <chr>, habitat <chr>,
#> #   institutioncode <chr>, organismid <chr>,
#> #   maximumelevationinmeters <chr>, preparations <chr>, recordedby <chr>,
#> #   sex <chr>, license <chr>, dynamicproperties <chr>,
#> #   georeferenceverificationstatus <chr>, infraspecificepithet <chr>,
#> #   samplingprotocol <chr>, eventdate <chr>, individualcount <chr>,
#> #   bibliographiccitation <chr>, verbatimcoordinates <chr>,
#> #   georeferencesources <chr>, dateidentified <chr>,
#> #   locationaccordingto <chr>, collectioncode <chr>, class <chr>,
#> #   previousidentifications <chr>, decimallatitude <chr>, locality <chr>,
#> #   othercatalognumbers <chr>, identifiedby <chr>,
#> #   nomenclaturalcode <chr>, order <chr>, enddayofyear <chr>,
#> #   locationremarks <chr>, recordnumber <chr>, collectionid <chr>,
#> #   associatedmedia <chr>, occurrenceremarks <chr>
```

## Spatial search

Spatial search service allows only to search on a point defined by latitude and longitude pair, with a radius (meters) from that point. All three parameters are required. 


```r
res <- spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, messages = FALSE)
res$data
#> # A tibble: 10 x 60
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
#> # ... with 55 more variables: kingdom <chr>, day <chr>,
#> #   identificationverificationstatus <chr>, occurrenceid <chr>,
#> #   identificationqualifier <chr>, phylum <chr>, verbatimeventdate <chr>,
#> #   coordinateuncertaintyinmeters <chr>, higherclassification <chr>,
#> #   sex <chr>, year <chr>, specificepithet <chr>, basisofrecord <chr>,
#> #   geodeticdatum <chr>, occurrenceremarks <chr>, highergeography <chr>,
#> #   continent <chr>, scientificname <chr>, language <chr>,
#> #   institutionid <chr>, country <chr>, genus <chr>,
#> #   georeferenceprotocol <chr>, family <chr>, stateprovince <chr>,
#> #   county <chr>, georeferenceddate <chr>, references <chr>,
#> #   georeferencedby <chr>, verbatimlocality <chr>, institutioncode <chr>,
#> #   organismid <chr>, maximumelevationinmeters <chr>, preparations <chr>,
#> #   recordedby <chr>, dynamicproperties <chr>,
#> #   georeferenceverificationstatus <chr>, modified <chr>, eventdate <chr>,
#> #   individualcount <chr>, bibliographiccitation <chr>,
#> #   georeferencesources <chr>, catalognumber <chr>,
#> #   locationaccordingto <chr>, recordnumber <chr>, class <chr>,
#> #   previousidentifications <chr>, decimallatitude <chr>, locality <chr>,
#> #   othercatalognumbers <chr>, identifiedby <chr>,
#> #   nomenclaturalcode <chr>, enddayofyear <chr>, order <chr>,
#> #   collectioncode <chr>
```

## Global full text search

`vertsearch()` provides a simple full text search against all fields. For more info see [the docs](https://github.com/VertNet/webapp/wiki/The-API-search-function#global-full-text-search). An example:


```r
res <- vertsearch(taxon = "aves", state = "california", limit = 10)
res$data
#> # A tibble: 10 x 57
#>    higherclassification stateprovince basisofrecord month decimallongitude
#>    <chr>                <chr>         <chr>         <chr> <chr>           
#>  1 Animalia | Chordata… California    PreservedSpe… 2     -121.7833       
#>  2 Animalia | Chordata… California    PreservedSpe… 6     -122.15         
#>  3 Animalia | Chordata… California    PreservedSpe… 5     -120.9014       
#>  4 Animalia; Chordata;… South Caroli… PreservedSpe… 2     -79.86151       
#>  5 Animalia; Chordata;… California    PreservedSpe… 1     -121.93300      
#>  6 Animalia; Chordata;… California    PreservedSpe… 1     -121.93300      
#>  7 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#>  8 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#>  9 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#> 10 Animalia; Chordata;… California    PreservedSpe… 7     -121.85760      
#> # ... with 52 more variables: phylum <chr>, references <chr>, year <chr>,
#> #   startdayofyear <chr>, taxonrank <chr>, specificepithet <chr>,
#> #   bibliographiccitation <chr>, family <chr>, countrycode <chr>,
#> #   geodeticdatum <chr>, coordinateuncertaintyinmeters <chr>,
#> #   highergeography <chr>, continent <chr>, verbatimlocality <chr>,
#> #   day <chr>, kingdom <chr>, collectioncode <chr>,
#> #   occurrencestatus <chr>, coordinateprecision <chr>,
#> #   institutioncode <chr>, scientificname <chr>, locality <chr>,
#> #   class <chr>, vernacularname <chr>, county <chr>,
#> #   decimallatitude <chr>, occurrenceid <chr>, language <chr>,
#> #   license <chr>, country <chr>, georeferenceverificationstatus <chr>,
#> #   modified <chr>, eventdate <chr>, nomenclaturalcode <chr>,
#> #   verbatimeventdate <chr>, genus <chr>, order <chr>,
#> #   catalognumber <chr>, enddayofyear <chr>, locationremarks <chr>,
#> #   infraspecificepithet <chr>, georeferenceprotocol <chr>,
#> #   lifestage <chr>, verbatimlongitude <chr>, recordedby <chr>,
#> #   verbatimlatitude <chr>, preparations <chr>,
#> #   scientificnameauthorship <chr>, georeferenceremarks <chr>, sex <chr>,
#> #   georeferencesources <chr>, dynamicproperties <chr>
```

Limit the number of records returned (under 1000)


```r
res <- vertsearch("(kansas state OR KSU)", limit = 200)
res$data
#> # A tibble: 200 x 78
#>    individualcount georeferenceprot… recordedby  bibliographiccitation    
#>    <chr>           <chr>             <chr>       <chr>                    
#>  1 8               GEOLocate (Rios … H. W. Robi… Academy of Natural Scien…
#>  2 11              GEOLocate (Rios … H. W. Robi… Academy of Natural Scien…
#>  3 3               GEOLocate (Rios … H. W. Robi… Academy of Natural Scien…
#>  4 <NA>            <NA>              <NA>        California Academy of Sc…
#>  5 <NA>            <NA>              <NA>        California Academy of Sc…
#>  6 <NA>            <NA>              <NA>        California Academy of Sc…
#>  7 1               VertNet Georefer… MCCOY, C J… Carnegie Museum of Natur…
#>  8 1               VertNet Georefer… MCCOY, C J… Carnegie Museum of Natur…
#>  9 1               VertNet Georefer… MCCOY, C J… Carnegie Museum of Natur…
#> 10 1               VertNet Georefer… MCCOY, C J… Carnegie Museum of Natur…
#> # ... with 190 more rows, and 74 more variables: stateprovince <chr>,
#> #   basisofrecord <chr>, month <chr>, decimallongitude <chr>,
#> #   phylum <chr>, references <chr>, georeferencedby <chr>, year <chr>,
#> #   taxonrank <chr>, specificepithet <chr>, family <chr>,
#> #   countrycode <chr>, locality <chr>, geodeticdatum <chr>,
#> #   coordinateuncertaintyinmeters <chr>, highergeography <chr>,
#> #   continent <chr>, day <chr>, kingdom <chr>, georeferenceddate <chr>,
#> #   footprintwkt <chr>, institutioncode <chr>, scientificname <chr>,
#> #   preparations <chr>, disposition <chr>, class <chr>,
#> #   identificationremarks <chr>, county <chr>, decimallatitude <chr>,
#> #   occurrenceid <chr>, language <chr>, license <chr>, country <chr>,
#> #   georeferenceverificationstatus <chr>, othercatalognumbers <chr>,
#> #   infraspecificepithet <chr>, eventdate <chr>, identifiedby <chr>,
#> #   nomenclaturalcode <chr>, fieldnumber <chr>, verbatimeventdate <chr>,
#> #   genus <chr>, order <chr>, catalognumber <chr>, collectioncode <chr>,
#> #   higherclassification <chr>, lifestage <chr>, startdayofyear <chr>,
#> #   occurrenceremarks <chr>, verbatimlocality <chr>,
#> #   georeferencesources <chr>, verbatimcoordinatesystem <chr>,
#> #   institutionid <chr>, modified <chr>, dateidentified <chr>,
#> #   enddayofyear <chr>, georeferenceremarks <chr>, accessrights <chr>,
#> #   occurrencestatus <chr>, sex <chr>, establishmentmeans <chr>,
#> #   identificationverificationstatus <chr>, identificationqualifier <chr>,
#> #   organismid <chr>, dynamicproperties <chr>, verbatimcoordinates <chr>,
#> #   locationaccordingto <chr>, recordnumber <chr>,
#> #   previousidentifications <chr>, samplingprotocol <chr>,
#> #   minimumelevationinmeters <chr>, maximumelevationinmeters <chr>,
#> #   datasetname <chr>, collectionid <chr>
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

In the previous examples, we've suppressed messages for more concise output, but you can set `messages=TRUE` to get helpful messages - `messages=TRUE` is also the default setting so if you don't specify that parameter messages will be printed to the console. 


```r
res <- searchbyterm(class = "Aves", state = "California", limit = 10, messages = TRUE)
```
