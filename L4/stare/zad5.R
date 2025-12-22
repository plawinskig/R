# Niech X będzie zmienną losową o gęstości 𝑔(𝑥) = 0,5𝑥 dla 0 ≤ 𝑥 ≤ 2, a 𝑔(𝑥) = 0 poza tym.
# a.

# i. Napisać algorytm, który losuje realizację z tego rozkładu za pomocą metody odwracania dystrybuanty.

# G(x) = [0.25t^2]0->x = 0.25x^2
# G^-1(x) = sqrt(4x) = 2*sqrt(x), x nal. [0,2]

# 1. wylosuj u z U[0,1]
# 2. oblicz x = 2 * sqrt(u)
# 3. zwroc x

# ii. Wygenerować 200 realizacji z tego rozkładu za pomocą tego algorytmu.

n <- 200
u <- runif(n)
x_rev <- 2 * sqrt(u)

hist(x_rev,
     freq=FALSE,
     breaks=15,
     main="metoda odwracania dystrybuanty",
     xlim=c(0,2)
     )
curve(0.5*x, add=TRUE, lwd=2)

# iii. Napisać własny (tym razem nie wykorzystujemy gotowej funkcji) algorytm,
# który losuje realizację z tego rozkładu za pomocą metody przyjęcia i odrzucenia.

# max(g) = g(2) = 0.5*2 = 1
# bo g(x) = 0.5x na [0,2] jest rosnaca
# u_check < g(x)/M = 0.5x/1 = 0.5x
# u_check < 0.5x

# 1. wylosuj x_prop z U[0,2]
# 2. wylosuj u_check z U[0,1]
# 3. jeżeli u_check < 0.5*x_prop
#    to zaakceptuj x_prop
#    inaczej odrzuć i wróć do 1.

# iv. Wygenerować 200 realizacji z tego rozkładu za pomocą tego algorytmu.

n <- 200
x_acc <- numeric(n)
accepted <- 0

min = 0
max = 2
g <- function(x){0.5*x}
M <- g(max)

while(accepted < n)
{
  x_prop <- runif(1, min = 0, max = 2) # U[0,2]
  u_check <- runif(1)
  
  if(u_check < g(x_prop) / M)
  {
    accepted <- accepted + 1
    x_acc[accepted] <- x_prop
  }
}

hist(x_acc,
     freq=FALSE,
     breaks=15,
     main="metoda przyjęcia i odrzucenia",
     xlim=c(0,2)
     )
curve(g, add=TRUE, lwd=2)

