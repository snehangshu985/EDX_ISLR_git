library(ISLR2)
df <- Hitters
df <- subset(df, complete.cases(df))


x <- model.matrix(Salary ~ ., Hitters)[, -1]
y <- Hitters$Salary

set.seed (1)
train <- sample (1: nrow(x), nrow(x) / 2)
test <- (-train)
y.test <- y[test]
library(glmnet)
set.seed (1)

x <- model.matrix(Salary ~ ., Hitters)[, -1]
y <- Hitters$Salary
y <- na.omit(y)


grid <- 10^seq(10, -2, length = 100)
ridge.mod <- glmnet(x, y, alpha = 0, lambda = grid)
cv.out <- cv.glmnet(x[train , ], y[train], alpha = 0)
summary(cv.out)





