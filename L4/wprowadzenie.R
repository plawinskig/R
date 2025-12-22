# generowanie liczb

# seed
# set.seed(55)

# literka r - sztuczne dane

runif(n = 10, min = 0, max = 1)
rnorm(n = 10, mean = 5, sd = 2)
rbinom(n = 10, size = 10, prob = 0.5)
rpois(n = 10, lambda = 3)

# histogram i gęstość

x <- rnorm(1000)
hist(x, main = "Histogram", probability = TRUE)
# Argument probability = TRUE sprawia, 
# że oś Y pokazuje gęstość, a nie liczebność. 
# Jest to konieczne, 
# jeśli chcesz na to nałożyć linię teoretyczną!

# Estymator Jądrowy (density): 
# To brzmi strasznie, ale to po prostu "wygładzony histogram". 
# R próbuje zgadnąć, jak wyglądałaby gładka krzywa dzwonowa 
# z Twoich poszarpanych danych.

lines(density(x), col="red")

# dwa sposoby na kostkę 
n <- 20 # rzutów
# A. Sposób informatyczny (sample)

# funkcja do losowania z worka
sample(x = 1:6, size = n, replace = TRUE)
# x - zbiór z któego losujemy (oczka 1-6)
# size - ile razy losujemy
# replace = TRUE - losowanie ze zwracaniem

# B. Sposób matematyczny (runif)

# przekształcenie runif
x <- floor(runif(n) * 6) + 1
# runif -> [0,1)
# 6*runif -> [0,6)
# floor(6*runif) -> {0,1,2,3,4,5}
# floor(6*runif)+1 -> {1,2,3,4,5,6}

# optymalizacja
# sprawdzaj najczęstsze rzeczy na początku

# metoda odwracania dystrybuanty

# liczby z rozkładu f(x)
# policz dystrybyantę F(x) = całka(f), c = 0 bo na przedziale [0,1]
# odwróć dystrybuantę x = F^-1(u)
# zastosuj w R: runif(x) = runif(F^-1(u))

# polecenia do raportowania

# zlicza ile razy wystąpiła każda liczba
table(x) 

# zmienia liczebności na ułamki (częstości)
prop.table(table(x))

# robi z tego ładną tabelkę




