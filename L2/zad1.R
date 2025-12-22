# 1.
# a. Stworzyć następującą ramę danych o nazwie „oceny”
# Imie Plec Analiza Algebra
# Krzysztof m 3.5 4.0
# Maria k 4.5 5.0
# Henryk m 5.0 4.0
# Anna k 4.5 3.5

oceny <- data.frame(
  Imie = c("Krzysztof", "Maria", "Henryk", "Anna"),
  Plec = c("m", "k", "m", "k"),
  Analiza = c(3.5, 4.5, 5.0, 4.5),
  Algebra = c(4.0, 5.0, 4.0, 3.5)
)
oceny

# b. Wyświetlić pierwsze dwa wiersze tej ramy (nie licząc nazw kolumn).
head(oceny, n = 2)

# c. Za pomocą polecenia „str”, opisać strukturę tej ramy (np. liczbę osobników, zmiennych).
str(oceny) # 4 obs. of 4 variables

# d. Wyznaczyć średnią ocenę z analizy.
mean(oceny$Analiza)

# e. Stworzyć nową kolumnę w ramie zawierającą średnią ocenę z obu przedmiotów dla każdego studenta
oceny$Srednia <- (oceny$Analiza + oceny$Algebra) / 2
oceny

# f. Stworzyć ramę, która zawiera wyniki wszystkich kobiet
tylko_kobiety <- oceny[oceny$Plec == "k", ]
tylko_kobiety

# g. Stworzyć ramę, który zawiera wyniki każdego studenta, który dostał co najmniej
# 4.5 z jednego z tych przedmiotów.

min_4.5 <- oceny[oceny$Analiza >= 4.5 | oceny$Algebra >= 4.5, ]
min_4.5

# h. Podać ile osób dostało co najmniej 4.5 z analizy
nrow(oceny[oceny$Analiza >= 4.5, ])
