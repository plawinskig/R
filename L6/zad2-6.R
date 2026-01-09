waga <- read.csv2("waga1.csv")
head(waga)

fail <- structure("odrzucam", names = "wniosek")
succ <- structure("dane są zgodne z hipotezą", names ="wniosek")
p_val_name <- "p-value"
Z_name <- "Z-squared"

odp <- list()

# 2. Zweryfikować hipotezę że wszyscy studenci (obu płci) 
# średnio przytyli się o 2kg w ciągu studiów 
# za pomocą polecenia „t.test”

z2_t_test <- function()
{
  t_test <- t.test(waga$Waga_przed, waga$Waga_po, paired = TRUE)
  
  p_val <- structure(t_test$p.value, names = p_val_name)
  
  c(t_test$statistic, p_val)
}
z2_t_test()
# p = 1.963406e-15 < 0.05 - odrzucam
odp$z2 <- c(z2_t_test(), fail)

# 3. Przetestować hipotezę, 
# iż proporcja kobiet ważących więcej niż 70kg po studiach 
# nie różni się od proporcji mężczyzn ważących więcej niż 70kg po studiach 
# (wskazówka: najpierw stworzyć zmienną binarną 
# określającą czy ktoś waży więcej niż 70kg po studiach, 
# a potem sporządzić odpowiednią tablicę rozdzielczą)

waga$czy_wazy_ponad_70kg <- waga$Waga_po > 70

z3_t_test() <- function()
{
  tabela <- table(waga$plec, waga$czy_wazy_ponad_70kg)
  t.test(tabela)
}

# 4. Przetestować hipotezę iż średnio mężczyźni są o 5cm wyżsi niż kobiety.
# 5. Przetestować hipotezę iż 80% studentów (wszystkich) przybiera na wadze w trakcie studiów
# (wskazówka: najpierw wyznaczyć ile każdy student przybrał na wadze).
# 6. Zweryfikować hipotezę że wszyscy studenci (męskich) 
# średnio przytyli się o 4kg w ciągu studiów.

# odp
odp