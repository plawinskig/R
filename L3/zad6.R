# Rzucono kostką 180 razy. Niech X będzie liczbą jedynek. Wyznaczyć
size <- 180
prob <- 1/6

# i) P(X = 27)
dbinom(x = 27, size, prob)

# ii) P(X ≥ 32)
pbinom(q = 32 - 1, size, prob, lower.tail = FALSE)

# iii) P(X < 29)
pbinom(q = 29 - 1, size, prob)

# iv) P(25 ≤ X ≤ 33)
pbinom(q = 33, size, prob) - pbinom(q = 25 - 1, size, prob)


