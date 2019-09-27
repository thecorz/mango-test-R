# MANGO-TEST-R
## Data Science test for Mango Solutions

## Background
As part of the application process for a Data Science role at Mango Solutions they send me a Data Science challenge that is formed by 4 different parts

## 1. Data analysis
### Task
Read in the csv containing NBA free throws. Visualise some aspect of the data you find interesting, e.g., the average number of free throws per period for the regular season and the playoffs.

### Solution
The analysis is in an R notebook [`EDA.Rmd`](https://github.com/thecorz/mango-test-R/blob/master/EDA.Rmd)
You can visualise the notebook [here](http://rpubs.com/thecorz/mango-test)

## 2. Function
### Task
Write a function that will draw random numbers from a given distribution. The function should take one argument for the number of samples and a second argument which specifies the distribution (Normal, Poisson or Binomial). The function should be able to handle additional parameters depending on the distribution chosen, e.g., a lambda for Poisson samples.
### Solution
The function is in this R script [`draw_sample.R`](https://github.com/thecorz/mango-test-R/tree/master/drawsample_pkg/drawsample/R) within an R package

## 3. Object-oriented programming
### Task
Use the class system of your choice to create a summary method for the output of your function.

### Solution
The class is the same R script as the function [`draw_sample.R`](https://github.com/thecorz/mango-test-R/tree/master/drawsample_pkg/drawsample/R) within an R package

## 4. Package
### Task
Build a package containing the functions above. Use any tools as necessary.
### Solution
The package is built in source code. You can find it in this compressed file [`drawsample_0.1.0.tar.gz`](https://github.com/thecorz/mango-test-R/blob/master/drawsample_pkg/drawsample_0.1.0.tar.gz)

You can find it in the folder as well [`drawsample`](https://github.com/thecorz/mango-test-R/tree/master/drawsample_pkg/drawsample)

## How to run the R markdown notebook
  The libraries needed to run the R scripts are listed in packrat/packrat.lock file. To install the same packages (same versions):

1. Start R in the folder that contains the repo.
2. Install the R package manager: run install.packages('packrat') on the R terminal
3. Start a new packrat project: run packrat::init(options = list(auto.snapshot = TRUE)) packrat will find all the packages used in all the projects and try to intall them

