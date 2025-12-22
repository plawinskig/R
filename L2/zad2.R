# 2.
# a. Wczytać dane z pliku waga1.csv jako ramę danych. Plik zawiera:
#   • płeć (0-mężczyzna, 1-kobieta)
# • wzrost (w centymetrach)
# • wagi, przed i po studiach, (w kilogramach) dla próby studentów.

waga <- as.data.frame(read.csv2("waga1.csv")) 
typeof(waga)
class(waga)

# b. Wyświetlić pierwsze pięć wierszy tej ramy (nie licząc nazw kolumn).
head(waga, n = 5)

# c. Za pomocą polecenia „str”, opisać strukturę tej ramy (np. liczbę osobników, zmiennych).
str(waga)

# d. Wyznaczyć średni wzrost oraz średnią wagę przed studiami
mean(waga$Wzrost)
mean(waga$Waga_przed)

# e. Stworzyć nową kolumnę ramy zawierającą wskaźnik wagi (przed studiami)
# określony wzorem
# w=x/y2,
# gdzie x jest wagą (w kilogramach) oraz y jest wzrostem (w metrach)
waga$Wsk_wagi <- waga$Waga_przed / (waga$Wzrost / 100)
head(waga)

# f. Stworzyć ramę, który zawiera dane dotyczące wszystkich kobiet o wskaźniku
# wagi powyżej 25.
kobiety_wsk_ponad_25 <- waga[waga$plec == 1 & waga$Wsk_wagi > 25.0, ]
kobiety_wsk_ponad_25

# g. Stworzyć ramę, która zawiera dane dotyczące wszystkich mężczyzn.
tylko_mezczyzni <- waga[waga$plec == 0, ]
tylko_mezczyzni

# h. Podać ile osób jest wyższe od 175cm.
length(waga$Wzrost > 175)

