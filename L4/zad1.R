# Korzystając z generatora liczb pseudolosowych z odpowiedniego rozkładu w R, wylosować
# set.seed(99)

# a) 5 000 realizacji z rozkładu jednostajnego na przedziale [0,1]
data_unif <- runif(5000, min = 0, max = 1)

# b) 3 000 realizacji z rozkładu normalnego o średniej 100 oraz odchyleniu standardowym 15.
data_norm <- rnorm(3000, mean = 100, sd = 15)

# c) [Nowe struktury danych – obiekt] W obu przypadkach wyznaczyć estymator gęstości
# rozkładu za pomocą 

# i) histogramu (polecenie „hist”),
# ii) estymatora jądrowego 
# (polecenie „density” – tworzy odpowiedni obiekt).
# Dla każdego z powyższych podpunktów proszę wygenerować wykres, np. histogram.

hist(data_unif,
     main = "Histogram X ~ U(0,1)",
     prob = TRUE
)
lines(density(data_unif), lwd = 2)

hist(data_norm,
     main = "Histogram X ~ N(100,15)",
     prob = TRUE
)
lines(density(data_norm), lwd = 2)



