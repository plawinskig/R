getwd() # get working directory
dir(getwd()) # is csv available

# tworzenie ramy danych

moje_dane <- data.frame(
  Imie = c("Krzysztof", "Maria", "Henryk", "Daniela"),
  Plec = c("m", "k", "m", "k"),
  Ocena1 = c(3.5, 5.0, 4.0, 3.5),
  Ocena2 = c(3.5, 4.0, 3.0, 5.0)
)
moje_dane
class(moje_dane)

# wczytywanie danych z zewnątrz

dane_z_pliku <- read.csv2("mieszkania.csv")
# lub read.csv("plik.csv", sep = ";", dec = ",")
head(dane_z_pliku)

# operator dolara ($)

moje_dane # cała tabela
moje_dane$Ocena1 # kolumna z ocenami jako wektor
mean(moje_dane$Ocena1) # średnia

# podglądanie ramy

head(dane_z_pliku, n = 2)
str(dane_z_pliku) # struktura

# tworzenie nowych kolumn

moje_dane$Srednia <- (moje_dane$Ocena1 + moje_dane$Ocena2) / 2
moje_dane

# filtrowanie
# Dane[WIERSZE, KOLUMNY] - filtruj po WIERSZE i KOLUMNY
# Dane[WIERSZE, ] - filtruj po WIERSZE, weź wszystkie kolumny
# Dane[, KOLUMNY] - weź wszystkie wiersze, filtruj po KOLUMNY

(tylko_kobiety <- moje_dane[moje_dane$Plec == "k", ])

# liczenie wierszy
nrow(tylko_kobiety) # num of rows

sum(moje_dane$Plec == "k") # TRUE = 1, FALSE = 0


