Interface to the VertNet collections database. 

See the Wiki for examples of use cases for functions. 

VertNet API documentation here: 
-> https://github.com/VertNet/Darwin-Core-Engine/wiki/Prototype-Search-API

Documentation for Darwin Core Names and their short names
-> https://github.com/VertNet/Darwin-Core-Engine/wiki/Darwin-Core-short-names
-> Look up short names in rvertnet by typing: dcnames()
-> Darwin Core terms examples, etc.: http://rs.tdwg.org/dwc/terms/index.htm

Install rvertnet:

```R 
install.packages("devtools")
require(devtools)
install_github("rvertnet", "ropensci")
require(rvertnet)
```