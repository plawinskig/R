odp <- list()
# 2. Tablica poniżej opisuje poziom wykształcenia według płci.

#             Wykształcenie Wyższe  Wykształcenie średnie
# Kobiety     200                   300
# Mężczyźni   150                   350

tab <- matrix(c(200, 300,
                150, 350
                ),
              nrow = 2, byrow = TRUE
              )
dimnames(tab) <- list(Plec = c("Kobiety", "Mezczyzni"),
                      Wyksztalcenie = c("Wyzsze", "Srednie")
                      )
tab

# a) Wyznaczyć tablicę oczekiwanych frekwencji przy hipotezie o niezależności tych cech.
O <- tab
total <- sum(O)
row_sums <- rowSums(O)
col_sums <- colSums(O)
E <- outer(row_sums, col_sums) / total
odp$a <- E

# b) Wyznaczyć realizację statystki testowej dla testu niezależności Pearsona
stat <- sum((O - E)^2 / E)
odp$b <- stat

# c) Wyznaczyć wartość p dla tego testu.
df <- (nrow(tab) - 1) * (nrow(tab) - 1)
# p'stwo uzyskania wyniku gorszego niz statystyka (ogon)
p_val <- 1 - pchisq(stat, df)
odp$c <- p_val

# d) Jaki jest wniosek tego testu?
rate <- function(p_val, alpha) {
  if(p_val < alpha) {
    return ("Odrzucamy hipoteze")
  }
  else {
    return ("Nie ma podstaw do odrzucenia hipotezy")
  }
}
odp$d <- rate(p_val, 0.05)

# e) Wykonać test ten za pomocą polecenia chisq.test
chisq_test <- chisq.test(tab, correct = FALSE) # to samo co recznie
odp$e <- chisq_test

# f) Wykonać test ten za pomocą dokładnego testu Fishera (fisher.test)
# fisher liczy dokladnie, nie uzywa aproksymacji chi-kwadrat
fish_test <- fisher.test(tab)
odp$f <- fish_test

# g) Wykonać test ten za pomocą polecenia prop.test 
# (dla tabelek 2× 2 działa to podobnie do testu chisq.test).
successes <- tab[, 1]
trials <- rowSums(tab)
prop_test <- prop.test(successes, trials, correct = FALSE)
odp$g <- prop_test

# odp
odp

