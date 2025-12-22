# Pewien salon średnio sprzedaje trzy samochody tygodniowo. Niech X będzie liczbą samochodów
# sprzedanych w ciągu 2 tygodni. Zakładając, iż liczba samochodów sprzedanych przez firmę w
# dowolnym przedziale czasu ma rozkład Poissona, wyznaczyć
lambda <- 3 # sam / tyg
lambda <- 3 * 2 # 3 sam / tyg * 2 tyg = 6 sam

# i) P(X = 5)
dpois(x = 5, lambda)

# ii) P(X ≥ 4)
1 - ppois(q = 4 - 1, lambda)

# iii) P(3 ≤ X ≤ 5)
ppois(q = 5, lambda) - ppois(q = 3 - 1, lambda)

# iv) Narysować wykres rozkładu zmiennej X dla 0 ≤ 𝑥 ≤ 30.
x <- 0:30
y <- dpois(x, lambda)
plot(x, y,
     type = "h",
     lwd = 3,
     las = TRUE,
     main = "Rozkład Pois(6)",
     xlab = "Liczba samochodów",
     ylab = "P'stwo"
     )






