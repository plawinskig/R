# Wzrost studentów X ma rozkład normalny z wartością oczekiwaną 170cm a wariancja 144cm2. Niech X
# będzie wzrost losowo wybranego studenta. Wyznaczyć
srednia <- 170 # cm
wariancja <- 144 # cm^2
std <- sqrt(wariancja)

# i) P(X > 180)
pnorm(q = 180, srednia, std, lower.tail = FALSE)
1- pnorm(q = 180, srednia, std)

# ii) P(X < 165)
pnorm(q = 165, srednia, std)

# iii) P(155 < X < 190)
pnorm(q = 190, srednia, std) - pnorm(q = 155, srednia, std)

# iv) Wzrost k, taki że 10% osób jest wyższe niż k.
q <- qnorm(p = 0.1, srednia, std, lower.tail = FALSE)
pnorm(q, srednia, std, lower.tail = FALSE)

q <- qnorm(p = 1 - 0.1, srednia, std)
1 - pnorm(q, srednia, std)

