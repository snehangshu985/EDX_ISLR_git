#=================================================================
# creating a bootstrap analysis of Auto data from ISLR data set
# ================================================================

library(boot)
library(ISLR)
# the boot function takes argument of data,.. 
# test statistics and number of iteration
# If we can not readilty produce the test statistics then need to write ..
# function for that
# we are interested in computing  coef for horsepower in lm fit
# as coef is wrapped inside lm object so we write a function +
# which return the coef
mystat <- function(data, indices){
    df <- data[indices,] # if indeces empty then take the whole dataset
    fit_lm <- lm(mpg ~ horsepower, data = df)
    a <- coef(fit_lm)
    return(a)
}

# checking the ceof for first 100  & 200 data
mystat(Auto, 1:100)

mystat(Auto, 101:200)
mystat(Auto)

# checking the bootstrap analysis with 1000 iterattion
boot(Auto, mystat, R=1000)











