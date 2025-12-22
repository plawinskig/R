# Zad.1 i) Utworzyć następujące wektory

# a) a=(1, 4, 6, 13, -10, 8)
(a <- c(1, 4, 6, 13, -10, 8))

# b) b=(1, 3, 5, …, 101)
(b <- seq(from = 1, to = 101, by = 2))

# c) c=(4, 4, 4, 7, 7, 7, 9, 9, 9)
(c <- rep(c(4,7,9), each = 3))

# d) d=(“czy”, “to”, “jest, “wektor”, NA)
(d <- c("czy", "to", "jest", "wektor", NA))

# e) e=(“czy”, “to”, “jest”, “wektor”, “NA”)
(e <- c("czy", "to", "jest", "wektor", "NA"))

# f) f=(4, 7, 9, 4, 7, 9, 4, 7, 9, 4, 7, 9, 4, 7, 9, 4, 7, 9)
(f <- rep(c(4,7,9), times = 6))


# ii) Dla każdego wektora korzystając z odpowiednich funkcji podać długość, typ danych, element
# “najmniejszy” oraz “największy”, sumę elementów.
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

# iii) Posortować wektory d) oraz e)
sort(d)
sort(e)

# iv) Wyznaczyć 
# a) a+f, 
a + f

# b) a*f, 
a * f

# c) a+c, 
a + c

# d) a+10, 
a + 10

# e) 15a 
15 * a

# f) 26-ty element wektora b, 
b[26]

# g) 6-ty do 10-tego elementu (włącznie) wektora f.
f[6:10]

# v) Które elementy w wektorze b, oraz ile, jest większe niż 50?
b[b > 50]
length(b[b > 50])


  