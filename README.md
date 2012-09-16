# rvertnet #

Interface to the VertNet collections database. 

See the Wiki for examples of use cases for functions. 

VertNet API documentation here: 
-> https://github.com/VertNet/Darwin-Core-Engine/wiki/Prototype-Search-API
(This applies to vertsearch function)

New Fishnet portal v2 API documentation is here:
http://www.fishnet2.net/api/v1/apihelp.htm
(and same is currently implemented on Ornis and Herpnet)

Documentation for Darwin Core Names and their short names
-> https://github.com/VertNet/Darwin-Core-Engine/wiki/Darwin-Core-short-names
-> Look up short names in rvertnet by typing: dcnames()
-> Darwin Core terms examples, etc.: http://rs.tdwg.org/dwc/terms/index.htm

Install rvertnet from this developmental repository:

```R 
install.packages("devtools")
require(devtools)
install_github("rvertnet", "ropensci")
require(rvertnet)
```

You might need:
+ Windows: 
	+ [Rtools](http://cran.r-project.org/bin/windows/Rtools/)
+ OS X: 
	+ xcode
		+ from the app store
		+ Linux: apt-get install r-base-dev 
		+ or similar