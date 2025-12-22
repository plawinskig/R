# Niech X będzie zmienną losową o gęstości 𝑔(𝑥) = 0,5𝑥 
# dla 0 ≤ 𝑥 ≤ 2, a 𝑔(𝑥) = 0 poza tym.
# a.
# i. Napisać algorytm, który losuje realizację z tego rozkładu
# za pomocą metody odwracania dystrybuanty.

# g(x) = 0.5x
# G(x) = 0.25x^2
# G^-1(x) = sqrt(4x) = 2*sqrt(x)

g <- function(x)
{
  return (ifelse(x < 0 | x > 2, 0.0, 0.5 * x))
}

odwr_dyst <- function(x) 
{
  return(ifelse(x < 0 | x > 2, 0.0, 2.0 * sqrt(x)))
}

wylosuj_i <- function(n, odw_dyst)
{
  u <- runif(n)
  return (odw_dyst(u))
}

# ii. Wygenerować 200 realizacji z tego rozkładu za pomocą tego algorytmu.

res <- wylosuj_i(200, odwr_dyst)
hist(res, 
     prob=TRUE,
     main="Metoda odwracania dystrybuanty"
     )
curve(g, add=TRUE, lwd=2)

# iii. Napisać własny (tym razem nie wykorzystujemy gotowej funkcji) algorytm,
# który losuje realizację z tego rozkładu za pomocą metody przyjęcia i odrzucenia.

wylosuj_iii <- function(n, gestosc, max_gestosc, przedzial)
{
  res <- numeric(n)
  i <- 0
  while(i < n)
  {
    x <- runif(1, min = przedzial[1], max = przedzial[2])
    u <- runif(1)
    
    if(u < gestosc(x) / max_gestosc)
    {
      res[i] <- x
      i <- i + 1
    }
  }
  
  return (res)
}

# iv. Wygenerować 200 realizacji z tego rozkładu za pomocą tego algorytmu.

max_g <- g(2)
res <- wylosuj_iii(200, g, max_g, c(0,2))
hist(res, 
     prob=TRUE,
     main="Metoda przyjęcia i odrzucenia"
)
curve(g, add=TRUE, lwd=2)








