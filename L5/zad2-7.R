waga <- read.csv2("waga1.csv")
head(waga)

odp <- list()


# 2. Przetestować hipotezę, że średni wzrost wszystkich studentów wynosi 170cm za
# pomocą polecenia t.test

t_test <- t.test(waga$Wzrost, mu = 170)
t_test
t_test$p.value 
# 0.0003244236 < 0.05 zatem odrzucam
odp$zad2 <- c(t_test$p.value, "odrzucam")


# 3. Wyznaczyć przedział ufności dla średniego wzrostu wszystkich studentów 
# (obu  płci) na poziomie ufności 90%.

t_test <- t.test(waga$Wzrost, conf.level = 0.9)
t_test
t_test$conf.int
as.numeric(t_test$conf.int)
# (162.6116, 167.1662)
odp$zad3 <- as.numeric(t_test$conf.int)


# 4. Przetestować hipotezę, że średni wzrost studentek wynosi 160cm za pomocą
# polecenia t.test

kobieta <- waga$plec == 1
studentki <- waga[kobieta, ]
head(studentki)

t_test <- t.test(studentki$Wzrost, mu = 160)
t_test
t_test$p.value 
# 0.3574295 > 0.05 zatem dane są zgodne z hipotezą
odp$zad4 <- c(t_test$p.value, "dane są zgodne z hipotezą")


# 5. Wyznaczyć przedział ufności dla średniego wzrostu studentek na poziomie
# ufności 98%.

t_test <- t.test(studentki$Wzrost, conf.level = 0.98)
t_test
t_test$conf.int
as.numeric(t_test$conf.int)
# (154.0376 162.6432)
odp$zad5 <- as.numeric(t_test$conf.int)


# 6. Przetestować hipotezę, że proporcja studentów (płci męskiej) wyższych niż
# 180cm wynosi 25% za pomocą polecenia prop.test

mezczyzna <- waga$plec == 0
mezczyzni <- waga[mezczyzna, ]

liczba_wysokich <- sum(mezczyzni$Wzrost > 180) 
liczba_wszystkich <- nrow(mezczyzni)

test_6 <- prop.test(liczba_wysokich, liczba_wszystkich, p = 0.25)
test_6$p.value
# 0.630954 > 0.05 zatem dane są zgodne z hipotezą
odp$zad6 <- c(test_6$p.value, "dane są zgodne z hipotezą")


# 7. Wyznaczyć przedział ufności dla proporcji studentów (płci męskiej) wyższych
# niż 180cm na poziomie ufności 96%.

test_7 <- prop.test(liczba_wysokich, liczba_wszystkich, conf.level = 0.96)
as.numeric(test_7$conf.int)
# 0.1120782 0.3576638
odp$zad7 <- as.numeric(test_7$conf.int)


odp
