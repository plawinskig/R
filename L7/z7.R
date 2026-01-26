odp <- list()
bakteria <- read.csv2("bakteria.csv", dec = ",")
head(bakteria)

# a. Sporządzić wykres rozrzutu masy bakterii względem czasu.
plot(bakteria$czas, bakteria$masa,
     main = "Wzrost Bakterii",
     xlab = "Czas", ylab = "Masa"
     )

# b. Zbudować model, który opisuje logarytm z masy bakterii (Y) jako liniową funkcję czasu (T).
bakteria$log_masa <- log(bakteria$masa)
head(bakteria)
# ln(masa) = 3.102 + 0.2004 t

model <- lm(log_masa ~ czas, data = bakteria)
odp$b <- summary(model)

# c. W oparciu o model z d), oszacować masę bakterii za pomocą regresji wykładniczej.
b0 <- coef(model)[1] # intercept (ln(A))
b1 <- coef(model)[2] # slope (B)

A <- exp(b0)
B <- b1
odp$c <- paste("Masa(t) =", round(A,2), "* exp(", round(B,4), "* t)")
# bakterie startowaly z poziomu 22 jednostek i rosna w tempie 20% na kazda jednostke czasu
curve(A * exp(B * x), add = TRUE, col = "pink", lwd = 2)

# odp
odp


