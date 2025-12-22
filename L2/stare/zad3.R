getwd() # get working directory
dir("data") # sprawdz czy jest csv

# a)
mieszkania <- read.csv2("data/mieszkania.csv")
class(mieszkania)

# b)
head(mieszkania, 6)

# c)
str(mieszkania)
# 1170 mieszkan, 5 zmiennych
# pierwsza zmienna jest tekstowa
# reszta jest liczbowa

# d)
(sredni_metraz <- mean(mieszkania$Metraz))

# e)
mieszkania$cena_m2 <- mieszkania$Cena / mieszkania$Metraz
head(mieszkania)

# f)
na_psim_polu <- mieszkania$Dzielnica == "Psie Pole"
cena_ponizej_400k <- mieszkania$Cena < 400000
(rama_psie_pole_ponizej_400k <- mieszkania[na_psim_polu & cena_ponizej_400k,])

# g)
w_srodmiesciu <- mieszkania$Dzielnica == "Srodmiescie"
metraz_powyzej_60m2 <- mieszkania$Metraz > 60
(rama_srodmiescie_powyzej_60m2 <- mieszkania[w_srodmiesciu & metraz_powyzej_60m2,])

# h)
cena_ponizej_350k <- mieszkania$Cena < 350000
sum(metraz_powyzej_60m2 & cena_ponizej_350k)
