# Pewien salon średnio sprzedaje trzy samochody tygodniowo. 
# Niech X będzie liczbą samochodów sprzedanych w ciągu 2 tygodni. 
# Zakładając, iż liczba samochodów sprzedanych przez firmę
# w dowolnym przedziale czasu ma rozkład Poissona, wyznaczyć

lambda <- 6 # średnia liczba zdarzeń w danym przedziale
# 3 samochody / 1 tydzień
# X = samochodzy / 2 tygodnie
# lambda = 3 sam / tyg * 2 tyg = 6 sam
# średnio w ciągu dwóch tyg. sprzedaje się 6 samochodów

# i) P(X = 5)
x <- 5 # p'stwo sprzedaży dokładnie 5 aut
Pi <- dpois(x, lambda)
Pi

# ii) P(X ≥ 4)
x <- 4 # p'stwo sprzedaży co najmniej 4 aut = przeciwne do p'stwo sprzedaży co najwyżej 3 aut 
Pii <- 1 - ppois(x - 1, lambda)
Pii

# iii) P(3 ≤ X ≤ 5)
k1 <- 3  # od 3 do 5 sprzedanych aut
k2 <- 5
Piii <- ppois(k2, lambda) - ppois(k1 - 1, lambda)
Piii

# iv) Narysować wykres rozkładu zmiennej X dla 0 ≤ 𝑥 ≤ 30.
x_values <- 0 : 30
Piv <- dpois(x_values, lambda)
plot(
  x_values, 
  Piv, 
  type = "h", # histogram
  lwd = 3, # line width
  las = 1, # poziome na osi y
  main = "Rozkład X ~ Poisson(6)",
  xlab = "Liczba sprzedanych samochodów X",
  ylab = "Prawdopodobieństwo P(X = k)",
)
grid()

