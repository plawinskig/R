# Zad. 2 i) Utworzyć następujące macierze. 
# Uwaga: Używać każdej z funkcji „matrix”, „cbind” oraz „rbind” przynajmniej raz.
# 𝐴 = (
#   3 1 2
#   4 5 3
# ) ; 𝐵 = (
#   −1 2
#   3 −4
#   −5 6
# ) ; 𝐶 = (
#   7 3
#   2 1
# ) ; 𝐷 = (
#   1 2 4
#   3 5 7
#   5 7 11
# )

(A <- matrix(c(3,1,2,4,5,3), nrow = 2, byrow = TRUE))
(B <- cbind(c(-1,3,-5),c(2,-4,6)))
(C <- matrix(c(2,1,3,7)[c(4,3,1,2)], 2, byrow = TRUE))
(D <- rbind(c(1,2,4),c(3,5,7),c(5,7,11)))

# ii) Wyznaczyć 

# a) AT+B, 
t(A) + B

# b) A+BT, 
A + t(B)

# c) AB
A %*% B

# d) A*A, 
A * A

# e) D-1, 
solve(D)

# f) DD-1
D %*% solve(D)

# iii) Rozwiązać równania 
# a) CX = A, 
(X <- solve(C, A))
(X <- solve(C) %*% A)

# b) XD=A
(X <- A %*% solve(D))

