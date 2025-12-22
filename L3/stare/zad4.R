# Telefony przychodzą do pewnej centrali losowo z stałą intensywnością 4 na minutę. 
# Niech T będzie czasem między dwoma telefonami. 
# Wyznaczyć prawdopodobieństwo tego, iż czas między telefonami jest

lambda <- 4 # 4 telefony na minute

# i) większy niż 30s.
# P(T > 30 s) = P(T > 0.5 min)
t <- 30 / 60 # 0.5 min
Pi <- pexp(t, lambda, lower.tail = FALSE) # P(T > t)
Pi
  
# ii) mniejszy niż 20s.
# P(T < 20) = P(T < 1/3 min)
t <- 20 / 60
Pii <- pexp(t, lambda)
Pii

# iii) między 40 a 80s.
# P(a < T < b) = P(T < b) - P(T < a)
t1 <- 40 / 60
t2 <- 80 / 60
Piii <- pexp(t2, lambda) - pexp(t1, lambda)
Piii

# iv) Wyznaczyć czas t taki, że p’stwo, 
# iż czas między telefonami jest większy niż t wynosi 0,2.
# P(T > t) = 0.2
p <- 0.2
t_minuty <- qexp(p, lambda, lower.tail = FALSE)
t_minuty * 60 

# v) Narysować wykres gęstości zmiennej T na przedziale 0 ≤ 𝑡 ≤ 3.
# [funkcja: plot, type=”l”, wynaczyć gęstość g(x) dla 𝑥 ∈ {0,0.01,0.02, … ,2.99,3}].
t_values <- seq(from = 0, to = 3, by = 0.01)
Piv <- dexp(t_values, lambda)
plot(
  t_values, 
  Piv, 
  type = "l", # lines
  lwd = 3, # line width
  las = 1, # poziome labele na osi y
  main = "Rozkład X ~ Exp(4)",
  xlab = "Czas T w minutach",
  ylab = "Gęstość prawdopodobieństwa g(t)",
)
grid()

