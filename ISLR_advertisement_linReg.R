df <- read.csv("advertising.csv")

fit_lm1 <- lm(Sales ~ TV + Radio + Newspaper, data = df)

fit_lm2 <- lm(Sales ~ TV + Radio, data = df)

fit_lm3 <- lm(Sales ~ TV, data = df)

fit_lm4 <- lm(Sales ~ TV + Radio + TV:Radio, data = df)

anova(fit_lm3, fit_lm2, fit_lm1)

library(plotly)

plt <- plot_ly(data = df, x= ~TV, y = ~Radio, z = ~Sales, 
               type = "scatter3d")

plt
library(tidyr)
df2 <- df %>% gather(TV, Radio, Newspaper, key = "Medium", value = "Adcost") 

g1 <- ggplot(df2, aes(Adcost, Sales)) + geom_point() + 
    geom_smooth(method = "lm", se=F) + facet_grid(.~Medium, scales = "free")
g1

# ==================================================================
# Credit card data from ISLR
# ==================================================================
library(ISLR)
library(dplyr)

df3 <- Credit 

fit_lm5 <- lm(Balance ~ Ethnicity - 1,  data=df3)

df3 %>% group_by(Ethnicity) %>% summarise(AvgBalance = mean(Balance))

balAA <- df3 %>% filter(Ethnicity == "African American")
balAsian <- df3 %>% filter(Ethnicity == "Asian")
balCau <- df3 %>% filter(Ethnicity == "Caucasian")

t.test(balAA$Balance,balAsian$Balance, alternative = "two.sided")

t.test(balAA$Balance,balCau$Balance)








