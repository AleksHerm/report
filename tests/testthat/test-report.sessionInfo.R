context("report.sessionInfo")


test_that("report.sessionInfo - High level", {
  x <- sessionInfo()
  r <- report(x)

  testthat::expect_true(is.character(r))
  testthat::expect_true(is.character(summary(r)))
  testthat::expect_true(as.report_text(r) == r)
  testthat::expect_true(as.report_text(r, summary = TRUE) == summary(r))

  testthat::expect_equal(ncol(as.data.frame(r)), 3)
  testthat::expect_equal(ncol(as.report_table(r)), 3)
  testthat::expect_equal(ncol(summary(as.data.frame(r))), 2)
  testthat::expect_equal(ncol(as.report_table(r, summary = TRUE)), 2)
})


test_that("report.sessionInfo - Core", {
  x <- sessionInfo()

  r <- report_table(x)
  testthat::expect_equal(ncol(r), 3)
  testthat::expect_equal(ncol(summary(r)), 2)

  r <- report_parameters(x)
  testthat::expect_true(is.character(r))
  testthat::expect_equal(length(as.character(r)), 1)
  testthat::expect_equal(length(as.character(r, prefix = "")), 1)
  testthat::expect_equal(length(as.character(summary(r))), 1)

  r <- report_text(x)
  testthat::expect_true(is.character(r))
  testthat::expect_true(is.character(summary(r)))
})


test_that("report.sessionInfo - Aliases", {
  x <- sessionInfo()
  testthat::expect_true(is.character(cite_packages(x)))
  testthat::expect_true(is.character(cite_packages(x, prefix = "")))

  testthat::expect_true(is.character(report_system(x)))
  testthat::expect_true(is.character(summary(report_system(x))))

  testthat::expect_true(is.character(report_packages(x)))
  testthat::expect_true(is.character(summary(report_packages(x))))
})
