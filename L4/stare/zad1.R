# set.seed(1331)

# Korzystając z generatora liczb pseudolosowych z odpowiedniego rozkładu w R, wylosować
# a) 5 000 realizacji z rozkładu jednostajnego na przedziale [0,1]

n <- 5000
a <- 0
b <- 1
data_uniform <- runif(n, a, b)

# b) 3 000 realizacji z rozkładu normalnego o średniej 100 oraz odchyleniu standardowym 15.

n <- 3000
sr <- 100
std <- 15
data_normal <- rnorm(n, sr, std)

# c) [Nowe struktury danych – obiekt] W obu przypadkach wyznaczyć estymator gęstości rozkładu za pomocą 
# i) histogramu (polecenie „hist”), 

hist(data_uniform,
     prob = TRUE,
     main = "Rozkład jednostajny histogram i estymator jądrowy",
     xlab = "Wartość",
     ylab = "Gęstość"
     )

# ii) estymatora jądrowego (polecenie „density” – tworzy odpowiedni obiekt). 

density_uniform <- density(data_uniform)
lines(density_uniform, lwd = 2)
