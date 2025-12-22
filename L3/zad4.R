# Telefony przychodzą do pewnej centrali losowo z stałą intensywnością 4 na minutę. Niech T będzie
# czasem między dwoma telefonami. Wyznaczyć prawdopodobieństwo tego, iż czas między telefonami jest
rate <- 4 # tel / min

# i) większy niż 30s.
pexp(q = 30 / 60, rate, lower.tail = FALSE)
pexp(q = 30, rate / 60, lower.tail = FALSE)

# ii) mniejszy niż 20s.
pexp(q = 20 / 60, rate)

# iii) między 40 a 80s.
pexp(q = 80 / 60, rate) - pexp(q = 40/60, rate)

# iv) Wyznaczyć czas t taki, że p’stwo, iż czas między telefonami jest większy niż t wynosi 0,2.
qexp(p = 0.2, rate, lower.tail = FALSE) * 60

# v) Narysować wykres gęstości zmiennej T na przedziale 0 ≤ 𝑡 ≤ 3.
# [funkcja: plot, type=”l”, wynaczyć gęstość g(x) dla 𝑥 ∈ {0,0.01,0.02, … ,2.99,3}].
x <- seq(from = 0, to = 3, by = 0.01)
y <- dexp(x, rate)
plot(x, y,
     type = "l",
     lwd = 3,
     las = 1,
     main = "Rozkład Exp(4)",
     xlab = "Czas (min)",
     ylab = "Gęstośc p'stwa"
     )

