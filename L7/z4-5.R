odp <- list()
# 4.
# a) Tworzyć zmienną, która wskazuje czy cena za m2
# jest większa niż 6000zł czy nie.

mieszkania <- read.csv2("mieszkania.csv")
# head(mieszkania)

mieszkania$cena_za_m2 <- mieszkania$Cena / mieszkania$Metraz
mieszkania$drogie <- mieszkania$cena_za_m2 > 6000
# head(mieszkania)

# b) Przetestować hipotezę iż prawdopodobieństwo tego, że cena za m2
# jest większa niż 6000zł zależy od dzielnicy za
# pomocą testu niezależności.
rate <- function(p_val, alpha) {
  if(p_val < alpha) {
    return ("Odrzucamy hipoteze o niezaleznosci")
  }
  else {
    return ("Nie ma podstaw do odrzucenia hipotezy")
  }
}

tab <- table(mieszkania$Dzielnica, mieszkania$drogie)
# tab

test_mieszkania <- chisq.test(tab)
# test_mieszkania
odp$z4_b <- rate(test_mieszkania$p.value, 0.05)

# 5.
# a) Przetestować hipotezę, iż cena za m2 ma rozkład normalny.
norm_test <- shapiro.test(mieszkania$cena_za_m2)
rate <- function(p_val, alpha) {
  if(p_val < alpha) {
    return ("To nie jest rozklad normalny")
  }
  else {
    return ("Nie ma podstaw do odrzucenia hipotezy ze to rozklad normalny")
  }
}
odp$z5_a <- rate(norm_test$p.value, 0.05)

# b) Przetestować hipotezę, iż metraż mieszkań na Śródmieściu ma rozkład normalny.
srodmiescie_metraz <- mieszkania[mieszkania$Dzielnica == "Srodmiescie", ]$Metraz
head(srodmiescie_metraz)
test_sr_metraz <- shapiro.test(srodmiescie_metraz)
odp$z5_b <- rate(test_sr_metraz$p.value, 0.05)

#odp
odp
