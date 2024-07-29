# Generated from create-jsm2024.Rmd: do not edit by hand  
testthat::test_that("get_talks() works", {
  talk_jb <- get_talks(speakers = "Jacob Bien")
  testthat::expect_equal(
    talk_jb$title[[1]],
    "New and Evolving Roles of Business Statistics in the Big-data Era"
  )
  testthat::expect_equal(
    nrow(get_talks(speakers = c("Jacob Bien", "Guo Yu"))),
    1
  )
  jb_dw <- c("Jacob Bien", "Daniela Witten")
  testthat::expect_equal(nrow(get_talks(speakers = jb_dw)), 2)
  testthat::expect_true(
    all(
      get_talks(speakers = jb_dw)$title %in% get_talks(authors = jb_dw)$title
  ))
  testthat::expect_equal(
    nrow(get_talks(authors = "Sumanta Basu")),
    2
  )
  testthat::expect_equal(
    get_talks(speakers = "Jacob Bien", authors = c("Jacob Bien", "Guo Yu")),
    talk_jb
  )
  testthat::expect_equal(
    nrow(get_talks(people = "Jacob Bien")),
    310 # poster chair!
  )
  testthat::expect_equal(
    get_talks(keywords = "Business Statistics"),
    talk_jb
  )
  testthat::expect_equal(
    get_talks(keywords = "business statistics"),
    talk_jb
  )
  testthat::expect_equal(
    get_talks(people = "Jacob Bien",
              session_types = "Invited Panel Session"),
    talk_jb
  )
  testthat::expect_equal(
    get_talks(people = "Jacob Bien", 
              session_types = c("Invited Paper Session",
                                "Contributed Posters",
                                "Invited Panel Session")),
    get_talks(people = "Jacob Bien")
  )
})

testthat::test_that("ordered_nz() works", {
  testthat::expect_equal(
    ordered_nz(c(0, 0, 14, 0, 2, 100, -2)),
    c(6, 3, 5, 7)
  )
})

testthat::test_that("get_coauthors() works", {
  testthat::expect_true("Daniela Witten" %in% get_coauthors("Jacob Bien"))
})

testthat::test_that("get_*_citations() works", {
  jb_out_cite <- get_out_citations("Jacob Bien", augment = FALSE)
  jb_in_cite <- get_in_citations("Jacob Bien", augment = FALSE)
  testthat::expect_true("Daniela Witten" %in% jb_out_cite)
  testthat::expect_true("Daniela Witten" %in% jb_in_cite)
  testthat::expect_equal(
    jb_out_cite,
    get_out_citations("Jacob Bien", augment = TRUE)[1:length(jb_out_cite)]
  )
  testthat::expect_equal(
    jb_in_cite,
    get_in_citations("Jacob Bien", augment = TRUE)[1:length(jb_in_cite)]
  )
})

