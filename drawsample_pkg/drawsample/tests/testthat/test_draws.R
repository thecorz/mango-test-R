test_that("Number of elements of class object (list)", {
    expect_length(draws(100, 'normal', mean=0, sd=1), 2)
})
test_that("Number of elements of the samples", {
    expect_length(draws(100, 'normal', mean=0, sd=1)[[2]], 100)
})
test_that("Number of elements of the parameter list", {
    expect_length(draws(100, 'normal', mean=0, sd=1)[[1]], 4)
    expect_length(draws(100, 'binomial', size=30, prob=1)[[1]], 4)
    expect_length(draws(100, 'poisson', lambda=10)[[1]], 3)
})
