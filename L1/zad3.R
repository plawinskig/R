# Zad. 3 i) Utworzyć następujące wektory

# a) a=(300, 297, 294 …, 0)
(a <- seq(from = 300, to = 0, by = -3))

# b) b=(“one”, “two”, “three, “four”, 5)
(b <- c("one", "two", "three", "four", 5))

# c) c=(“one”, “two”, “three, “four”, “5”)
(c <- c("one", "two", "three", "four", "5"))

# d) d=(3, 1, 6, 3, 1, 6, 3, 1, 6, 3, 1, 6)
(d <- rep(c(3,1,6), times = 4))

# e) e=(3, 3, 3, 3, 1, 1, 1, 1, 6, 6, 6, 6)
(e <- rep(c(3,1,6), each = 4))

# f) f=(5, 1, 4, 7)
(f <- c(5,1,4,7))

# ii) Dla każdego wektora korzystając z odpowiednich funkcji podać długość, typ danych, element
# “najmniejszy” oraz “największy”, sumę.
zrob_ii <- function(v) 
{
  print(length(v))
  print(typeof(v))
  print(min(v))
  print(max(v))
  if (is.numeric(v)) 
  {
    print(sum(v))
  }
}

zrob_ii(a)
zrob_ii(b)
zrob_ii(c)
zrob_ii(d)
zrob_ii(e)
zrob_ii(f)

# iii) Posortować wektory b) oraz e)
sort(b)
sort(e)

# iv) Wyznaczyć 

# a) d+f, 
d + f

# b) iloczyn skalarny 𝑑 ∘ 𝑒 (wskazówka: należy zsumować iloczyn odpowiadających sobie elementów), 
dot_prod <- function(v1, v2)
{
  sum(v1 * v2)
}
dot_prod(d, e)

# c) 35-ty element wektora a, 
a[35]

# d) 67-ty do 85-tego elementu wektora a. 
a[67:85]

# e*) iloczyn wektorowy d  e
# nie da sie, tylko dla trzech
cross_prod <- function(v1, v2) 
{
  x <- v1[2] * v2[3] - v1[3] * v2[2]
  y <- v1[3] * v2[1] - v1[1] * v2[3]
  z <- v1[1] * v2[2] - v1[2] * v2[1]
  
  c(x,y,z)
}
x <- c(1,2,3)
y <- c(4,5,6)
cross_prod(x, y)

# v) Które elementy w wektorze a, oraz ile, jest mniejsze niż 100?
a[a < 100]
length(a[a < 100])
