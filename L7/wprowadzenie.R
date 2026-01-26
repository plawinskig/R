# chi kwadrat

# X^2 = sum[(O-E)^2 / E]

# rzut kostka 1-6
chisq.test(
  x = c(155, 192, 168, 200, 171, 222), # wyniki
  p = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)  # p'stwa
)

# tabela teoretyczna vs podana
# oczekiwane frekwencje (expected freqencies)
# dla komórki i,j:

# Eij = row_sum * col_sum / total_sum
tabela <- table(c(4,5,3,4,4,2,5,3,4,5))
tabela <- table(rpois(100,5))
chisq.test(tabela)
chisq.test(tabela)$expected

# t.test dziala tylko dla rozkladu normalnego
# sprawdzenie czy mozna uzywac:

shapiro.test() 
# N < 5000
# H0 - dane sa normalne
# p < 0.05 -> dane nie sa normalne (nie uzywamy t.test)

ks.test()
# porownanie z dowolnym rozkladem
# mierzenie najwiekszej odleglosci miedzy dystrybuantami
ks.test(dane, "pnorm", mean = ..., sd = ...)

# regresja liniowa
# Y = B0 + B1*X + e

# Y - zmienna zalezna (np. cena)
# X - zmienna niezalezna (np. metraz)
# B1 - wspolczynnik kierunkowy

model <- lm(Y ~ X, data = dane) # lm = linear model
summary(model)

# estimates - B0, B1
# Pr(>|t|) - czy wpluyw metrazu jest istotny statystycznie (***)
# multiple R-squared (R^2) - jak dobrze model pasuje (0-1)
# np. % zmiennosci ceny wyjasniony przez metraz

# wykres
plot(dane$X, dane$Y)
abline(model, col="red")






