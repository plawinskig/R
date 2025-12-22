# Zmienna X ma rozkład jednostajny na przedziale [4; 12]. Wyznaczyć
a <- 4
b <- 12
# p'stwo zależy wyłącznie od długości podprzedziału, nie od położenia
# P(X < k) = P(X ≤ k) bo P(X = k) = 0

# i) 𝑃(𝑋 < 7)
k <- 7 # p'stwo że X przyjmie wartośc mniejszą niż 7
Pi <- punif(k, a, b)
Pi

# ii) 𝑃(5 < 𝑋 < 11)
k1 <- 5 # p'stwo że X przyjmie wartość od 5 do 11
k2 <- 11 # rozkład ciągły więc nie ma -1
Pii <- punif(k2, a, b) - punif(k1, a, b)
Pii

# iii) 𝑃(𝑋 > 10)
k <- 10
Piii <- 1 - punif(k, a, b)
Piii

# iv) Wyznaczyć x taki, że 𝑃(𝑋 > 𝑥) = 0.6
# P(X > x) = 0.6
# P(X < x) = 0.4
p <- 0.6
Qiv <- qunif(1 - p, a, b)
Qiv
# P(X > 7.2) = 0.6
Piv <- punif(Qiv, a, b, lower.tail = FALSE)
Piv # zgadza sie