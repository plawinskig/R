getwd() # get working directory
dir("data") # sprawdz czy jest csv

# a)
waga1 <- read.csv2("data/waga1.csv")
class(waga1)

# b)
head(waga1, 5)

# c)
str(waga1)
# 99 osobnikow, 4 zmienne
# wszystkie zmienne są liczbowe,
# w plec tlyko 0 lub 1

# d)
(sredni_wzrost <- mean(waga1$Wzrost))
(srednia_waga_przed <- mean(waga1$Waga_przed))

# e)
waga1$Wskaznik_wagi <- waga1$Waga_przed / (waga1$Wzrost / 100)^2
head(waga1)

# e2)
jest_kobieta <- waga1$plec == 1
wsk_ponad_25 <- waga1$Wskaznik_wagi > 25
(rama_kobiety_wsk_ponad_25 <- waga1[jest_kobieta & wsk_ponad_25,])

# f)
jest_mezczyzna <- waga1$plec == 0
rama_mezczyzni <- waga1[jest_mezczyzna,]
str(rama_mezczyzni)

# g)
wyzszy_niz_175cm <- waga1$Wzrost > 175
sum(wyzszy_niz_175cm)

