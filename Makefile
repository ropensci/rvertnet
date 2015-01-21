all: move rmd2md

move:
	cd inst/vign;\
	cp rvertnet_vignette.md ../../vignettes

rmd2md:
	cd vignettes;\
	mv rvertnet_vignette.md rvertnet_vignette.Rmd
