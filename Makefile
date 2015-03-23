all: move rmd2md

move:
	cd inst/vign;\
	cp rvertnet_vignette.md ../../vignettes;\
	cp -rf figure/* ../../vignettes/figure/

rmd2md:
	cd vignettes;\
	mv rvertnet_vignette.md rvertnet_vignette.Rmd
