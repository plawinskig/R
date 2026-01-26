odp <- list()

# 1. Tablica poniżej opisuje wyniki z rzutów kostką

# Wynik      1   2   3   4   5   6
# Frekwencja 171 200 168 213 226 222

freq <- c(171, 200, 168, 213, 226, 222)
num_throws <- sum(freq)
num_faces <- 6
prob <- 1/6
probs <- c(rep(prob, num_faces))
nums <- c(rep(1, 171), rep(2,200), rep(3,168), rep(4,213), rep(5,226), rep(6,222))
tab <- table(freq)
tab

# a) Wyznaczyć tablicę oczekiwanych frekwencji przy hipotezie że kostka jest symetryczna.
E <- rep(num_throws * prob, num_faces)
odp$a <- E

# b) Wyznaczyć realizację statystki testowej dla odpowiedniego testu zgodności.
O <- freq
chi_sq <- sum((O-E)^2/E)
odp$b <- chi_sq

# c) Wyznaczyć wartość p dla tego testu.
df <- length(freq) - 1
# p'stwo uzyskania wyniku gorszego niz statystyka (ogon)
p_val <- 1 - pchisq(chi_sq, df)
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

# e) Wykonać ten test za pomocą polecenia chisq.test
chisq_test <- chisq.test(x = freq, p = probs)
odp$e <- chisq_test

# odp
odp
