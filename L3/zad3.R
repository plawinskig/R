# Zmienna X ma rozkład jednostajny na przedziale [4; 12]. Wyznaczyć
min <- 4
max <- 12

# i) 𝑃(𝑋 < 7)
punif(q = 7, min, max)

# ii) 𝑃(5 < 𝑋 < 11)
punif(q = 11, min, max) - punif(q = 5, min, max)

# iii) 𝑃(𝑋 > 10)
punif(q = 10, min, max, lower.tail = FALSE)
1 - punif(q = 10, min, max)

# iv) Wyznaczyć x taki, że 𝑃(𝑋 > 𝑥) = 0.6
qunif(p = 0.6, min, max, lower.tail = FALSE)
qunif(p = 1 - 0.6, min, max)
