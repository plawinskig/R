## i)

(A <- rbind(c(-3, 1, -2), c(4, -5, 3)))
(B <- cbind(c(1, 3, 5), c(2, 4, 6)))
(C <- matrix(c(7,-3,-2,1), nrow = 2, byrow = TRUE))
(D <- matrix(c(1, 3, 2, 2, 5, 3, 4, 7, 2), ncol = 3))

## ii)

# A+B nie da sie
t(A)+B
B %*% A
B * B
solve(C)
C %*% solve(C)

## iii)

# XC = B
# XCC` = BC`
# X = BC`
(X = B %*% solve(C))

# DX = B
# D`DX = D`B
# X = D`B
(X = solve(D) %*% B)


