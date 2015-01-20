context("bigsearch")

a <- bigsearch(specificepithet = "princeps", genus = "ochotona", 
               rf = "test-bigsearch1", email = "myrmecocystus@gmail.com")

test_that("bigsearch sends email correctly", {
	expect_null(a)
	expect_message(bigsearch(specificepithet = "collaris", genus = "ochotona", year = 1970,
	                      rf = "test-bigsearch2", email = "myrmecocystus@gmail.com"), 
               "Download of records file 'test-bigsearch2'")
})

test_that("bigsearch fails correctly", {
  # have to pass in rfile
  expect_error(bigsearch(email = "myrmecocystus@gmail.com"), 'argument "rfile" is missing')
  # have to pass in email
  expect_error(bigsearch(rfile = "file1"), 'argument "email" is missing')
  # have to pass in at least one query term
  expect_error(bigsearch(rf = "file2", email = "stuff@stuff.com"))
})