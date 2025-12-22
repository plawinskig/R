# Rzucono monetą 6 razy. Niech X będzie liczbą reszek. Wyznaczyć

n <- 6 # liczba prób - rzutów monetą
p <- 0.5 # p'stwo sukcesu - reszki

# i) P(X = 5)
k <- 5 # p'stwo że rzucając 6 razy monetą uzyskamy dokładnie 5 reszek (5 sukcesów w 6 próbach)
Pi <- dbinom(k, n, p) 
Pi

# ii) P(X ≥ 3)
k <- 3 # # p'stwo że rzucając 6 razy monetą uzyskamy co najmniej 3 reszki (3,4,5,6 sukcesów w 6 próbach)
Pii <- 1 - pbinom(k - 1, n, p) # k - 1 bo ~(X ≥ 3) = (X < 3) = (X ≤ 2)
Pii

# iii) P(2 ≤ X ≤ 4)
k1 <- 2 # od 2 do 4 sukcesów w 6 próbach
k2 <- 4
Piii <- pbinom(k2, n, p) - pbinom(k1 - 1, n, p)
Piii

# iv) Narysować wykres rozkładu zmiennej X (funkcja: plot, type=”h”)
x_values <- 0 : n
Piv <- dbinom(x_values, n, p)
plot(
  x_values, 
  Piv, 
  type = "h", # histogram
  lwd = 3, # line width
  las = 1, # poziome na osi y
  main = "Rozkład X ~ Bin(6, 0.5)",
  xlab = "Liczba reszek X",
  ylab = "Prawdopodobieństwo P(X = k)",
  )
grid()