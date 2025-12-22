# Wzrost studentów X ma rozkład normalny z wartością oczekiwaną 170cm a wariancja 144cm2. 
# Niech X będzie wzrost losowo wybranego studenta. Wyznaczyć
wart_ocz <- 170
wariancja <- 144
(odch_std <- sqrt(wariancja))
# X ~ N(170, 12)

# i) P(X > 180)
# student wyższy niż 180 cm
Pi <- pnorm(q = 180, mean = wart_ocz, sd = odch_std, lower.tail = FALSE)
Pi

# ii) P(X < 165)
# student niższy niż 165 cm
Pii <- pnorm(q = 165, mean = wart_ocz, sd = odch_std)
Pii

# iii) P(155 < X < 190)
Piii <- pnorm(q = 190, mean = wart_ocz, sd = odch_std) - pnorm(q = 155, mean = wart_ocz, sd = odch_std)
Piii

# iv) Wzrost k, taki że 10% osób jest wyższe niż k
# k: P(X > k) = 0.10
# 10% w górnym ogonie
k <- qnorm(p = 0.10, mean = wart_ocz, sd = odch_std, lower.tail = FALSE)
k 
# P(X > k) = 0.10
Piv <- pnorm(q = k, mean = wart_ocz, sd = odch_std, lower.tail = FALSE)
Piv # zgadza sie

