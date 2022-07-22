# subset selection of linear models
# data from ISLR2, data is hitters, a ase ball data set
# regsubsets function for subset selection, from package "leaps"
# ---------------------------------------------------------------------------
# Best Subset for any number of given predictor, (Not nested)
# ---------------------------------------------------------------------------
library(ISLR2)
library(leaps)
df <- Hitters
# removing na from data set
df <- subset(df, complete.cases(df))

# fit all models with 19 set
# the "regsubsets" function show only the ...
# best combination for each number of predictors
fit_subset <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19)
# saving the summary for plotting the adjusted r^2 values
subset_summary <- summary(fit_subset)
# plotting the line graph of adjusted R^2
plot(subset_summary$adjr2, 
     xlab = "Number of variables", ylab = "adjusted R Sqr", 
     type = "l", col="blue", lwd=2)
# finding the adjusted R^2
max_point <- which.max(subset_summary$adjr2)
# point the
points(max_point, subset_summary$adjr2[max_point], col="red", cex=2, pch = 20)

# ---------------------------------------------------------------------------
# Forward Selection method ( nested)
# ---------------------------------------------------------------------------

fit_forw <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19, method = "forward")
# saving the summary for plotting the adjusted r^2 values
forward_summary <- summary(fit_forw)
# plotting the line graph of adjusted R^2
plot(forward_summary$adjr2, 
     xlab = "Number of variables", ylab = "adjusted R Sqr", 
     type = "l", col="green", lwd=2, lty = "dashed")
# finding the adjusted R^2
max_point_f <- which.max(forward_summary$adjr2)
# point the
points(max_point_f, subset_summary$adjr2[max_point_f], col="blue", cex=2, pch = 20)


