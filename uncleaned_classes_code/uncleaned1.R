test2 <- t.test(subset(dane, sex == "Male")$tarsus,
                subset(dane, sex == "Fem")$tarsus)
test2
test2$p.value

dane <- subset(dane, sex != "UNK")
test2 <- t.test(tarsus ~ sex, data = dane)
test2
summary(dane)

install.packages("gdata")
dane <- gdata::drop.levels(dane)
summary(dane)

test3 <- chisq.test(table(dane$sex, dane$habitat))

test4 <- chisq.test(
  table(dane$tarsus > 13.5, dane$sex)
  )

p_fr <- c(0.1, 0.67, 0.23)
sum(p_fr)

chisq.test(p_fr, p = c(1,1,1)/3)


model <- lm(tarsus ~ hatchdate, data = dane)
summary(model)

model1 <- lm(tarsus ~ hatchdate,
             data = dane[-15,])
summary(model1)
library(tidyverse)
library(MuMIn)
library(lme4)
library(lmerTest)
library(sjPlot)


model1 <- lm(weight ~ tarsus, data = dane)
summary(model1)

model1 <- lm(weight ~ scale(tarsus, center = T, scale = F),
             data = dane)
summary(model1)
mean(dane$weight)

model1 <- lm(scale(weight, center = T, scale = F) ~ 
               scale(tarsus, center = T, scale = F),
             data = dane)
summary(model1)
dane$weight_s <- scale(dane$weight, center = T, scale = F)

dane <- read.table("BTdata.csv", sep = ",",
                   header = T, stringsAsFactors = )

# set.seed(100)
plot(jitter(dane$tarsus, 3), jitter(dane$weight, 3),
     xlab = "Weight", ylab = "Tarsus",
     col = dane$sex)
str(dane)

dane <- filter(dane, sex != "UNK")
dane <- filter(dane, sex == "Male" | sex == "Fem")
# lub
dane <- subset(dane, sex != "UNK")

test2 <- t.test(subset(dane, sex == "Male")$tarsus,
                subset(dane, sex == "Fem")$tarsus)
test2
?t.test

t.test(tarsus ~ sex, data = dane)
summary(dane)

install.packages("gdata")
dane <- gdata::drop.levels(dane)

table2 <- table(dane$sex, dane$tarsus > 13.5)
table2

test1 <- chisq.test(table2)
test2 <- chisq.test(table(dane$sex, dane$habitat))
str(test1)

model1 <- lm(tarsus ~ hatchdate, data = dane)
model2 <- lm(tarsus ~ scale(hatchdate, center = T, scale = F), data = dane)
mean(dane$tarsus)

model3 <- lm(scale(tarsus, center = T, scale = F) ~
               scale(hatchdate, center = T, scale = F) - 1, data = dane)
summary(model3)
dane$weight_s <- scale(dane$weight, scale = F, center = T)

plot(model1)
plot(tarsus~hatchdate, data = dane)
abline(model1, col = "red") # rysowanie linii regresji

# sensitivity analysis - usuwanie potencjalnego outliera
model1 <- lm(tarsus ~ hatchdate, data = dane)
model1_5 <- lm(tarsus ~ hatchdate, data = dane[-15,])

model1 <- lm(tarsus ~ hatchdate + habitat + sex + habitat:hatchdate + hatchdate:sex,
             data = dane)
summary(model1)

model2 <- lm(tarsus ~ hatchdate + habitat + sex,
             data = dane)
summary(model2)

install.packages("MuMIn")
library(MuMIn)

model1 <- lm(tarsus ~ hatchdate + habitat + sex + habitat:hatchdate + hatchdate:sex,
             data = dane, na.action = "na.fail")
model_sel <- dredge(model1, trace = T)
model_sel


plot(jitter(dane$tarsus, 3), jitter(dane$weight, 3),
     xlab = "Weight", ylab = "Tarsus",
     col = dane$sex)

test2 <- t.test(subset(dane, sex == "Male")$tarsus,
                subset(dane, sex == "Fem")$tarsus)
test2

dane <- filter(dane, sex != "UNK")
dane <- subset(dane, sex != "UNK")

test2 <- t.test(tarsus ~ sex, data = dane,
                paired = T, var.equal = T)
test2


test1 <- chisq.test(table(dane$sex, dane$habitat))
test2 <- chisq.test(table(dane$sex, dane$tarsus > 13.5))

test1$stdres
test2$stdres


model <- lm(tarsus ~ hatchdate, data = dane)
summary(model)

model1 <- lm(tarsus ~ scale(hatchdate, center = T, scale = F), data = dane)
summary(model1)
mean(dane$tarsus)

plot(model)
plot(tarsus ~ hatchdate, data = dane)



install.packages("MuMIn")
library(MuMIn)

model1 <- lm(tarsus ~ hatchdate + habitat + sex + habitat:hatchdate + hatchdate:sex,
             data = dane, na.action = "na.fail")
AIC(model1)
model_sel <- dredge(model1, trace = T)
model_sel





