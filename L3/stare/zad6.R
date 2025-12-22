# Rzucono kostką 180 razy. Niech X będzie liczbą jedynek. Wyznaczyć
n <- 180 # liczba prob
p <- 1/6 # p'stwo sukcesu
# X ~ Bin(180, 1/6)

# i) P(X = 27)
# dokładnie 27 sukcesów (jedynek) w 180 próbach (rzutach)
k <- 27
Pi <- dbinom(x = k, size = n, prob = p)
Pi

# ii) P(X ≥ 32)
# co najmniej 32 jedynki
# q = 31 bo P(X ≥ 32) = P(X > 31)
k <- 32
Pii <- pbinom(q = k - 1, size = n, prob = p, lower.tail = FALSE)
Pii

# iii) P(X < 29)
# mniej niz 29 jedynek
# q = 28 bo P(X < 29) = P(X <= 28)
k <- 29
Piii <- pbinom(q = k - 1, size = n, prob = p)
Piii

# iv) P(25 ≤ X ≤ 33)
# od 25 do 33 jedynek
# P(25 ≤ X ≤ 33) = P(X ≤ 33) - P(25 < X)
k1 <- 25
k2 <- 33
Piv <- pbinom(q = k2, size = n, prob = p) - pbinom(q = k1 - 1, size = n, prob = p)
Piv

