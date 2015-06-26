R CMD CHECK passed on my local OS X install with R 3.2.1 and R development version, 
Ubuntu running on Travis-CI, and Win builder.

On Win-Builder the check on R version 3.2.1 failed with 


* installing *source* package 'rvertnet' ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
*** arch - i386
Error in library.dynam(lib, package, package.lib) : 
  DLL 'stringi' not found: maybe not installed for this architecture?
Error: loading failed
Execution halted
*** arch - x64
ERROR: loading failed for 'i386'
* removing 'd:/RCompile/CRANguest/R-release/lib/rvertnet'


But I when I check this pacakge on a Windows machine I have it works fine on R-devel 
as well as R 3.2.1. So I assumed it was okay to submit. If I have assumed wrong, 
I apologize in advance for that. 

Thanks! Scott Chamberlain
