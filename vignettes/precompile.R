#Vignettes that depend on internet access have been precompiled:

withr::with_dir('vignettes', knitr::knit("rvertnet.Rmd.orig", "rvertnet.Rmd"))

devtools::build_vignettes()
