context("searchbyterm")

# Find multiple species
a <- searchbyterm(genus = "ochotona", specificepithet = "(princeps OR collaris)", limit=5, verbose = FALSE)
b <- searchbyterm(class = "aves", state = "california", limit = 10, verbose=FALSE)
cc <- searchbyterm(class = "aves", state = "california", year = 1976, limit = 10, verbose=FALSE)
d <- searchbyterm(class = "aves", state = "california", year = ">1976", limit = 60, verbose=FALSE)

test_that("searchbyterm works correctly", {
  expect_equal( NROW( searchbyterm(limit=1, verbose=FALSE) ), 1)
  expect_is(a, "data.frame")
  expect_is(b, "data.frame")
  expect_is(cc, "data.frame")
  expect_is(d, "data.frame")
  
  expect_is(a$type, "character")
  expect_match(d$class, "Aves")
  
  expect_equal(NROW(cc), 10)
  expect_equal(NROW(d), 60)
  
  expect_equal(unique(as.numeric(cc$year)), 1976)
  
  expect_more_than(min(as.numeric(d$year)), 1976)
})

test_that("searchbyterm fails correctly", {
  # server error with inproper date
  expect_error(searchbyterm(specificepithet = "nigripes", date = "1935-09-01/1935-09-30", verbose=FALSE), 
               'server error')
})
