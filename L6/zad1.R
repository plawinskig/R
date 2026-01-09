odp <- list()

p_val_name <- "p-value"
Z_name <- "Z-squared"

ocen <- function(wek)
{
  print(wek[2])
  if(wek[2] < 0.05)
  {
    return (c(wek, structure("odrzucam", names = "wniosek")))
  }
  else
  {
    return (c(wek, structure("dane są zgodne z hipotezą", names ="wniosek")))
  }
}

# a. 220 z 520 kobiet ma wyższe wykształcenie, a 165 z 480 mężczyzn, z który. 
# Przetestować hipotezę, 
# iż prawdopodobieństwo że osoba kończy studia 
# nie zależy od płci za pomocą 

# i) testu Z, 

k_wyzsze_wyk <- 220
k_wszystkie <- 520
m_wyzsze_wyk <- 165
m_wszyscy <- 480

a_test_Z <- function()
{
  prop_k <- k_wyzsze_wyk / k_wszystkie
  prop_m <- m_wyzsze_wyk / m_wszyscy
  prop_wsp <- (k_wyzsze_wyk + m_wyzsze_wyk) / (k_wszystkie + m_wszyscy)
  
  SE <- sqrt(prop_wsp * (1 - prop_wsp) * (1 / k_wszystkie + 1 / m_wszyscy))
  
  Z <- (prop_k - prop_m) / SE
  names(Z) <- Z_name
  
  p_val <- 2 * (1 - pnorm(abs(Z)))
  names(p_val) <- p_val_name
  
  c(Z^2, p_val)
}

odp$a_i <- ocen(a_test_Z())

# ii) polecenia „prop.test”.

a_prop_test <- function()
{
  p_test <- prop.test(
    c(k_wyzsze_wyk, m_wyzsze_wyk),
    c(k_wszystkie, m_wszyscy)
  )
  
  p_val <- structure(p_test$p.value, names = p_val_name)
  c(p_test$statistic, p_val)
}

odp$a_ii <- ocen(a_prop_test())

# b. Stworzyć tablicę rozdzielczą (2 × 2) 
# przedstawiającą frekwencje wszystkich możliwych
# kombinacji wartości zmiennej „płeć” i zmiennej „wykształcenie” 
# (0-nie ma wyższego wykształcenia, 1- ma wyższe wykształcenie).

k_bez_wyzsz_wyk <- k_wszystkie - k_wyzsze_wyk
m_bez_wyzsz_wyk <- m_wszyscy - m_wyzsze_wyk

b_tablica_rozdzielcza <- function()
{
  dane <- c(k_wyzsze_wyk, k_bez_wyzsz_wyk, 
            m_wyzsze_wyk, m_bez_wyzsz_wyk
  )
  
  tabela <- matrix(dane, nrow = 2, byrow = TRUE)
  rownames(tabela) <- c("Kobiety", "Mezczyzni")
  colnames(tabela) <- c("Wyzsze", "Brak")
  
  tabela
}

odp$b <- b_tablica_rozdzielcza()

# c. Korzystając z tej tablicy, 
# przetestować hipotezę że wykształcenie nie zależy od płci za pomocą 

# i) polecenia „chisq.test”, 

c_chisq_test <- function()
{
  c_test <- chisq.test(b_tablica_rozdzielcza(), correct = FALSE)
  
  p_val <- structure(c_test$p.value, names = p_val_name)
  
  c(c_test$statistic, p_val)
}

odp$c_i <- ocen(c_chisq_test())

# ii) polecenia „fisher.test”.

c_fisher_test <- function()
{
  f_test <- fisher.test(b_tablica_rozdzielcza())

  p_val <- structure(f_test$p.value, names = p_val_name)

  c(NA, p_val)
}

odp$c_ii <- ocen(c_fisher_test())

# d. Średni wzrost tych 520 kobiet wynosi 166cm, a wariancja 100cm2. 
# Średni wzrost tych 480 mężczyzn wynosi 174cm, a wariancja 121cm2. 
# Przetestować hipotezę, iż średni wzrost nie zależy od płci za pomocą testu Z.

k_sr_wzrost <- 166
k_war_wzrost <- 100
m_sr_wzrost <- 174
m_war_wzrost <- 121

d_test_Z <- function()
{
  SE <- sqrt((k_war_wzrost / k_wszystkie + m_war_wzrost / m_wszyscy))
  
  Z <- (k_sr_wzrost - m_sr_wzrost) / SE
  names(Z) <- Z_name
  
  p_val <- 2 * (1 - pnorm(abs(Z)))
  names(p_val) <- p_val_name
  
  c(Z^2, p_val)
}

odp$d <- ocen(d_test_Z())

#odp
odp
