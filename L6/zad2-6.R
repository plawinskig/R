waga <- read.csv2("waga1.csv")
head(waga)

p_val_name <- "p-value"
Z_name <- "Z-squared"

odp <- list()

ocen <- function(wek)
{
  if(wek[2] < 0.05)
  {
    return (c(wek, structure("odrzucam", names = "wniosek")))
  }
  else
  {
    return (c(wek, structure("dane są zgodne z hipotezą", names ="wniosek")))
  }
}


# 2. Zweryfikować hipotezę że wszyscy studenci (obu płci) 
# średnio przytyli się o 2kg w ciągu studiów 
# za pomocą polecenia „t.test”

z2_t_test <- function()
{
  t_test <- t.test(waga$Waga_po, waga$Waga_przed, paired = TRUE, mu = 2)
  
  p_val <- structure(t_test$p.value, names = p_val_name)
  
  c(t_test$statistic, p_val)
}

odp$z2 <- ocen(z2_t_test())


# 3. Przetestować hipotezę, 
# iż proporcja kobiet ważących więcej niż 70kg po studiach 
# nie różni się od proporcji mężczyzn ważących więcej niż 70kg po studiach 
# (wskazówka: najpierw stworzyć zmienną binarną 
# określającą czy ktoś waży więcej niż 70kg po studiach, 
# a potem sporządzić odpowiednią tablicę rozdzielczą)

waga$czy_wazy_ponad_70kg <- waga$Waga_po > 70

z3_prop_test <- function()
{
  tabela <- table(waga$plec, waga$czy_wazy_ponad_70kg)
  p_test <- prop.test(tabela)
  
  p_val <- structure(p_test$p.value, names = p_val_name)
  c(p_test$statistic, p_val)
}

odp$z3 <- ocen(z3_prop_test())


# 4. Przetestować hipotezę iż średnio mężczyźni są o 5cm wyżsi niż kobiety.

z4_t_test <- function()
{
  mezczyzni <- waga[waga$plec == 0, ]
  kobiety <- waga[waga$plec == 1, ]
  
  t_test <- t.test(mezczyzni$Wzrost, kobiety$Wzrost, mu = 5)
  
  p_val <- structure(t_test$p.value, names = p_val_name)
  c(t_test$statistic, p_val)
}

odp$z4 <- ocen(z4_t_test())

# 5. Przetestować hipotezę iż 80% studentów (wszystkich) przybiera na wadze w trakcie studiów
# (wskazówka: najpierw wyznaczyć ile każdy student przybrał na wadze).

waga$przytyl <- waga$Waga_po > waga$Waga_przed

z5_prop_test <- function()
{
  licz_przytyli <- sum(waga$przytyl)
  licz_wszyscy <- nrow(waga)
  
  p_test <- prop.test(licz_przytyli, licz_wszyscy, p = 0.8)
  
  p_val <- structure(p_test$p.value, names = p_val_name)
  
  c(p_test$statistic, p_val)
}

odp$z5 <- ocen(z5_prop_test())

# 6. Zweryfikować hipotezę że wszyscy studenci (męskich) 
# średnio przytyli się o 4kg w ciągu studiów.

z6_t_test <- function()
{
  mezczyzni <- waga[waga$plec == 0, ]
  
  t_test <- t.test(mezczyzni$Waga_po, mezczyzni$Waga_przed, paired = TRUE, mu = 4)
  
  p_val <- structure(t_test$p.value, names = p_val_name)
  
  c(t_test$statistic, p_val)
}

odp$z6 <- ocen(z6_t_test())

# odp
odp
