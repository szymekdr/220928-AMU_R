str(dane)
summary(dane)
vec <- c(4,7,5,8)
is.numeric(vec)
is.factor(vec)
as.character(vec)
as.factor(c("M", "M", "F", "M", "F", "M"))

names(dane)

# tworzenie i usuwanie kolumny z danych
dane$tarsus2x <- 2 * dane$tarsus
dane$tarsus2x <- NULL
dane$fosternest_factor <- as.factor(dane$fosternest)
dane$tarsus_log <- log(dane$tarsus)



nowedane <- group_by(dane2, fosternest) %>%
  mutate(mean_weight = mean(weight)) %>%
  select(-starts_with("bill")) %>%
  arrange(fosternest) %>%
  ungroup() %>%
  mutate(mean_ratio = mean_weight/mean(weight)) %>%
  print(n = 30)
write.table(nowedane, file = "BTdata_nowe.csv", sep = ",")


?cor.test
test1 <- cor.test(dane$tarsus, dane$weight)
test1$p.value
test1 <- cor.test(~ weight + tarsus, data = dane)
test1




model1 <- lm(tarsus ~ hatchdate + habitat + sex + habitat:hatchdate + hatchdate:sex,
             data = dane, na.action = "na.fail")
summary(model1)

summary(dane$sex)

AIC(model1)
?MuMIn

model_sel <- dredge(model1, trace = T)
model_sel


summary(model.avg(model_sel, subset = delta <= 2))
importance(model_sel)

head(btepc)
model <- glm()

library(sjPlot)

library(lme4)
library(lmerTest)

dane <- subset(dane, sex != "UNK")
plot(hatchdate ~ habitat, data = dane)

d0 <- mean(subset(dane, habitat == "forest")$hatchdate) -
  mean(subset(dane, habitat == "park")$hatchdate)
d0

forest <- subset(dane, habitat == "forest")
park <- subset(dane, habitat == "park")
mean1 <- mean(forest$hatchdate)
mean2 <- mean(park$hatchdate)
d0 <- mean1 - mean2

N <- 50000 # liczba zakładanych powtórzeń
k <- nrow(dane) # wielkość oryginalnego zbioru danych

# oryginalna statystyka testowa
d0 <- mean(subset(dane, habitat == "forest")$hatchdate) -
  mean(subset(dane, habitat == "park")$hatchdate)

# obiekt wynikowy przygotowany na N=1000 końcowych wartości
out <- numeric(N)

for(i in 1:N) {
  
  # losujemy 828 wierszy, ze zwracaniem
  # a oryginalnej puli unikatowych 828 wierszy danych
  rows <- sample(1:k, size = k, replace = T)
  
  # tworzymy tymczasowe dane wewnątrz pętli
  # zawierające tylko wylosowane wiersze
  temp_dane <- dane[rows, ]
  
  # oblicza na podstawie tak przygotowanych danych
  # tymczasową statystykę testową dla powtórzenia
  # nr i pętli
  d_temp <- mean(subset(temp_dane, habitat == "forest")$hatchdate) -
    mean(subset(temp_dane, habitat == "park")$hatchdate)
  
  # zapisujemy wyliczoną statystykę
  # do zmiennej out w miejscu i
  out[i] <- d_temp
  
}

hist(out, 50)
abline(v = d0, lwd = 2)
abline(v = 0, lwd = 2, lty = 2, col = "red")
quantile(out, probs = c(0.025, 0.975))

r <- 1:5

out <- list()
for(n in 1:10000) {
  out[[n]] <- sample(1:5, size = 5, replace = T)
}
length(unique(out))



dane <- read_csv("BTdata.csv", 
                 col_types = cols(sex = col_factor(levels = c("Fem", "Male", "UNK")),
                                  habitat = col_factor(levels = c("forest", "park"))))
dane <- filter(dane, sex != "UNK")
model0 <- lm(tarsus ~ hatchdate + habitat + sex + habitat:hatchdate + hatchdate:sex,
             data = dane, na.action = 'na.fail')
model_sel <- dredge(model0, trace = T)

model_avg <- model.avg(model_sel, subset = delta <= 2)
summary(model_avg)
importance(model_avg)

btepc$MAGEO <- as.factor(btepc$MAGEO)
btepc$FAGEO <- as.factor(btepc$FAGEO)
summary(btepc)

plot(jitter(FEPC, 0.3) ~ MTAR,
     data = btepc, col = btepc$FAGEO)

model6 <- glm(FEPC ~ MTAR*FAGEO, data = btepc,
              family = "binomial")
