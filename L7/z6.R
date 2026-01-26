odp <- list()
mieszkania <- read.csv2("mieszkania.csv")
head(mieszkania)

# a) Za pomocą regresji liniowej opisać cenę mieszkania w postaci liniowej funkcji jego metrażu.
# cena = b0 + b1 * metraz + e
# b0 - teoretyczna cena mieszkania o wielkosci 0m^2
model <- lm(Cena ~ Metraz, data = mieszkania)
odp$a <- summary(model)

# Coefficients:
#             Estimate    Std.Error t value   Pr(>|t|)    
# (Intercept) 72352.7     6344.2    11.40     <2e-16 ***
#  Metraz     4755.6      108.7     43.74     <2e-16 ***

# B0 = 72352.7 (mieszkanie 0m^2)
# B1 = 4755.6 # 1m^2 = 4755.6zl
# <2e-16 *** - bardzo silna zaleznosc

# Multiple R-squared:  0.621,	Adjusted R-squared:  0.6206 
# model wyjasnia 62.1% roznic w cenach mieszkan

# Cena = 72353 + 4756 * Metraz

# b) Sporządzić wykres rozrzutu ceny względem metrażu.
plot(mieszkania$Metraz, mieszkania$Cena,
     main = "Cena vs Metraz",
     xlab = "Metraz (m^2)", ylab = "Cena (zl)"
     )
abline(model, lwd = 3, col = "red")

# c) Przetestować hipotezę że reszty mają rozkład normalny.
rate <- function(p_val, alpha) {
  if(p_val < alpha) {
    return ("To nie jest rozklad normalny")
  }
  else {
    return ("Nie ma podstaw do odrzucenia hipotezy ze to rozklad normalny")
  }
}
test_residuals <- shapiro.test(model$residuals)
odp$c <- rate(test_residuals$p.value, 0.05)
# to nie jest normalny - sa np. duzo drozsze mieszkania co psuje normalnosc

# d) Za pomocą tego równania, oszacować średnią cenę mieszkań o metrażu równym 80m2.
mieszkanie_metraz_80 <- data.frame(Metraz = 80)
pred <- predict(model, newdata = mieszkanie_metraz_80, interval = "confidence")
odp$d <- pred

# odp
odp










