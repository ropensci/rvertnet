context("spatialsearch")

a <- spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, verbose = FALSE)

test_that("spatialsearch works correctly", {
  expect_is(a, "list")
  expect_is(a$meta, "list")
  expect_is(a$data, "data.frame")
  
  expect_is(a$data$type, "character")
  expect_is(na.omit(unique(a$data$infraspecificepithet)), "character")
  
  expect_equal(NROW(a$data), 10)
  
  expect_more_than(min(as.numeric(a$data$decimallatitude)), 10)
  expect_more_than(min(as.numeric(a$data$decimallongitude)), -110)
})

test_that("spatialsearch fails correctly", {
  # server error when not passing any vars
  expect_error(spatialsearch(verbose = FALSE), 'argument "lat" is missing')
  # server error when pass bad var types
  expect_message(spatialsearch(lat = "asdfadsf", long = -80, radius = 1), 'Check signs')
  # server error when pass bad var types
  expect_message(spatialsearch(lat = 50, long = "asdfadsf", radius = 1), 'Check signs')
  # message given when verobse is TRUE
  expect_message(spatialsearch(lat = 33.529, long = -105.694, radius=2000, limit = 1, verbose = TRUE))
})
