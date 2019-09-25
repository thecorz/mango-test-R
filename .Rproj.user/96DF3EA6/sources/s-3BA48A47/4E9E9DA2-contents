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
draws <- function(n, dist, ...) {
  #' Draw a number from a given distribution
  #'
  #' 
  #' @description This function returns a given number of draws from
  #' the specified distribution. The distributions can be Normal, Poisson
  #' or Binomial
  #' 
  #' @param n Numeric. The number of draws.
  #' @param dist String. The distribution numbers are going to be drawn from.
  #' @param ... Numeric, parameters of the distribution
  #' 
  #' @return Returns a list of the values drawn from the distribtuion
  #' 
  #' @examples 
  #' draw_dist(100, 'normal', mean = 0, sd = 1)
  
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
    draws_list$samples <- rnorm(n, mean = kwargs$mean, sd = kwargs$sd)
  } 
  else if (dist == "poisson"){
    if(is.null(kwargs[["lambda"]])){
      stop("poisson distribution requires the lambda parameter")}
    draws_list$samples <- rpois(n, lambda = kwargs$lambda)
  } 
  else{
    if(is.null(kwargs[["size"]] || is.null(kwargs[["prob"]]))){
      stop("binomial distribution requires size and prob parameters")}
    draws_list$samples <- rbinom(n, size = kwargs$size, prob = kwargs$prob)
  }
  
  attr(draws_list, "class") <- "draws"
  draws_list
}

# summary method
summary.draws <- function(obj){
  summary(obj$samples)
}

# testing
test <- draws(n=10, 'Normal', mean=0, sd=1)
summary(test)