summary(model6)

library(sjPlot)
plot_model(model6, type = "int")












dane$fosternest <- as.factor(dane$fosternest)
dane$dam <- as.factor(dane$dam)

install.packages("lme4")
install.packages("lmerTest")

model7 <- lmer(tarsus ~ sex + (1|fosternest) + (1|dam), data = dane)
plot(model7)
summary(model7)

model8 <- lmer(tarsus ~ sex + (1|fosternest), data = dane)
anova(model7, model8)

dane$sex <- as.numeric(dane$sex) - 1
# alternatywna metoda
dane$sex <- ifelse(dane$sex == 'Fem', 0, 1)

model10 <- glmer(sex ~ hatchdate + (1|dam), data = dane,
                 family = "binomial")
summary(model10)


sample(1:20, size = 10, replace = T)

sample(1:6, size = 6, replace = T)

d0 <- mean(subset(dane, habitat == "forest")$hatchdate) -
  mean(subset(dane, habitat == "park")$hatchdate)
d0


N <- 1000 # liczba zakładanych powtórzeń
k <- nrow(dane) # wielkość oryginalnego zbioru danych

# oryginalna statystyka testowa
d0 <- mean(filter(dane, habitat == "forest")$hatchdate) -
  mean(filter(dane, habitat == "park")$hatchdate)

# obiekt wynikowy przygotowany na N=1000 końcowych wartości
out <- numeric(N)

for(i in 1:N) {
  
  # losujemy 828 wierszy, ze zwracaniem
  # a oryginalnej puli unikatowych 828 wierszy danych
  rows <- sample(1:k, size = k, replace = T)
  
  # tworzymy tymczasowe dane wewnątrz pętli
  # zawierające tylko wylosowane wiersze
  temp_dane <- dane[rows, ]
  
  # oblicza na podstawie tak przygotowanych danych
  # tymczasową statystykę testową dla powtórzenia
  # nr i pętli
  d_temp <- mean(subset(temp_dane, habitat == "forest")$hatchdate) -
    mean(subset(temp_dane, habitat == "park")$hatchdate)
  
  # zapisujemy wyliczoną statystykę
  # do zmiennej out w miejscu i
  out[i] <- d_temp
  
}

hist(out, 75)
abline(v = d0, lwd = 2)
abline(v = 0, lwd = 2, col = 'red', lty = 2)
quantile(out, prob = c(0.025, 0.975))

t.test(hatchdate ~ habitat, data = dane)



model_sredni <- model.avg(model_sel, subset = delta <= 2)
summary(model_sredni)
importance(model_sredni)
sw(model_sredni)

install.packages("sjPlot")
plot_model(model6, type = "int")


model7 <- lmer(tarsus ~ sex + (1|fosternest) + (1|dam), data = dane)
plot(model7)
summary(model7)
model8 <- lmer(tarsus ~ sex + (1|fosternest), data = dane)
anova(model7, model8)

sample(1:20, size = 10, replace = T)

d0 <- mean(subset(dane, habitat == "forest")$hatchdate) -
  mean(subset(dane, habitat == "park")$hatchdate)
d0


N <- 50000 # liczba zakładanych powtórzeń
k <- nrow(dane) # wielkość oryginalnego zbioru danych

# oryginalna statystyka testowa
model <- lm(tarsus ~ hatchdate, data = dane)
str(summary(model))
d0 <- summary(model)$coefficients["hatchdate", "Estimate"]

# obiekt wynikowy przygotowany na N=1000 końcowych wartości
out <- numeric(N)

for(i in 1:N) {
  
  # losujemy 828 wierszy, ze zwracaniem
  # a oryginalnej puli unikatowych 828 wierszy danych
  rows <- sample(1:k, size = k, replace = T)
  
  # tworzymy tymczasowe dane wewnątrz pętli
  # zawierające tylko wylosowane wiersze
  temp_dane <- dane[rows, ]
  
  # oblicza na podstawie tak przygotowanych danych
  # tymczasową statystykę testową dla powtórzenia
  # nr i pętli
  model_temp <- lm(tarsus ~ hatchdate, data = temp_dane)
  d_temp <- summary(model_temp)$coefficients["hatchdate", "Estimate"]
  
  
  # zapisujemy wyliczoną statystykę
  # do zmiennej out w miejscu i
  out[i] <- d_temp
  
}

hist(out, 50)
abline(v = d0, lwd = 2)
abline(v = 0, lwd = 2, col = "red", lty = 2)
quantile(out, prob = c(0.025, 0.975))
