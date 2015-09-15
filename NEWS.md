rvertnet 0.3.4
===============

### NEW FEATURES

* New function `vert_id()` to get occurrence records by occurenceid, 
that is, single occurrence ids. (#40)

### MINOR IMPROVEMENTS

* Explicitly import non-base R functions (#39)

### BUG FIXES

* Lowercase `occurenceID` to `occurrenceid` to simplify life (#41)

rvertnet 0.3.0
===============

### NEW FEATURES

* `searchbyterm()` and `bigsearch()` have some parameters that accept multiple values.
Fixed to allow this (#37)
* Internals of `searchbyterm()`, `spatialsearch()`, and `vertsearch()` reworked to 
use cursor so we internally do paging for you for bigger result sets. (#25) 

### MINOR IMPROVEMENTS

* Replaced `data.table` import with `dplyr`
* Using `skip_on_cran()` (#38)
* Minor vignette updates (#35)
* Metadata now returned in data requests (#33)

rvertnet 0.2.2
===============

Package completely reworked for the new VertNet API.

### NEW FEATURES

* The functions `vertavailablemaps()`, `vertlocations()`, 
`vertoccurrence()`, `vertoccurrencecount()`, `vertproviders()`, 
`verttaxa()` are now defunct. You can call these functions, but 
they print an error message, saying they are defunct.
* Gained new functions `bigsearch()`, `searchbyterm()`, 
`spatialsearch()`, and `vertsummary()`.
* Gained new author: Chris Ray

### MINOR IMPROVEMENTS

* `RJSONIO` replaced with `jsonlite`
* Changed from CC0 to MIT license

rvertnet 0.0-5
------------

### NEW FEATURES 

* released to CRAN
