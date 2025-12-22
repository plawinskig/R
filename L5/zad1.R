# Średni wskaźnik inteligencji (IQ) dla próby 100 studentów wynosi 109. Wariancja
# z próby wynosi 225. Spośród tych studentów, 30 ma IQ wyższy niż 115..
liczebnosc_proby <- 100
sr_proby <- 109
var_proby <- 225
std_proby <- sqrt(var_proby)
ile_powyzej_115 <- 30


# a) Przetestować hipotezę, że 35% wszystkich studentów ma IQ wyższy niż 115 
hipoteza <- 0.35

# i) za pomocą testu Z, 

procent_powyzej_115 <- ile_powyzej_115 / liczebnosc_proby

p <- hipoteza
SE <- sqrt(p * (1-p) / liczebnosc_proby)

Z <- (procent_powyzej_115 - hipoteza) / SE

wynik_a_recznie <- Z^2

# ii) za pomocą polecenia prop.test

p_test <- prop.test(x = ile_powyzej_115, 
          n = liczebnosc_proby, 
          p = hipoteza, 
          correct = FALSE
          )
p_test
names(p_test)
wynik_a_automat <- as.numeric(p_test$statistic)

wynik_a_recznie
wynik_a_automat


# b) Wyznaczyć przedział ufności dla proporcji wszystkich studentów mającej
# IQ wyższy niż 115 na poziomie ufności 99% za pomocą 
poziom_ufnosci_b <- 0.99

# i) przybliżenia do rozkładu normalnego 

estymator <- procent_powyzej_115
poziom_istotności_b <- 1 - poziom_ufnosci_b
x <- 1 - poziom_istotności_b / 2
#kwantyl <- qt(x, df = liczebnosc_proby-1)
kwantyl <- qnorm(x)
p <- procent_powyzej_115
SE <- sqrt(p * (1-p) / liczebnosc_proby)

promien <- kwantyl * SE

przedzial_ufnosci_b <- c(estymator - promien, estymator + promien)
wynik_b_recznie <- przedzial_ufnosci_b

# ii) prop.test

p_test
names(p_test)
wynik_b_automat <- as.numeric(p_test$conf.int) 

wynik_b_automat
wynik_b_recznie

# c) Wyznaczyć przedział ufności dla średniego IQ wszystkich studentów na
# poziomie ufności 
# i) 90% w oparciu o wzór na przedział ufności dla dużej
# próby (czyli w oparciu o wartość krytyczną dla rozkładu normalnego).
poziom_ufnosci_c <- 0.9
poziom_istotności_c <- 1 - poziom_ufnosci_c


# d) Wyznaczyć przedział ufności dla średniego IQ wszystkich studentów na
# poziomie ufności 90% w oparciu o wartość krytyczną dla rozkładu
# Studenta.
# e) Przetestować hipotezę, że średni IQ studentów wynosi 115. Wyznaczyć
# odpowiednią wartość p za pomocą i) testu Z, ii) testu T (studenta).




