#### Mango R test - Programming ####

# Function
# Write a function that will draw random numbers from a given distribution.
# The function should take one argument for the number of samples and a second
# argument which specifies the distribution (Normal, Poisson or Binomial).
# The function should be able to handle additional parameters depending on
# the distribution chosen, e.g., a lambda for Poisson samples.

# Object-oriented programming
# Use the class system of your choice to create a summary method for the output of your function.

# Package
# Build a package containing the functions above. Use any tools as necessary.


# Author: Javier Cuadrado
# Date: 24 Sept 2019

# S3 Class generator function

library(stats)

#' @export
draws <- function(n, dist, ...) {
  #' @title Draw a sample of a give size from a given distribution
  #'
  #'
  #' @description This function returns a given number of draws from
  #' the specified distribution. The distributions available to draw from are Normal, Poisson or Binomial.
  #'
  #' @param n Numeric. The number of draws.
  #' @param dist String. The distribution numbers are going to be drawn from.
  #' @param ... Numeric, parameters of the distribution
  #'
  #' @details
  #' Depending on the specified distribution, the function needs extra parameters:
  #' Normal distribution: mean and sd (standard desviation)
  #' Poisson: Lambda
  #' Binomail: Size and prob (probability)
  #'
  #'
  #' @return
  #' Returns an object of the class 'draws'
  #' An object of the class 'draws' consist on a list. The first element of the list contains the parameters used.
  #' The second element of the list contains a vector with the values of the draws.
  #' The method summary can be called over the object to get the min, 1st quartile, median, mean, 3rd quartile and max of the values drown.
  #'
  #' @examples
  #' # Sample 100 draws from the normal distribtuion wih mean = 0
  #' # and standard desviation = 1:
  #' draws(100, 'normal', mean = 0, sd = 1)
  #'
  #' # Sample 100 draws from the poison distribution with lambda = 1
  #' draws(100, 'poisson', lambda =1)
  #'
  #' # Sample 100 draws from the binomial distribution with size (n) = 50
  #' # and probability (p)
  #' draws(100, 'poisson', lambda =1)

  # integrity checks
  if(n<0 || !n%%1 == 0) stop("n must be a positive integer")

  dist <- tolower(dist)
  if(!dist %in% c('normal', 'poisson', 'binomial')) stop("dist must be 'normal', 'poisson' or 'binomial'")

  # capture extra params
  kwargs <- list(...)
  names(kwargs) <- tolower(names(kwargs))
  draws_list <- list()
  param <- list(n=n, dist=dist, unlist(kwargs))
  draws_list$parameters <- unlist(param)

  if (dist == "normal"){
    if(is.null(kwargs[["mean"]]) || is.null(kwargs[["sd"]])){
      stop("normal distribution requires mean and sd parameters")}
    draws_list$sample <- rnorm(n, mean = kwargs$mean, sd = kwargs$sd)
  }
  else if (dist == "poisson"){
    if(is.null(kwargs[["lambda"]])){
      stop("poisson distribution requires the lambda parameter")}
    draws_list$sample <- rpois(n, lambda = kwargs$lambda)
  }
  else{
    if(is.null(kwargs[["size"]] || is.null(kwargs[["prob"]]))){
      stop("binomial distribution requires size and prob parameters")}
    draws_list$sample <- rbinom(n, size = kwargs$size, prob = kwargs$prob)
  }

  attr(draws_list, "class") <- "draws"
  draws_list
}

# summary method
#' @export
summary.draws <- function(object, ...){
  summary(object$sample)
}

# testing
test <- draws(n=10, 'Normal', mean=0, sd=1)
summary(test)
