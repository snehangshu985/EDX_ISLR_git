library(ISLR)
library(ISLR2)
library(MASS)
library(ggplot2)

df <- Bikeshare

fit_poi <- glm(bikers ~ hr, data = df, family = poisson)

y_pred <- predict(fit_poi)

y_pred2 <- exp(y_pred)

df2 <- data.frame(df, predval = y_pred2)

ggplot(df2, aes(hr, bikers)) + geom_point(color = "red", alpha=0.1) + 
    geom_line(aes(hr, predval), color = "blue")

g1 <- ggplot(df2, aes(as.numeric(hr), bikers)) + geom_point(color = "red", alpha = 0.2) + 
    geom_line(aes(as.numeric(hr), predval), color = "blue", size= 1)


print(g1)