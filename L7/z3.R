odp <- list()
set.seed(12345)

# a. Wygenerować próbę 1000 realizacji z rozkładu wykładniczego o wartości oczekiwanej 1.
n <- 1000
trial <- rexp(n, rate = 1)
odp$a <- trial[1:5]

# b. Przetestować hipotezę iż próba ta pochodzi 
rate <- function(p_val, alpha) {
  if(p_val < alpha) {
    return ("Odrzucamy hipoteze")
  }
  else {
    return ("Nie ma podstaw do odrzucenia hipotezy")
  }
}
# i) z rozkładu normalnego o średniej 𝜇 = 1 i odchylenie 𝜎 = 1 , 
test_b_i <- ks.test(trial, "pnorm", mean = 1, sd = 1)
odp$b_i <- rate(test_b_i$p.value, 0.05)

# ii) z rozkładu wykładniczego z parametrem 𝜆 = 1.
test_b_ii <- ks.test(trial, "pexp", rate = 1)
odp$b_ii <- rate(test_b_ii$p.value, 0.05)

# c. Wygenerować próbę 1000 realizacji z rozkładu Gamma 
# o parametrze kształtu 100 a parametrze skali 1.
gamma_dist <- rgamma(n, shape = 100, scale = 1)
odp$c <- gamma_dist[1:5]

# d. Przetestować hipotezę iż próba ta pochodzi 
# i) z rozkładu normalnego o średniej 𝜇 = 100 i odchylenie 𝜎 = 10,
test_d_i <- ks.test(gamma_dist, "pnorm", mean = 100, sd = 10)
odp$d_i <- rate(test_d_i$p.value, 0.05)

# ii) z rozkładu Gamma z parametrami 100 i 1.
test_d_ii <- ks.test(gamma_dist, "pgamma", shape = 100, scale = 1)
odp$d_ii <- test_d_ii

# Uwaga: Suma n zmiennych o rozkładzie Exp(𝜆) ma rozkład Gamma(n,𝜆). 
# Zadanie to ilustruje centralne twierdzenie graniczne. 
# Parametry rozkładów z hipotez zerowych odpowiadają średniej 
# i odchyleniu standardowemu rozkładów, z którego wygenerowano realizacje.

# odp
odp



