# a)
imie <- c("Krzysztof", "Maria", "Henryk", "Anna")
plec <- c('m', 'k', 'm', 'k')
analiza <- c(3.5, 4.5, 5.0, 4.5)
algebra <- c(4.0, 5.0, 4.0, 3.5)
oceny <- data.frame(imie, plec, analiza, algebra)
names(oceny) <- c("Imie", "Plec", "Analiza", "Algebra")
oceny

# b)
# oceny[1:2, ]
head(oceny, 2)

# c)
str(oceny)

# d)
mean(oceny$Analiza)

# e)
# oceny[,3:4]
# (oceny$Srednia <- (oceny$Analiza + oceny$Algebra) / 2)
# oceny
(oceny$Srednia <- rowMeans(oceny[, c("Analiza", "Algebra")]))
oceny

# f)
(oceny_kobiety <- oceny[oceny$Plec == "k",])

# g)
algebra_min_4.5 <- oceny$Algebra >= 4.5
analiza_min_4.5 <- oceny$Analiza >= 4.5
(oceny_min4.5 <- oceny[algebra_min_4.5 | analiza_min_4.5, ])

# h)
oceny$Analiza
oceny$Analiza >= 4.5
sum(oceny$Analiza >= 4.5)
