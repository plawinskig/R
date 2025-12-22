## i)

(A <- rbind(c(3, 1, 2), c(4, 5, 3)))
(B <- cbind(c(-1, 3, -5), c(2, -4, 6)))
(C <- matrix(c(7,3,2,1), nrow = 2, byrow = TRUE))
(D <- matrix(c(1, 3, 5, 2, 5, 7, 4, 7, 11), ncol = 3))

## ii)

# A+B nie da sie
A+t(B)
A %*% B
A * A
solve(D)
D %*% solve(D)

## iii)

# CX = A
# C`CX = C`A
# X = C`A
(X = solve(C) %*% A)

# XD = A
# XDD` = AD`
# X = AD`
(X = A %*% solve(D))


