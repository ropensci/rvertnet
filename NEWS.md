rvertnet 0.5.0
===============

### NEW FEATURES

* `searchbyterm()` gains new parameter `query` to allow full text search, 
much like `vertsearch()`, but with the ability to also use all the parameters
available in `searchbyterm()` (#53)

### MINOR IMPROVEMENTS

* Use `dplyr::bind_rows` instead of the deprecated `dplyr::rbind_all` (#51)
* remove personal email address from tests (#52)
* Namespace base R pkg fxn calls (`methods`/`stats`/`utils`), and removed 
some package dependencies that we didn't really need (`plyr`) (#54)

rvertnet 0.4.4
===============

### MINOR IMPROVEMENTS

* Updated docs to better indicate how to use the cursor feature (#49)
* Now using explicit encoding specification when using `httr::content()` (#47)

### BUG FIXES

* Fixed `externalptr` error in the internal `vert_GET()` function (#48)

rvertnet 0.4.1
===============

### BUG FIXES

* Fixed a bug in `bigsearch()` in which we had forgotten to do
internal conversion of logical input to 0/1 needed by the web
API (#46)

rvertnet 0.4.0
===============

### NEW FEATURES

* New set of functions to make working with VertNet data dumps
easier. `dump_links()` gives you links to various data dump
resources; `dump_init()` initialized a SQLite database connection;
`dump_tbl()` creates a `dplyr::tbl` object, which can then be used
in a `dplyr` query. This setup requires that the user manually
download data dumps uncompress, and load into SQLite. We hope to
make this process easier in the future. (#36)

### MINOR IMPROVEMENTS

* Fixes to `vertmap()` for new `ggplot2` version (#43)
* Added note to docs for `bigsearch()` for how to read in data
after obtaining the data (#44)

### BUG FIXES

* Fix to the `searchbyterm()` function. When the parameter `stateprovince`
was used, lead to error, as that param requires different handling than
other params. (#45)

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
