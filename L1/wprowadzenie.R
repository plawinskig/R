# wektory
# ręcznie (c) jak combine
moj_wektor <- c(2, 5, 11, -3)
moj_wektor
imiona <- c("Anna", "Tomasz")
imiona

# dwukropek (:)
1:10 # To samo co c(1, 2, 3, ..., 10)
10:1 # To samo co c(10, 9, 8, ..., 1)

# sekwencje (seq)
seq(from = 1, to = 10, by = 2) # 1, 3, 5, 7, 9

# powtórzenia (rep)
rep(c(1, 2), times = 3) # powtarza cały wektor 3 razy: 1, 2, 1, 2, 1, 2
rep(c(1, 2), each = 3) # powtarza każdy element 3 razy: 1, 1, 1, 2, 2, 2

# -------

# typy danych

# liczby
4
5

# tekst (Character)
"4.5"

# NA (Not Aavailable)
# dziura w danych, nie tekst, nie liczba
# "NA" != NA

# -------

# badanie wektora

x <- 1:10
length(x) # ile ma elementów?
class(x)  # czy to liczby, czy tekst?
typeof(x) # - || -
min(x) # min
max(x) # max
sum(x) # suma
sort(x) # sortowanie rosnące

# -------

# działania na wektorach

# działania element po elemencie

a <- c(1, 2)
b <- c(10, 20)
a + b # 11, 22
a * b # 10, 40

# recykling
a <- c(1, 2)           # len = 2
b <- c(10, 20, 30, 40) # len = 4
      # c(1, 2, 1, 2) + c(10, 20, 30, 40)
a + b # wynik: 11, 12, 31, 42

# -------

# macierze
                  # jedno z dwóch
matrix(c(1,2,3,4), nrow = 2, ncol = 2) # tnie wektor wierszami
matrix(c(1,2,3,4), nrow = 2, ncol = 2, byrow = TRUE) # tnie wektor kolumnami
A <- rbind(c(2,1,3), c(7,6,9), c(4,2,0)) # skleja wektory wierszami (row bind)
B <- cbind(c(1,2,3), c(4,5,6), c(7,8,9)) # skleja wektory kolumnami (column bind)
A
B

# mnożenie elementarne
A * B

# mnożenie macierzowe
A %*% B

# transpozycja
t(A)

# wyznacznik
det(A)
det(B)

# macierz odwrotna
solve(A)

# jeżeli A*x = B to x = A^-1 * B
solve(A, B)
