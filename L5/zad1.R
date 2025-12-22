# Średni wskaźnik inteligencji (IQ) dla próby 100 studentów wynosi 109. Wariancja
# z próby wynosi 225. Spośród tych studentów, 30 ma IQ wyższy niż 115..
liczebnosc_proby <- 100
sr_proby <- 109
var_proby <- 225
std_proby <- sqrt(var_proby)
ile_powyzej_115 <- 30

odp <- list()

# a) Przetestować hipotezę, że 35% wszystkich studentów ma IQ wyższy niż 115 
a_hipoteza <- 0.35

# i) za pomocą testu Z, 

a_test_Z <- function(hipoteza)
{
  procent_powyzej_115 <- ile_powyzej_115 / liczebnosc_proby
  
  p <- hipoteza
  SE <- sqrt(p * (1-p) / liczebnosc_proby)
  
  Z <- (procent_powyzej_115 - hipoteza) / SE
  
  return (2 * (1 - pnorm(abs(Z))))
}
a_test_Z(a_hipoteza) # 0.2945074 > 0.05 - dane są zgodne z hipotezą
odp$a_i <- c(a_test_Z(a_hipoteza), "dane są zgodne z hipotezą")

# ii) za pomocą polecenia prop.test

a_prop_test <- function(hipoteza)
{
  p_test <- prop.test(x = ile_powyzej_115, 
                      n = liczebnosc_proby, 
                      p = hipoteza, 
                      correct = FALSE
  )

  return (p_test$p.value)
}
a_prop_test(a_hipoteza) # 0.2945074 > 0,05 - dane są zgodne z hipotezą
odp$a_ii <- c(a_prop_test(a_hipoteza), "dane są zgodne z hipotezą")

odp$a_i
odp$a_ii


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

odp$b_i <- b_prz_ufn_dla_proporcji(b_poziom_ufnosci)

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
odp$b_ii <- b_prop_test(a_hipoteza)

odp$b_i
odp$b_ii

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
odp$c <- c_prz_ufn_dla_sredniej(c_poziom_ufnosci)

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
odp$d <- d_prz_ufn_t_student(d_poziom_ufnosci)

odp$c
odp$d

# e) Przetestować hipotezę, że średni IQ studentów wynosi 115. Wyznaczyć
# odpowiednią wartość p za pomocą 
e_hipoteza <- 115

e_policz_statystyke <- function(hipoteza)
{
  SE <- std_proby / sqrt(liczebnosc_proby)
  
  statystyka <- (sr_proby - hipoteza) / SE
  
  return (abs(statystyka))
}

# i) testu Z, 

e_test_Z <- function(hipoteza)
{
  return (2 * (1 - pnorm(e_policz_statystyke(hipoteza))))
}
e_test_Z(e_hipoteza) # 6.334248e-05 < 0.05 - odrzucam
odp$e_i <- c(e_test_Z(e_hipoteza), "odrzucam")

# ii) testu T (studenta).

e_test_T <- function(hipoteza)
{
  return (2 * (1 - pt(e_policz_statystyke(hipoteza), df = liczebnosc_proby - 1)))
}
e_test_T(e_hipoteza) # 0.0001222515 < 0.05 - odrzucam
odp$e_ii <- c(e_test_T(e_hipoteza), "odrzucam")

odp$e_i
odp$e_ii

# if p is low the null must go


odp
