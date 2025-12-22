# Rzucono monetą 6 razy. Niech X będzie liczbą reszek. Wyznaczyć
size <- 6
prob <- 0.5

# i) P(X = 5)
dbinom(x = 5, size, prob)

# ii) P(X ≥ 3)
1 - pbinom(q = 3 - 1, size, prob)

# iii) P(2 ≤ X ≤ 4)
pbinom(q = 4, size, prob) - pbinom(q = 2 - 1, size, prob)

# iv) Narysować wykres rozkładu zmiennej X (funkcja: plot, type=”h”).
x <- 0:size
y <- dbinom(x, size, prob)
plot(x, y, 
     type = "h",
     lwd = 3,
     las = 1,
     main = "Rozkład X ~ Bin(6, 0.5)",
     xlab = "Liczba reszek X",
     ylab = "Prawdopodobieństwo P(X = k)",
     )

