The `rvertnet` package interacts with the API services of [VertNet](http://vertnet.org/index.php). No API key is needed. 

This tutorial will go through three use cases to demonstrate the kinds of things possible in `rvertnet`.

+ 
+ 
+ 
+ 
+ 

***
### Load package from GitHub

```r
# install_github('rvertnet', 'ropensci')
library(rvertnet)
```


***

#### Get Darwin Core terms.

```r
data(dcnames)
head(dcnames)
```

```
##                    name short_name
## 1     acceptednameusage        anu
## 2   acceptednameusageid      anuid
## 3          accessrights         ar
## 4       associatedmedia         am
## 5 associatedoccurrences         ao
## 6  associatedreferences         ar
```

```r

data(dc)
head(dc)
```

```
##                    name short_name   type
## 1     acceptednameusage        anu string
## 2   acceptednameusageid      anuid string
## 3          accessrights         ar string
## 4       associatedmedia         am string
## 5 associatedoccurrences         ao string
## 6  associatedreferences         ar string
```


***

#### Get metadata about maps currently available for querying against.

```r
head(vertavailablemaps()[, -4])
```

```
##   MapID DisplayName                   FileName
## 1     1 19 May 2010 NESDIS Anomaly RS2 5-19-10
## 2     2 20 May 2010 NESDIS Anomaly RS2 5-20-10
## 3     3 21 May 2010 NESDIS Anomaly RS2 5-21-10
## 4     4 22 May 2010 NESDIS Anomaly RS2 5-22-10
## 5     5 23 May 2010 NESDIS Anomaly RS2 5-23-10
## 6     6 24 May 2010 NESDIS Anomaly RS2 5-24-10
```


***

### Get locations and number of occurrence records for an organism.

```r
out <- vertlocations(t = "notropis", d = 2009)
head(out[, c(1, 2, 5, 6, 7)])
```

```
##   Country        StateProvince Latitude Longitude Num.Records
## 1  Canada              Ontario    44.09    -77.33           1
## 2  Canada              Ontario    44.16    -77.32           1
## 3  Canada              Ontario    45.12    -75.63           1
## 4  Canada              Ontario    45.14    -75.64           1
## 5  U.S.A. South Carolina State       NA        NA           1
## 6  U.S.A. South Carolina State       NA        NA           1
```



***

### Get occurrence records.

```r
vertoccurrence(t = "notropis", num = 5)[, 1:5]
```

```
##   InstitutionCode CollectionCode CatalogNumber IndividualCount
## 1          IBUNAM           CNPE       PE10015              15
## 2          IBUNAM           CNPE       PE10016              16
## 3          IBUNAM           CNPE       PE10024              39
## 4          IBUNAM           CNPE       PE10027              21
## 5          IBUNAM           CNPE       PE10028              50
##     ScientificName
## 1 Notropis imeldae
## 2 Notropis imeldae
## 3 Notropis imeldae
## 4 Notropis imeldae
## 5 Notropis imeldae
```



***

### Get number of occurrence records.

```r
vertoccurrencecount(t = "notropis", d = 2009)
```

```
##   TotRows No.Error GeoTot
## 1     345 No Error    306
```



***

### Get data providers for an organism.

```r
head(vertproviders(t = "notropis")[, -1])  # not showing institution name for brevity
```

```
##   InstitutionCode Num.Records
## 1              AM           4
## 2            FSBC           7
## 3              UF        6607
## 4             ROM        5671
## 5          IBUNAM          45
## 6            WNMU           9
```



***

### Search for occurrences for a given taxonomic name.

```r
head(vertsearch("aves", "california", 10)[, c(11, 14)])  # just lat/long for brevity
```

```
##   verbatimcoordinatesystem  scientificname
## 1          decimal degrees Calidris alpina
## 2          decimal degrees  Limnodromus sp
## 3          decimal degrees  Limnodromus sp
## 4          decimal degrees  Limnodromus sp
## 5          decimal degrees  Limnodromus sp
## 6          decimal degrees  Limnodromus sp
```

