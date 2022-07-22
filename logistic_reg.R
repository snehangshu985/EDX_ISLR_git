library(dplyr)
library(tidyr)
library(ggplot2)
library(ISLR)
library(ISLR2)
library(MASS)
# =====================================================
# Fitting logistic regression 
# ==================================================
df <- Default

fit_glm <- glm(default ~ balance, data = df, family = binomial)
summary(fit_glm)

# prediction on the same data
y_pred <- predict(fit_glm, newdata = df, type = "response")
# code the plotting
df2 <- df
df2$predval <- y_pred
actval <- ifelse(df2$default=="No", 0, 1)

df2$actval <- actval


ggplot(data = df2, aes(balance, actval)) + geom_point() + 
    geom_point(aes(balance, predval), color = "blue")

# predict for any new unseen value

predict(fit_glm, newdata = data.frame(balance = 1940.072), type = "response")

# -----------------------------------------------
# Multivariate Logistitc regression
# ----------------------------------------------

fit_glm2 <- glm(default ~ ., data = df, family = binomial)


my_table <- xtabs(~default+student, data = df)







