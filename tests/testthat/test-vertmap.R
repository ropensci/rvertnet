context("vertmap")

test_that("vertmap works with vertsearch", {
  skip_on_cran()
  
  vcr::use_cassette("vertmap_prep_vertsearch1", {
    out <- vertsearch("mustela nigripes", messages = FALSE, limit = 50)
  })
  map1 <- vertmap(input = out, mapdatabase = "state")
  
  expect_is(map1, "gg")
  expect_is(map1$data, "data.frame")
  expect_equal(map1$labels$colour, "scientificname")
  expect_is(map1$mapping$x, "quosure")
})

test_that("vertmap works for maps not distinguished by color", {
  skip_on_cran()
  
  vcr::use_cassette("vertmap_prep_vertsearch2", {
    out <- vertsearch("mustela nigripes", messages = FALSE, limit = 50)
  })
  out$data$scientificname <- NULL
  map1 <- vertmap(input = out, mapdatabase = "state")
  
  expect_is(map1, "gg")
  expect_is(map1$data, "data.frame")
  expect_null(map1$labels$colour) # the difference here
  expect_is(map1$mapping$x, "quosure")
})

test_that("vertmap fails well", {
  skip_on_cran()
  
  expect_error(vertmap(), "Input must be of class list or data.frame")
  expect_error(vertmap(5), "Input must be of class list or data.frame")
})
