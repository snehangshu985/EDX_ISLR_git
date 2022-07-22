library(MASS)
library(ISLR)
library(dplyr)
library(ggplot2)

# simple linear regression

df <- Boston

fit_lm1 <- lm(medv ~ lstat, data = df)

y_pred <- predict(fit_lm1, interval = "confidence")

y_pred <- as.data.frame(y_pred)
df2 <- cbind.data.frame(df, y_pred)
df2 <- df2 %>% select(medv, lstat, fit, lwr, upr)


g1 <- ggplot(data=df, aes(lstat, medv)) + 
    geom_point() + geom_smooth(method = "lm")
g1


g2 <- ggplot(data=df2, aes(lstat, medv)) + geom_point() + 
    geom_line(aes(lstat, fit), color = "blue", size=1)

g2 <- g2 + geom_ribbon(aes(ymin = lwr, ymax = upr), alpha=0.5, fill = "green", color = "green")
g2




