# 1. porównywanie proporcji

sukcesy_kobiet <- 66
sukcesy_mezczyzn <- 40
wszystkie_kobiety <- 100
wszyscy_mezczyzni <- 60

prop.test(
  x = c(sukcesy_kobiet, sukcesy_mezczyzn),
  n = c(wszystkie_kobiety, wszyscy_mezczyzni)
  )


# 2. tablice rozdzielce

# tabelka <- table(dane$Plec, dane$Wyksztalcenie)

# chisq.test
# fisher.test


# 3. starcie średnich

# Z = (sr1 - sr2) / sqrt(var1/n1 + var2/n2)
# p = 2 * (1 - pnorm(abs(Z)))


# 4. próby zależne vs niezależne

# t.test(dane$Waga_po, dane$Waga_przed, paired = TRUE)


