## Test environments

* local OS X install, R 3.3.1
* ubuntu 12.04 (on travis-ci), R 3.3.1
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

   License components with restrictions and base license permitting such:
     MIT + file LICENSE
   File 'LICENSE':
     YEAR: 2016
     COPYRIGHT HOLDER: Scott Chamberlain

## Reverse dependencies

* I have run R CMD check on the NUMBER downstream dependencies.
  (Summary at https://github.com/ropensci/rvertnet/tree/master/revdep).

* There were failures with one package `rgeospatialquality`, but 
I looked into the failures, and they are unrelated to this package.

* The revdep maintainers were notified of the release on 2016-09-23

--------

This release includes a new parameter in a function, fixes for deprecaed
function calls in one of the dependencies, and reduction of 
dependencies.


Sincerely,
Scott Chamberlain
