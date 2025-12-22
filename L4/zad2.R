# a.

# i. Zasymulować 600 rzutów kostką 
# (odpowiednio przekształcić realizacje z rozkładu jednostajnego na [0,1]).
rzuty <- floor(runif(600)*6) + 1
rzuty[0:40]

# ii. Wyznaczyć średni wynik oraz wariancję z próby 
# [porównać z wartością oczekiwaną 3,5 oraz wariancją 35/12].
mean(rzuty)
var(rzuty)
abs(mean(rzuty) - 3.5)
abs(var(rzuty) - 35/12)

# iii. Wyznaczyć rozkład częstości dla tych wyników, polecenie - 
# table [porównać z dyskretnym rozkładem jednostajnym].
freq_tab <- table(rzuty)

# iv. Przekształcić tablicę w ramkę danych za pomocą polecenia „as.data.frame”.
# Wyświetlić tę ramkę oraz wyznaczyć wariancję tych częstości.
freq_frame <- as.data.frame(freq_tab)
freq_frame

var(freq_frame$Freq)

# b. Zasymulować 600 rzutów kostką za pomocą procedury wyboru elementu ze zbioru z
# zwracaniem (polecenie „sample”). 

rzuty_sample <- sample(x = 1:6, size = 600, replace = TRUE)
rzuty_sample[0:40]

mean(rzuty_sample)
var(rzuty_sample)