library(tidyr)
library(dplyr)
library(ggplot2)
library(ISLR)
library(MASS)

df <- Default
# lda is in MASS library
fit_lda <- lda(formula= default ~ ., data = df)

y_pred <- predict(fit_lda)
# as lda prediction return as list we need to conver it..
# as a data frame
y_pred <- as.data.frame(y_pred)
cm <- table(trueval = df$default, preval = y_pred$class)

cm <- addmargins(cm)
cm <- as.matrix(cm)

