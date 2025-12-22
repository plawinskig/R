# 3.
# a. Wczytać dane z pliku mieszkania.csv jako ramę danych. Plik zawiera dane
# dotyczące ofert nieruchomości we Wrocławiu (zmienne: dzielnica, metraż, liczba pokoi, piętro, cena)
mieszkania <- as.data.frame(read.csv2("mieszkania.csv"))

# b. Wyświetlić pierwsze sześć wierszy tej ramy (nie licząc nazw kolumn).
head(mieszkania, n = 6)

# c. Za pomocą polecenia „str”, opisać strukturę tej ramy (np. liczbę osobników, zmiennych).
str(mieszkania)

# d. Wyznaczyć średni metraż oraz średnią cenę
mean(mieszkania$Metraz)
mean(mieszkania$Cena)

# e. Dopisać cenę za m2 do oryginalnej ramki jako nową kolumnę
mieszkania$Cena_za_m2 <- mieszkania$Cena / mieszkania$Metraz
head(mieszkania)

# f. Stworzyć ramę, który zawiera dane dotyczące wszystkich ofert na Psim Polu o
# cenie poniżej 400 000PLN.
psie_pole_cena_ponizej_400kPLN <- mieszkania[mieszkania$Dzielnica == "Psie Pole" & mieszkania$Cena < 400000, ]
psie_pole_cena_ponizej_400kPLN

# g. Stworzyć ramę, która zawiera dane dotyczące wszystkich ofert w Śródmieściu o
# metrażu powyżej 60m2.
srodmiescie_metraz_powyzej_60m2 <- mieszkania[mieszkania$Dzielnica == "Srodmiescie" & mieszkania$Metraz > 60, ]
srodmiescie_metraz_powyzej_60m2

# h. Podać ile jest mieszkań o metrażu większym niż 60m2 oraz o cenie poniżej 350000PLN.
nrow(mieszkania[mieszkania$Metraz > 60 & mieszkania$Cena < 350000, ])
