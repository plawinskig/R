n <- 10
# Proporcja

# ręcznie

# Z = (Wynik% - Hipoteza%) / błąd standardowy

# w R

liczba_sukcesów <- 50
liczebność_próby <- 100
hipoteza_H0 <- 0.45

prop.test(x = liczba_sukcesów, 
          n = liczebność_próby, 
          p = hipoteza_H0, 
          correct = TRUE
          )


# Przedziały Ufności (Ręcznie)

# estymator +- (kwantyl * błąd standardowy)

# estymator - średnia lub proporcja
# kwantyl - liczba z tablic 
#   Z (normalny)
    qnorm(0.975) # (dla 95% ufności mamy 5%/2 = 2.5%)
#   T (student)
    qt(0.975, df = n-1)
# błąd standardowty 
    # dla średniej SE = s / sqrt(n)
    # dla proporcji SE = sqrt(p*(1-p)/n)

# Gdy liczysz Przedział Ufności (nie znasz prawdy) 
  # -> Używasz proporcji z próby w mianowniku.
# Gdy robisz Test Hipotez (udajesz, że znasz prawdę z $H_0$) 
  # -> Używasz proporcji z hipotezy w mianowniku.
    
# Testowanie Hipotez (automat)

t.test(c(1,2,3,4), mu = 3)    
    
