fit_lm <- lm(y ~ X1 + X2, data = Xy)
summary(fit_lm) 

matplot(Xy,type="l")

library(boot)

b1e <- function(data, indices) {
    d <- data[indices,]
    fit <- lm(y ~ X1 + X2, data=d)
    return(summary(fit)$coef[2,2])
}

new.rows <- c(101:200, 401:500, 101:200, 901:1000, 301:400, 
              1:100, 1:100, 801:900, 201:300, 701:800)

set.seed(1234)
results <- boot(data=Xy, statistic=b1e, R=1000)



library(ISLR)

mystat <- function(data, indices){
    df <- data[indices,]
    fit_lm <- lm(mpg ??? horsepower, data = df)
    a <- coef(fit_lm)
    return(a)
}
set.seed (1)
mystat(Auto, sample (392 , 392, replace = T))

boot(Auto, mystat, R=1000)











