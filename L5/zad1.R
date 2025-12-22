# Średni wskaźnik inteligencji (IQ) dla próby 100 studentów wynosi 109. Wariancja
# z próby wynosi 225. Spośród tych studentów, 30 ma IQ wyższy niż 115..
liczebnosc_proby <- 100
sr_proby <- 109
var_proby <- 225
std_proby <- sqrt(var_proby)
ile_powyzej_115 <- 30


# a) Przetestować hipotezę, że 35% wszystkich studentów ma IQ wyższy niż 115 
a_hipoteza <- 0.35

# i) za pomocą testu Z, 

a_test_Z <- function(hipoteza)
{
  procent_powyzej_115 <- ile_powyzej_115 / liczebnosc_proby
  
  p <- hipoteza
  SE <- sqrt(p * (1-p) / liczebnosc_proby)
  
  Z <- (procent_powyzej_115 - hipoteza) / SE
  
  return (Z^2)
}

a_wynik_recznie <- a_test_Z(a_hipoteza)

# ii) za pomocą polecenia prop.test

a_prop_test <- function(hipoteza)
{
  p_test <- prop.test(x = ile_powyzej_115, 
                      n = liczebnosc_proby, 
                      p = hipoteza, 
                      correct = FALSE
  )

  return (as.numeric(p_test$statistic))
}
a_wynik_automat <- a_prop_test(a_hipoteza)

a_wynik_recznie
a_wynik_automat


# b) Wyznaczyć przedział ufności dla proporcji wszystkich studentów mającej
# IQ wyższy niż 115 na poziomie ufności 99% za pomocą 
b_poziom_ufnosci <- 0.99

# i) przybliżenia do rozkładu normalnego 

b_prz_ufn_dla_proporcji <- function(poziom_ufnosci)
{
  procent_powyzej_115 <- ile_powyzej_115 / liczebnosc_proby
  estymator <- procent_powyzej_115
  
  poziom_istotności <- 1 - poziom_ufnosci
  x <- 1 - poziom_istotności / 2
  #kwantyl <- qt(x, df = liczebnosc_proby-1)
  kwantyl <- qnorm(x)
  
  p <- procent_powyzej_115
  SE <- sqrt(p * (1-p) / liczebnosc_proby)
  
  promien <- kwantyl * SE
  
  przedzial_ufnosci <- c(estymator - promien, estymator + promien)
  return(przedzial_ufnosci)
}

b_wynik_recznie <- b_prz_ufn_dla_proporcji(b_poziom_ufnosci)

# ii) prop.test

b_prop_test <- function(hipoteza)
{
  p_test <- prop.test(x = ile_powyzej_115, 
                      n = liczebnosc_proby, 
                      p = hipoteza, 
                      correct = FALSE
  )
  
  return (as.numeric(p_test$conf.int))
}
b_wynik_automat <- b_prop_test(a_hipoteza)

b_wynik_automat
b_wynik_recznie

# c) Wyznaczyć przedział ufności dla średniego IQ wszystkich studentów na
# poziomie ufności 

cd_oblicz_przedzial <- function(poziom_ufnosci, kwantyl_wartosc) 
{
  estymator <- sr_proby
  SE <- std_proby / sqrt(liczebnosc_proby)
  promien <- kwantyl_wartosc * SE
  
  return(c(estymator - promien, estymator + promien))
}

# i) 90% w oparciu o wzór na przedział ufności dla dużej
# próby (czyli w oparciu o wartość krytyczną dla rozkładu normalnego).
c_poziom_ufnosci <- 0.9

c_prz_ufn_dla_sredniej <- function(poziom_ufnosci)
{
  poziom_istotności <- 1 - poziom_ufnosci
  x <- 1 - poziom_istotności / 2
  kwantyl <- qnorm(x)

  return(cd_oblicz_przedzial(poziom_ufnosci, kwantyl))
}
c_wynik <- c_prz_ufn_dla_sredniej(c_poziom_ufnosci)

# d) Wyznaczyć przedział ufności dla średniego IQ wszystkich studentów na
# poziomie ufności 90% w oparciu o wartość krytyczną dla rozkładu
# Studenta.
d_poziom_ufnosci <- 0.9

d_prz_ufn_t_student <- function(poziom_ufnosci)
{
  poziom_istotności <- 1 - poziom_ufnosci
  x <- 1 - poziom_istotności / 2
  kwantyl <- qt(x, df = liczebnosc_proby - 1)
  
  return(cd_oblicz_przedzial(poziom_ufnosci, kwantyl))
}
d_wynik <- d_prz_ufn_t_student(d_poziom_ufnosci)

c_wynik
d_wynik

# e) Przetestować hipotezę, że średni IQ studentów wynosi 115. Wyznaczyć
# odpowiednią wartość p za pomocą 
e_hipoteza <- 115

e_policz_statystyke <- function(hipoteza)
{
  SE <- std_proby / sqrt(liczebnosc_proby)
  
  statystyka <- (sr_proby - hipoteza) / SE
  
  return (statystyka)
}

# i) testu Z, 

e_test_Z <- function(hipoteza)
{
  return (2 * pnorm(e_policz_statystyke(hipoteza)))
}
e_wynik_recznie <- e_test_Z(e_hipoteza)

# ii) testu T (studenta).

e_test_T <- function(hipoteza)
{
  return (2 * pt(e_policz_statystyke(hipoteza), df = liczebnosc_proby - 1))
}
e_wynik_automat <- e_test_T(e_hipoteza)

e_wynik_recznie
e_wynik_automat

# if p is low the null must go

a_wynik_automat
a_wynik_recznie
b_wynik_automat
b_wynik_recznie
c_wynik
d_wynik
e_wynik_automat
e_wynik_recznie

