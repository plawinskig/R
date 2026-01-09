odp <- list()
fail <- structure("odrzucam", names = "wniosek")
succ <- structure("dane są zgodne z hipotezą", names ="wniosek")
p_val_name <- "p-value"
Z_name <- "Z-squared"

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
a_test_Z() # p = 0.01 < 0.05 -> odrzucam - wyksztalcenie zależy od płci
odp$a_i <- c(a_test_Z(), fail)

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

a_prop_test() # p = 0.01 < 0.05 odrzucam
odp$a_ii <- c(a_prop_test(), fail)

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

c_chisq_test()
# p-value = 0.01001 < 0.05 - odrzucam
odp$c_i <- c(c_chisq_test(), fail)

# ii) polecenia „fisher.test”.

c_fisher_test <- function()
{
  f_test <- fisher.test(b_tablica_rozdzielcza())
  
  p_val <- structure(f_test$p.value, names = p_val_name)
  
  c(f_test$statistic, p_val)
}

c_fisher_test()
# p-value = 0.01117571 < 0.05 - odrzucam
odp$c_ii <- c(c_fisher_test(), fail)

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

d_test_Z()
# p -> 0, Z - ogromne - duza zaleznosc
odp$d <- c(d_test_Z(), fail)

#odp
odp
